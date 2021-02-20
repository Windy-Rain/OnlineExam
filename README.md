# OnlineExam在线考试系统

### 项目介绍

OnlineExam是基于SpringBoot、MyBatis、Shiro、Thymeleaf、MySql、Redis、Maven实现的单体在线考试平台，用于辅助课程教学和学生学习使用，该项目是本人毕业设计作品，现开放完整项目源码以供各位同学学习和交流。

### 功能列表
- 考试前台

 ✔ 系统登录：学生、教师、管理员登录
 
 ✔ 门户首页：无需认证访问
 
 ✔ 在线考试：需认证即可查看当前考试科目
 
 ✔ 题库中心：需认证查看题库
 
 ✔ 成绩查询：需认证查询成绩
 
 ✔ 留言板：  需认证留言

- 管理后台

 ✔ 考试管理：发布考试，考试列表，课程管理，题库管理，成绩管理，成绩情况
 
 ✔ 权限管理：学院管理，班级管理，用户管理，角色管理，资源管理
 
 ✔ 网站管理：基础信息，友链管理，评论管理，标签管理
 
 ✔ 系统管理：在线用户
 
 ✔ 上传管理：云存储配置
 
 ✔ 运维管理：数据监控

### 软件架构

##### 开发环境

- IDE : idea 2019.x
- JDK : JDK1.8.x
- Maven : Maven 3.5.x
- MySQL: MySQL 5.7.x
- Redis: Redis 5.0.x

##### 技术选型

- 核心框架：Spring Boot 2.x
- 安全框架：Shiro 1.4.x
- 视图框架：Spring MVC 5.x
- 持久层框架：MyBatis 3.x
- 模板引擎：Thymeleaf 3.x
- 数据库连接池：Druid 1.x
- 日志管理：SLF4J、Log4j

### 安装教程

#### 后端安装

1. 下载源码

    git clone https://github.com/HungKuei/OnlineExam.git

2. 导入工程

    使用 IDEA导入 Maven 项目，在此之前请确认已安装 JDK 和 Maven 工具。

3. 导入数据库

    新建 online_exam 数据库，导入 OnlineExam 工程 doc/db/online_exam.sql 脚本，导入初始化数据库。

    修改 application.yml 中的数据库和redis连接账号密码为自己的数据库配置。

4. 启动系统

    找到 OnlineExam 工程下的 OnlineExamApplication.java， 启动项目。
  
5. 访问
  
    访问首页：http://localhost，默认管理员账号：admin, admin123
      
### 系统展示

#### 登录界面

![输入图片说明](https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/github/login.png "屏幕截图.png")

#### 考试首页

![输入图片说明](https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/github/index.png "屏幕截图.png")

#### 管理后台

![输入图片说明](https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/github/manager.png "屏幕截图.png")

#### 数据监控

用户名：admin, 密码:123456，即服务端配置的密码

#### 云存储配置

默认开启腾讯云存储，这里配置自己申请的SecretId，SecretKey即可

#### 请作者喝杯茶

![输入图片说明](https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/github/weixin.jpg "wx_samll.png")

### 技术交流

为了方便大家提问和技术交流，整了个QQ群，欢迎童鞋们加入。

QQ技术交流群： 740639722

