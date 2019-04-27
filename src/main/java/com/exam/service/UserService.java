package com.exam.service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.exam.model.User;
import com.exam.vo.UserConditionVo;
import com.exam.vo.UserOnlineVo;
import com.exam.vo.base.ResponseVo;

public interface UserService extends BaseService<User> {
	
	/**
	 * 分页条件查询，关联学院，班级，角色
	 * @param vo
	 * @return
	 */
	List<User> findByCondition(UserConditionVo vo);

    /**
     * 根据用户名查询用户
     * @param username
     * @return user
     */
    User selectByUsername(String username);

    /**
     * 注册用户
     * @param user
     * @return int
     */
    int register(User user);

    /**
     * 更新最后登录时间
     * @param user
     */
    void updateLastLoginTime(User user);

    /**
     * 根据条件查询用户列表
     * @param user
     * @return list
     */
    List<User> selectUsers(User user);

    /**
     * 根据用户id查询用户
     * @param userId
     * @return user
     */
    User selectByUserId(String userId);

    /**
     * 根据用户id更新用户信息
     * @param user
     * @return int
     */
    int updateByUserId(User user);

    /**
     * 根据用户id集合批量更新用户状态
     * @param userIds
     * @param status
     * @return int
     */
    int updateStatusBatch(List<String> userIds, Integer status);

    /**
     * 根据用户id分配角色集合
     * @param userId
     * @param roleIds
     * @return int
     */
    ResponseVo addAssignRole(String userId, List<String> roleIds);

    /**
     * 根据主键更新用户信息
     * @param user
     * @return int
     */
    int updateUserByPrimaryKey(User user);


    List<UserOnlineVo> selectOnlineUsers(UserOnlineVo userOnlineVo);


    void kickout(Serializable sessionId, String username);
    
    /**
     * 年级List
     * @return
     */
    List<String> selectGradeList();
    
    /**
     * 学院及学员人数统计
     */
    List<HashMap<String, Object>> academyPassNumSta();
    
    int userNums();

    /**
     * 批量导入用户
     * @param file
     * @return
     */
	ResponseVo importUserExcel(MultipartFile file);

}
