package com.exam.mapper;

import java.util.List;

import com.exam.model.ExamQuestion;
import com.exam.util.MapperUtil;

public interface ExamQuestionMapper extends MapperUtil<ExamQuestion>{

	List<ExamQuestion> selectByExamId(Integer examId);

	int deleteBatch(Integer[] ids);
	
	

}
