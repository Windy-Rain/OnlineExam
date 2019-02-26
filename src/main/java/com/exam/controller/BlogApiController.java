package com.exam.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.exam.model.BizComment;
import com.exam.service.BizCommentService;
import com.exam.util.IpUtil;
import com.exam.util.MD5;
import com.exam.util.ResultUtil;
import com.exam.util.XssKillerUtil;
import com.exam.vo.CommentConditionVo;
import com.exam.vo.base.ResponseVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("blog/api")
public class BlogApiController {
    @Autowired
    private BizCommentService commentService;

    @PostMapping("comments")
    public PageInfo<BizComment> getComments(CommentConditionVo vo){
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<BizComment> comments = commentService.selectComments(vo);
        PageInfo<BizComment> pages = new PageInfo<>(comments);
        return pages;
    }

    @PostMapping("comment/save")
    public ResponseVo saveComment(HttpServletRequest request, BizComment comment) throws UnsupportedEncodingException {
        if (org.springframework.util.StringUtils.isEmpty(comment.getNickname())) {
            return ResultUtil.error("请输入昵称");
        }
        String content = comment.getContent();
        if (!XssKillerUtil.isValid(content)) {
            return ResultUtil.error("内容不合法");
        }
        content = XssKillerUtil.clean(content.trim()).replaceAll("(<p><br></p>)|(<p></p>)", "");
        Date date = new Date();
        comment.setContent(content);
        comment.setIp(IpUtil.getIpAddr(request));
        comment.setCreateTime(date);
        comment.setUpdateTime(date);
        if(StringUtils.isNotBlank(comment.getQq())){
            comment.setAvatar("http://q1.qlogo.cn/g?b=qq&nk="+comment.getQq()+"&s=100");
        }else if(StringUtils.isNotBlank(comment.getEmail())){
            String entry = MD5.md5Hex(comment.getEmail());
            comment.setAvatar("http://www.gravatar.com/avatar/"+entry+"?d=mp");
        }
        int a = commentService.insertSelective(comment);
        if(a>0){
            return ResultUtil.success("评论提交成功,系统正在审核");
        }else{
            return ResultUtil.error("评论提交失败");
        }
    };

}
