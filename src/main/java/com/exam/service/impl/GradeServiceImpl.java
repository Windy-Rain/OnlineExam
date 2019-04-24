package com.exam.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.mapper.GradeMapper;
import com.exam.model.Grade;
import com.exam.service.GradeService;
import com.exam.vo.GradeConditionVo;
import com.exam.vo.StatisticConditionVo;

@Service
public class GradeServiceImpl extends BaseServiceImpl<Grade> implements GradeService {
	
	@Autowired
	private GradeMapper gradeMpper;
	
	@Override
	public List<Grade> findByCondition(GradeConditionVo vo) {
		List<Grade> list = gradeMpper.findByCondition(vo);
		return list;
	}

	@Override
	public Grade insertGrade(Grade grade) {
		Date date = new Date();
		grade.setCreateTime(date);
		grade.setUpdateTime(date);
		gradeMpper.insertSelective(grade);
		return grade;
	}

	@Override
	public Grade selectById(Integer id) {
		return gradeMpper.selectById(id);
		
	}

	@Override
	public int deleteBatch(Integer[] ids) {
		return gradeMpper.deleteBatch(ids);
	}

	@Override
	public Grade validateExam(Integer id, String userId) {
		return gradeMpper.validateExam(id,userId);
	}

	@Override
	public List<HashMap<String, Object>> examUserNumsAnalysis(StatisticConditionVo vo) {
		
		List<HashMap<String, Object>> totalUserNums = gradeMpper.totalUserNums(vo);
		List<HashMap<String, Object>> passUserNums = gradeMpper.passUserNums(vo);
		List<HashMap<String, Object>> noPassUserNums = gradeMpper.noPassUserNums(vo);
		List<HashMap<String, Object>> goodUserNums = gradeMpper.goodUserNums(vo);
		List<HashMap<String, Object>> fineUserNums = gradeMpper.fineUserNums(vo);
		for(Map<String,Object> totalMap : totalUserNums) {
			if(!passUserNums.isEmpty()) {
				for(Map<String,Object> passMap : passUserNums) {
					if(totalMap.get("title").equals(passMap.get("title"))) {
						totalMap.put("passNums", passMap.get("passNums"));
					}else {
						totalMap.put("passNums", 0);
					}
				}
			}else {
				totalMap.put("passNums", 0);
			}
			
			if(!noPassUserNums.isEmpty()) {
				for(Map<String,Object> noPassMap : noPassUserNums) {
					if(totalMap.get("title").equals(noPassMap.get("title"))) {
						totalMap.put("noPassNums", noPassMap.get("noPassNums"));
					}else {
						totalMap.put("noPassNums", 0);
					}
					
				}
			}else {
				totalMap.put("noPassNums", 0);
			}
			
			if(!goodUserNums.isEmpty()) {
				for(Map<String,Object> goodMap : goodUserNums) {
					if(totalMap.get("title").equals(goodMap.get("title"))) {
						totalMap.put("goodNums", goodMap.get("goodNums"));
					}else {
						totalMap.put("goodNums", 0);
					}
				}
			}else {
				totalMap.put("goodNums", 0);
			}
			if(!fineUserNums.isEmpty()) {
				for(Map<String,Object> fineMap : fineUserNums) {
					if(totalMap.get("title").equals(fineMap.get("title"))) {
						totalMap.put("fineNums", fineMap.get("fineNums"));
					}else {
						totalMap.put("fineNums", 0);
					}
				}
			}else {
				totalMap.put("fineNums", 0);
			}
		}
		return totalUserNums;
	}
}
