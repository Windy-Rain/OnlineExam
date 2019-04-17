package com.exam.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.exam.model.Comment;
import com.exam.model.User;
import com.exam.service.CommentService;
import com.exam.util.CoreConst;
import com.exam.util.IpUtil;
import com.exam.util.PageUtil;
import com.exam.util.ResultUtil;
import com.exam.vo.CommentConditionVo;
import com.exam.vo.base.PageResultVo;
import com.exam.vo.base.ResponseVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("comment")
public class CommentController {

    @Autowired
    private CommentService commentService;
    

    @PostMapping("list")
    public PageResultVo loadNotify(CommentConditionVo comment, Integer limit, Integer offset){
        PageHelper.startPage(PageUtil.getPageNo(limit, offset),limit);
        List<Comment> comments = commentService.selectComments(comment);
        PageInfo<Comment> pages = new PageInfo<>(comments);
        return ResultUtil.table(comments,pages.getTotal(),pages);
    }
    @PostMapping("/reply")
    public ResponseVo edit(Comment comment){
        completeComment(comment);
        int i = commentService.insertSelective(comment);
        if(i>0){
            return ResultUtil.success("回复评论成功");
        }else{
            return ResultUtil.error("回复评论失败");
        }
    }
   
    
    @PostMapping("/delete")
    public ResponseVo delete(Integer id){
        Integer[]ids={id};
        int i = commentService.deleteBatch(ids);
        if(i>0){
            return ResultUtil.success("删除评论成功");
        }else{
            return ResultUtil.error("删除评论失败");
        }
    }
    @PostMapping("/batch/delete")
    public ResponseVo deleteBatch(@RequestParam("ids[]") Integer[]ids){
        int i = commentService.deleteBatch(ids);
        if(i>0){
            return ResultUtil.success("删除评论成功");
        }else{
            return ResultUtil.error("删除评论失败");
        }
    }

    @PostMapping("/audit")
    public ResponseVo audit(Comment bizComment, String replyContent){
        try {
            commentService.updateNotNull(bizComment);
            if(StringUtils.isNotBlank(replyContent)){
                Comment replyComment = new Comment();
                replyComment.setPid(bizComment.getId());
                replyComment.setSid(bizComment.getSid());
                replyComment.setContent(replyContent);
                completeComment(replyComment);
                commentService.insertSelective(replyComment);
            }
            return ResultUtil.success("审核成功");
        } catch (Exception e) {
            return ResultUtil.success("审核失败");
        }
    }

    private void completeComment(Comment comment){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        User user = (User)SecurityUtils.getSubject().getPrincipal();
        comment.setUserId(user.getUserId());
        comment.setNickname(user.getNickname());
        comment.setEmail(user.getEmail());
        comment.setAvatar(user.getImg());
        comment.setIp(IpUtil.getIpAddr(request));
        comment.setStatus(CoreConst.STATUS_VALID);
    }

}
