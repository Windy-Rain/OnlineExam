package com.exam.controller;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.model.Comment;
import com.exam.model.Examination;
import com.exam.model.Grade;
import com.exam.model.Question;
import com.exam.model.Subject;
import com.exam.model.User;
import com.exam.service.CommentService;
import com.exam.service.ExaminationService;
import com.exam.service.GradeService;
import com.exam.service.QuestionService;
import com.exam.service.SubjectService;
import com.exam.util.IpUtil;
import com.exam.util.PageUtil;
import com.exam.util.ResultUtil;
import com.exam.util.XssKillerUtil;
import com.exam.vo.CommentConditionVo;
import com.exam.vo.ExaminationConditionVo;
import com.exam.vo.base.ResponseVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class ExamWebController {
	
	@Autowired
	private ExaminationService examService;
	@Autowired
	private GradeService gradeService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/")
	public String index(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			return "index/index";
		}else {
			return "index/index";
		}
	}

	/**
	 * 考试界面
	 * @param model
	 * @param examConditionVo
	 * @return
	 */
	@GetMapping("/exam/examination")
	public String toExam(Model model, ExaminationConditionVo examConditionVo) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			PageHelper.startPage(PageUtil.getPageNo(10, 0),10);
			List<Examination> examList = examService.findByCondition(examConditionVo);
			PageInfo<Examination> pages = new PageInfo<>(examList);
			model.addAttribute("pageInfo", pages);
			return "index/examination";
		}else {
			return "index/login";
		}
	}
	
	/**
	 * 前端题库中心
	 * @param model
	 * @return
	 */
	
	@GetMapping("/exam/questions")
	public String toQuestion(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			Subject subject = new Subject();
			List<Subject> subjects = subjectService.select(subject);
			for(Subject s : subjects) {
				int num = questionService.countBySubjectId(s.getId());
				s.setNums(num);
			}
			model.addAttribute("subjects", subjects);
			return "index/question";
		}else {
			return "index/login";
		}
	}
	
	/**
	 * 留言板
	 * @return
	 */
	@GetMapping("/exam/comment")
	public String toComment() {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			
			return "index/comment";
		}else {
			return "index/login";
		}
		
	}
	@PostMapping("/exam/comment")
	@ResponseBody
	public PageInfo<Comment> getComments(CommentConditionVo vo){
		PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
		List<Comment> comments = commentService.selectComments(vo);
		PageInfo<Comment> pages = new PageInfo<>(comments);
		return pages;
	}
	
	@PostMapping("/exam/comment/save")
	@ResponseBody
	public ResponseVo saveComment(HttpServletRequest request, Comment comment) throws UnsupportedEncodingException{
		String content = comment.getContent();
		if(!XssKillerUtil.isValid(content)) {
			return ResultUtil.error("内容不合法");
		}
		content = XssKillerUtil.clean(content.trim()).replaceAll("(<p><br></P>)|(<p></p>)", "");
		Date date = new Date();
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		comment.setUserId(user.getUserId());
		comment.setUsername(user.getUsername());
		comment.setNickname(user.getNickname());
		comment.setAvatar(user.getImg());
		comment.setEmail(user.getEmail());
		comment.setContent(content);
		comment.setIp(IpUtil.getIpAddr(request));
		comment.setCreateTime(date);
		comment.setUpdateTime(date);
		int i = commentService.insertSelective(comment);
		if(i > 0) {
			return ResultUtil.success("留言已提交成功，系统正在审核");
		}else {
			return ResultUtil.error("留言提交失败");
		}
	}
	
	@GetMapping("/exam/login")
	public String login(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			return "redirect:/";
		}else {
			return "index/login";
		}
	}
	
	@GetMapping("/exam/startexam")
	public String startToExam(Model model, Integer id) {
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		List<Examination> listExam = examService.queryByExamId(id);
		Map<String, Object> data = new HashMap<>();
		data.put("exam", listExam);
		model.addAttribute("data", data);
		model.addAttribute("user", user);
		return "index/detail";
	}
	
	/**
	 * 验证该用户是否已经参加过考试
	 * @param id
	 * @return
	 */
	@PostMapping("/exam/validate")
	@ResponseBody
	public ResponseVo validate(Integer id) {
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		Grade grade  = gradeService.validateExam(id,user.getUserId());
		if(grade != null) {
			return ResultUtil.error("你已经参加过该场次考试,不能再参加这场考试了，如有疑问请咨询代课教师！");
		}else {
			return ResultUtil.success("你已进入考试，请规范答题，不得离开考试界面，否则成绩不计入考试结果");
		}
	}
	
	/**
	 * 提交考试
	 * @param grade
	 * @return
	 */
	@PostMapping("/exam/submitExam")
	@ResponseBody
	public ResponseVo submitExam(@RequestBody Grade grade) {
		try {
			User user = (User)SecurityUtils.getSubject().getPrincipal();
			List<String> answerStr = Arrays.asList(grade.getAnswerJson().split("~_~"));
			int autoResult = 0;
			StringBuffer autoStr = new StringBuffer();
			StringBuffer manulStr = new StringBuffer();
			List<Examination> listExam = examService.queryByExamId(grade.getExamId());
			List<Question> questions = listExam.get(0).getQuestions();
			for(int i = 0; i < questions.size(); i++) {
				Question question = questions.get(i);
				if(question.getQuestionType() <= 1) {
					autoStr.append(answerStr.get(i)+"~_~");
				}else {
					manulStr.append(answerStr.get(i)+"~_~");
				}
				if(question.getQuestionType() <= 1 && question.getAnswer().equals(answerStr.get(i))) {
					autoResult += question.getScore();
				}
			}
			String autoJson = new String(autoStr);
			String manulJson = new String(manulStr);
			grade.setUserId(user.getUserId());
			grade.setAutoResult(autoResult);
			grade.setResult(autoResult);
			grade.setAutoJson(autoJson);
			grade.setManulJson(manulJson);
			grade.setManulResult(0);
			grade.setStatus(0);
			gradeService.insertSelective(grade);
			return ResultUtil.success("提交考试成功！");
		} catch (Exception e) {
			return ResultUtil.error("提交考试失败！请联系管理员处理");
		}
	}
}
