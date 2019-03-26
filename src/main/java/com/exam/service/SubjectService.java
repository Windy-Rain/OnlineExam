package com.exam.service;

import java.util.List;

import com.exam.model.Question;
import com.exam.model.Subject;

public interface SubjectService extends BaseService<Subject> {
	
	List<Subject> selectSubjects(Subject subject);
	
    int deleteBatch(Integer[] ids);
    
    Subject selectById(Integer id);

    /**
     * 验证该课程是否有子数据
     * @param ids
     * @return
     */
	Question validateBySubjectIds(Integer[] ids);

}
