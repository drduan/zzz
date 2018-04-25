/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : jiaowu

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-04-25 19:34:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `coursename` varchar(30) NOT NULL,
  `teacher` varchar(30) NOT NULL,
  `begintime` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO course VALUES ('1', '英语', '张嬷嬷', '2015-5-10', '1');
INSERT INTO course VALUES ('2', '数学', '李嬷嬷', '2015-5-20', '2');
INSERT INTO course VALUES ('3', '中文', '王嬷嬷', '2015-5-20', '3');
INSERT INTO course VALUES ('4', '天文', '花嬷嬷', '2015-5-20', '4');

-- ----------------------------
-- Table structure for `coursetype`
-- ----------------------------
DROP TABLE IF EXISTS `coursetype`;
CREATE TABLE `coursetype` (
  `id` int(11) NOT NULL,
  `typeName` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coursetype
-- ----------------------------
INSERT INTO coursetype VALUES ('1', 'n');
INSERT INTO coursetype VALUES ('2', 'f');
INSERT INTO coursetype VALUES ('3', 'k');
INSERT INTO coursetype VALUES ('4', 'p');

-- ----------------------------
-- Table structure for `levmessage`
-- ----------------------------
DROP TABLE IF EXISTS `levmessage`;
CREATE TABLE `levmessage` (
  `levID` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` varchar(11) DEFAULT NULL,
  `levName` varchar(255) DEFAULT NULL,
  `levEmail` varchar(255) DEFAULT NULL,
  `levCon` varchar(255) DEFAULT NULL,
  `levTime` datetime DEFAULT NULL,
  `levFlag` int(255) DEFAULT NULL,
  PRIMARY KEY (`levID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of levmessage
-- ----------------------------
INSERT INTO levmessage VALUES ('2', '55', 'q', 'q', 'q', '2018-04-18 14:29:32', '1');
INSERT INTO levmessage VALUES ('13', '64', '1', '1', '1', '2018-04-25 19:33:18', '0');

-- ----------------------------
-- Table structure for `teachertype`
-- ----------------------------
DROP TABLE IF EXISTS `teachertype`;
CREATE TABLE `teachertype` (
  `id` int(11) NOT NULL,
  `typeName` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of teachertype
-- ----------------------------
INSERT INTO teachertype VALUES ('1', 'l');
INSERT INTO teachertype VALUES ('2', 'h');
INSERT INTO teachertype VALUES ('3', 'f');
INSERT INTO teachertype VALUES ('4', 's');

-- ----------------------------
-- Table structure for `t_course`
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `ct_id` int(11) DEFAULT '0',
  `s_id` int(11) DEFAULT '0',
  `c_name` varchar(30) NOT NULL,
  `c_class` varchar(30) NOT NULL,
  `c_record` varchar(30) NOT NULL,
  `c_score` varchar(30) NOT NULL,
  `c_time` varchar(30) NOT NULL,
  `c_week` varchar(30) NOT NULL,
  `c_teacher` varchar(30) NOT NULL,
  `c_where` varchar(30) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO t_course VALUES ('1', null, '5', '计算机基础', '第一学期', '软件工程', '5', '周三 5.6节', '16', '张张', '老师');
INSERT INTO t_course VALUES ('2', null, '1', 'java编程', '第一学期', '软件工程', '4', '周一 56节', '1~10', '张红', 'a7 201');
INSERT INTO t_course VALUES ('3', null, '1', '软件测试', '第二学期', '软件工程', '2', '周一 56节', '1~10', '张红', 'a7 201');
INSERT INTO t_course VALUES ('4', null, '1', '自动化测试', '第二学期', '软件工程', '6', '周三 34节', '1~16', '张三', 'a3 302');
INSERT INTO t_course VALUES ('5', null, '2', '计算机基础', '第一学期', '软件技术', '2', '周一 56节', '1~10', '张红', 'a7 201');
INSERT INTO t_course VALUES ('7', null, '2', '数据结构', '第一学期', '软件技术', '6', '周一 56节', '1~10', '张红', 'a7 201');
INSERT INTO t_course VALUES ('8', null, '1', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('9', null, '3', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('10', null, '3', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('11', null, '3', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('12', null, '3', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('13', null, '3', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('14', null, '3', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('15', null, '3', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('16', '2', '3', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('17', '2', '3', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('18', '4', '1', 'java编程', '第二学期', '软件技术', '8', '周五5,6,7,8节', '1-16周', '张淑', 'a2-203');
INSERT INTO t_course VALUES ('19', '2', '1', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('20', '2', '60', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('21', '5', '60', '软件测试', '第一学期', '软件技术', '4', '周一3,4节', '1-16周', 'q', 'q');
INSERT INTO t_course VALUES ('22', null, '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO t_course VALUES ('23', '2', '2', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('24', '2', '2', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('25', '2', '3', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('26', '2', '62', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5 202 ');
INSERT INTO t_course VALUES ('27', '3', '62', '数据结构', '第一学期', '软件技术', '6', '周一5,6节', '1-10周', '1', 'a1');
INSERT INTO t_course VALUES ('28', '2', '63', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5-202 ');
INSERT INTO t_course VALUES ('29', '2', '63', '数据库', '第二学期', '软件技术', '4', '周四1,2节', '1-16周', '蓝天', 'a5-202 ');

-- ----------------------------
-- Table structure for `t_courseteacher`
-- ----------------------------
DROP TABLE IF EXISTS `t_courseteacher`;
CREATE TABLE `t_courseteacher` (
  `ct_id` int(10) NOT NULL,
  `t_id` int(10) NOT NULL,
  PRIMARY KEY (`ct_id`,`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_courseteacher
-- ----------------------------
INSERT INTO t_courseteacher VALUES ('2', '3');
INSERT INTO t_courseteacher VALUES ('2', '4');
INSERT INTO t_courseteacher VALUES ('3', '5');
INSERT INTO t_courseteacher VALUES ('3', '6');
INSERT INTO t_courseteacher VALUES ('4', '7');
INSERT INTO t_courseteacher VALUES ('4', '8');
INSERT INTO t_courseteacher VALUES ('5', '8');
INSERT INTO t_courseteacher VALUES ('5', '9');

-- ----------------------------
-- Table structure for `t_coursewhere`
-- ----------------------------
DROP TABLE IF EXISTS `t_coursewhere`;
CREATE TABLE `t_coursewhere` (
  `ct_id` int(10) NOT NULL,
  `w_id` int(10) NOT NULL,
  PRIMARY KEY (`ct_id`,`w_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_coursewhere
-- ----------------------------
INSERT INTO t_coursewhere VALUES ('1', '1');
INSERT INTO t_coursewhere VALUES ('1', '2');
INSERT INTO t_coursewhere VALUES ('2', '3');
INSERT INTO t_coursewhere VALUES ('2', '4');
INSERT INTO t_coursewhere VALUES ('3', '5');
INSERT INTO t_coursewhere VALUES ('3', '6');
INSERT INTO t_coursewhere VALUES ('4', '7');
INSERT INTO t_coursewhere VALUES ('4', '8');

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_name` varchar(100) NOT NULL,
  `n_text` varchar(1000) NOT NULL,
  `n_pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO t_news VALUES ('1', '我校“双创”导师文化活动助力学生创新创业', '今年，学校与各系部共同开展了丰富的创新创业文化活动，包括汲取创新创业大智慧的文化讲座，增加学生知识储备的新技术、新应用沙龙，以及拓宽行业领域视野的创新创业论坛等。这些创新创业文化活动的导师由全校遴选的110名校级创新创业指导教师担任，每位导师都可选取个人擅长的领域与学生进行分享，充分发挥不同专业背景教师在创新创业中的引导作用，提高学生的创新、创业和实践能力，共同营造了大连东软信息学院浓厚的创新创业文化氛围，更好实现整个大学校园里创新创业意识和能力的培养。', '/images/news/1.jpg');
INSERT INTO t_news VALUES ('2', '中国人民保险集团高层来校参观', '4月25日下午，中国人民保险集团业务发展部总经理张辉等高层人员在东软集团高级副总裁兼董事会秘书王楠陪同下来校参观。嘉宾一行参观了学校图书馆和大学生创业中心SOVO，了解了学校发展历史和办学特色，体验了东软学子创新创业实践的环境氛围。', '/images/news/2.jpg');
INSERT INTO t_news VALUES ('3', '哈尔滨广厦学院院长叶曲炜一行来校参观', '4月25日下午，哈尔滨广厦学院校长叶曲炜一行8人到校参观。党委副书记任昊在图书馆接待了来访嘉宾，为嘉宾介绍了我校的基本情况以及办学特色，随后任昊副书记陪同嘉宾参观了图书馆中心阅览室并合影留念。在大学生创业中心（SOVO），创新创业学院宁明皓为嘉宾讲解了SOVO的运行机制，并带领嘉宾感受了我校学生浓厚的创新创业氛围。随后，嘉宾参观了实验室，实验实训中心李帅详细介绍了学校的产学合作、实习实践环境并与嘉宾进行深入交流。', '/images/news/3.jpg');
INSERT INTO t_news VALUES ('4', '【中国教育报】温涛：大数据助力高校党建', '合理有效地将大数据技术引入到党的建设中，对于提高党建的科学化水平将是十分有益的。\r\n\r\n高校党建是整个党的建设重要组成部分。习近平总书记在全国高校思想政治工作会议上强调，“要加强高校党的基层组织建设，创新体制机制，改进工作方式，提高党的基层组织做思想政治工作能力。”如何切实做好高校党建，搞好思想政治工作，促进高等教育改革发展稳定，全面提高人才培养能力，是高校党务工作者的核心任务。\r\n\r\n近年来，高校党建工作进一步加强，高校党组织的活力得到激发，党员队伍整体素质也有所提高。但仍有不少不到位、不得力、不适应的问题存在，影响了党建工作的效果。例如：随着网络技术发展而产生的纷繁复杂的海量信息，对高校师生特别是对青年大学生的思想影响较大；一些高校随着办学规模的扩大，党务工作者队伍规模却没有跟上，思想政治工作“供血不足”；学生加入党组织的动机多样，难以准确把握，影响学生党员队伍建设的稳定性；党建制度不够完善，对于有效地监督和激励党员保持先进性的措施缺乏；一些教工党组织功能弱化、作用虚化；一些学生党组织活动形式化、活动内容空洞浮泛。这些问题大多存在于基层党组织建设中。作为高校党建工作贯彻落实的“最后一公里”，基层党组织建设的情况直接影响党组织领导核心、政治核心、战斗堡垒作用的有效发挥，影响党员先锋模范作用的充分发挥，影响党组织与人民群众的密切联系，影响教育事业的发展。', '/images/news/4.jpg');
INSERT INTO t_news VALUES ('5', '关于世界读书日系列活动', '在“4·23世界读书日”来临之际，图书馆将于4月21日起举办以“阅读•Book思议的发现”为主题的系列活动，倡导多读书、读好书的良好风气，共建书香文化校园，欢迎全校师生踊跃参加。\r\n\r\n具体活动时间安排如下：', '/images/news/5.jpg');
INSERT INTO t_news VALUES ('6', '2017莫斯科交通大学暑期文化感受项目', '1.项目简介：俄罗斯文化+企业参观+授课\r\n\r\n2.面向对象：全校各年级学生\r\n\r\n3.工作语言：英语+俄语（汉语翻译）\r\n\r\n4.学习期限：2017年6月28日-7月12日\r\n\r\n5.招募名额：25人\r\n\r\n6.招募条件：品学兼优者优先\r\n\r\n7. 招募流程：项目说明会2017年4月20日15:30 A10-103。\r\n\r\n8.报名截止日期：2017年4月24日。\r\n\r\n9.项目咨询：国际教育学院东欧与中亚部，A10-201室，\r\n\r\n电话：84832249，联系人：盖老师(23324119)、冯老师(850822881)', '/images/news/6.jpg');
INSERT INTO t_news VALUES ('7', '关于2017年五一劳动节放假时间安排的通知', '根据《国务院办公厅关于2017年部分节假日安排的通知》（国办发明电〔2016〕17号）和学校工作安排，经学校研究决定，现将我校2017年五一劳动节放假时间安排通知如下：\r\n\r\n一、放假时间\r\n\r\n2017年五一劳动节全体师生放假3天，自2017年4月29日至5月1日。5月1日（星期一）劳动节为法定节假日，5月2日（星期二）正常上班。\r\n\r\n二、其他事项\r\n\r\n2017年五一劳动节放假期间停掉的课程不再安排补课。', null);
INSERT INTO t_news VALUES ('8', '远东国立海洋渔业大学暑期俄语短期班项目', '1. 项目名称：来自俄罗斯大海深处的俄语\r\n\r\n2. 面向对象：俄语系大一、大二、大三学生\r\n\r\n3. 学习期限：2017年7月13-26日\r\n\r\n4. 学    时：35学时\r\n\r\n5. 招募名额：15人\r\n\r\n6. 招募条件：品学兼优者优先\r\n\r\n7. 招募流程：2017年4月17日，A6 210教室\r\n\r\n8. 报名截止日期：2017年4月20日。\r\n\r\n9. 项目咨询：国际教育学院东欧与中亚业务部，A10-201室，\r\n\r\n电话：84832249，联系人：盖老师、冯老师', '/images/news/7.jpg');
INSERT INTO t_news VALUES ('9', '东西伯利亚科技与管理大学暑期俄语', '1. 项目名称：东西伯利亚科技与管理大学暑期俄语短期班\r\n\r\n2. 项目介绍：贝加尔湖畔的俄语\r\n\r\n3. 面向对象：俄语系大一、大二、大三学生\r\n\r\n4. 学习期限：2017年7月5-19日\r\n\r\n5. 学    时：总共35学时\r\n\r\n6. 招募名额：15人\r\n\r\n7. 招募条件：品学兼优者优先\r\n\r\n8. 招募流程：2017年4月17日，A6 210教室\r\n\r\n9. 报名截止日期：2017年4月20日。\r\n\r\n10.项目咨询：国际教育学院东欧与中亚业务部，A10-201室，\r\n\r\n电话：84832249，联系人：盖老师、冯老师', null);
INSERT INTO t_news VALUES ('10', '阿尔泰国立科技大学暑期俄语', '1. 项目介绍：阿尔泰山流淌的俄语韵律\r\n\r\n2. 面向对象：俄语系大一、大二、大三学生\r\n\r\n3. 学习期限：2017年7月5-20日\r\n\r\n4. 学时：40学时\r\n\r\n5. 招募名额：15人\r\n\r\n6. 招募条件：品学兼优者优先\r\n\r\n7. 招募流程：2017年4月17日，A6 210教室\r\n\r\n8. 报名截止日期：2017年4月20日。\r\n\r\n9. 项目咨询：国际教育学院东欧与中亚业务部，A10-201室，\r\n\r\n电话：84832249，联系人：盖老师、冯老师', '/images/news/8.jpg');

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(30) NOT NULL,
  `s_password` varchar(30) NOT NULL,
  `s_profession` varchar(30) DEFAULT NULL,
  `s_record` varchar(30) DEFAULT NULL,
  `s_class` varchar(30) DEFAULT NULL,
  `s_phone` varchar(30) DEFAULT NULL,
  `s_brithday` varchar(30) DEFAULT NULL,
  `s_time` varchar(30) DEFAULT NULL,
  `s_rank` varchar(30) DEFAULT NULL,
  `s_pic` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  UNIQUE KEY `s_name` (`s_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO t_student VALUES ('1', '张三', '123456', '软件工程', '大专', '软件16103班', '13366666666', '1996-4-6', '2014-5-4', '0', '/images/pic/1.jpg');
INSERT INTO t_student VALUES ('2', '李红红', '123456', '软件技术', '本科', '软件16103班', '13366666666', '1996-4-5', '2014-5-4', '0', '/images/pic/2.jpg');
INSERT INTO t_student VALUES ('3', '1', '1', '软件工行', '本科', '软件16103班', '13366666666', '1996-3-5', '2014-5-4', '1', '/images/pic/3.jpg');
INSERT INTO t_student VALUES ('4', '11', '11', '软件技术', '大专', '软件16103班', '13366666666', '1996-3-5', '2014-5-4', '0', '/images/pic/4.jpg');
INSERT INTO t_student VALUES ('5', '2', 'd2', '软件工程', '本科', '软件16103班', '13366666666', '1996-3-5', '2014-5-4', '0', '/images/pic/3.jpg');
INSERT INTO t_student VALUES ('51', '222', '22', '软件技术', '大专', '软件16103班', '13366666666', '1996-3-5', '2014-5-4', '0', '/images/pic/1523849156931.jpg');
INSERT INTO t_student VALUES ('52', '22', '22', '软件工程', '本科', '软件16103班', '13366666666', '1996-3-5', '2014-5-4', '0', '/images/pic1490797624475.jpg');
INSERT INTO t_student VALUES ('53', '李四', '123456', '软件技术', '大专', '软件16103班', '15382296528', '1996-11-11', '2017-04-03', '0', null);
INSERT INTO t_student VALUES ('54', '111111', '1', '1', '1', '1', '1', '1', '1', '0', '/images/pic/1523880367986.png');
INSERT INTO t_student VALUES ('55', '王五', '123', '电子信息', '11111', '111', '111', '2018-01-31', '2018-02-01', '0', null);
INSERT INTO t_student VALUES ('56', '王大', '123', '英语', '1111', '111', '11111', '2018-01-01', '2019-01-01', '0', null);
INSERT INTO t_student VALUES ('57', '2121', '212121', '2121', '1212', '1212', '1212', '2018-01-01', '2018-01-01', '0', null);
INSERT INTO t_student VALUES ('58', 'dsad', 'sadasd', 'asdasd', 'asdad', 'asdsd', 'asdasd', '2018-01-01', '2018-01-01', '0', null);
INSERT INTO t_student VALUES ('59', 'dsadsa', 'sadsad', 'asddsa', 'asdasd', 'sadas', 'sad', '2018-01-01', '2018-01-01', '0', '/images/pic/3.jpg');
INSERT INTO t_student VALUES ('60', '辉辉哥', '11', '软件技术专业', '软件15105', '专科', '18342246855', '2018-04-11', '2018-04-06', '0', '/images/pic/3.jpg');
INSERT INTO t_student VALUES ('61', '', '', '', '', '', '', '', '', '0', '/images/pic/3.jpg');
INSERT INTO t_student VALUES ('62', '麻秀红', '11', '软件技术', '软件15105', '专科', '18342246855', '1997-07-06', '2015-09-01', '0', '/images/pic/3.jpg');
INSERT INTO t_student VALUES ('63', 'demo', '123', '软件工程', '1', '本科', '1', '2018-04-04', '2018-03-29', '0', '/images/pic/3.jpg');
INSERT INTO t_student VALUES ('64', '15180410530', '1', '1', '11', '1', '1', '2018-04-04', '2018-04-04', '0', '/images/pic/3.jpg');

-- ----------------------------
-- Table structure for `t_successtakecourse`
-- ----------------------------
DROP TABLE IF EXISTS `t_successtakecourse`;
CREATE TABLE `t_successtakecourse` (
  `st_id` int(10) NOT NULL AUTO_INCREMENT,
  `s_id` int(10) NOT NULL,
  `ct_id` int(10) NOT NULL,
  `st_name` varchar(30) NOT NULL,
  `st_record` varchar(30) NOT NULL,
  `st_score` varchar(30) NOT NULL,
  `st_week` varchar(30) NOT NULL,
  `st_time` varchar(30) NOT NULL,
  `st_where` varchar(30) NOT NULL,
  `st_teacher` varchar(30) NOT NULL,
  PRIMARY KEY (`st_id`,`s_id`,`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_successtakecourse
-- ----------------------------
INSERT INTO t_successtakecourse VALUES ('1', '1', '1', 'jjj', 'ddd', 'ddd', 'ddd', 'ddd', 'ddd', 'ddd');

-- ----------------------------
-- Table structure for `t_takecourse`
-- ----------------------------
DROP TABLE IF EXISTS `t_takecourse`;
CREATE TABLE `t_takecourse` (
  `ct_id` int(10) NOT NULL AUTO_INCREMENT,
  `ct_name` varchar(30) NOT NULL,
  `ct_record` varchar(30) NOT NULL,
  `ct_class` varchar(30) NOT NULL,
  `ct_score` varchar(30) NOT NULL,
  `ct_time` varchar(30) NOT NULL,
  `ct_week` varchar(30) NOT NULL,
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_takecourse
-- ----------------------------
INSERT INTO t_takecourse VALUES ('2', '数据库', '软件技术', '第二学期', '4', '周四1,2节', '1-16周');
INSERT INTO t_takecourse VALUES ('3', '数据结构', '软件技术', '第一学期', '6', '周一5,6节', '1-10周');
INSERT INTO t_takecourse VALUES ('4', 'java编程', '软件技术', '第二学期', '8', '周五5,6,7,8节', '1-16周');
INSERT INTO t_takecourse VALUES ('5', '软件测试', '软件技术', '第一学期', '4', '周一3,4节', '1-16周');
INSERT INTO t_takecourse VALUES ('6', '自动化测试', '软件技术', '第二学期', '6', '周二1,2节', '1-10周');
INSERT INTO t_takecourse VALUES ('7', 'linux管理', '软件技术', '第一学期', '4', '周三1,2,3,4节', '1-16周');
INSERT INTO t_takecourse VALUES ('8', 'c语言', '软件技术', '第二学期', '6', '周五1,2节', '1-16周');

-- ----------------------------
-- Table structure for `t_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(30) NOT NULL,
  `t_where` varchar(100) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO t_teacher VALUES ('1', '王红', 'a7-201');
INSERT INTO t_teacher VALUES ('2', '李欣欣', 'a3-101 ');
INSERT INTO t_teacher VALUES ('3', '蓝天', 'a5-202 ');
INSERT INTO t_teacher VALUES ('4', '王明', 'a7-201');
INSERT INTO t_teacher VALUES ('5', '赵丽颖', 'a7-201');
INSERT INTO t_teacher VALUES ('6', '马云', 'a5-203');
INSERT INTO t_teacher VALUES ('7', '李小军', 'A2-204');
INSERT INTO t_teacher VALUES ('8', '张明全', 'a3-101 ');
INSERT INTO t_teacher VALUES ('9', '张淑', 'a7-201');
INSERT INTO t_teacher VALUES ('10', '刁红', 'A2-203');
INSERT INTO t_teacher VALUES ('11', '7', '4');
INSERT INTO t_teacher VALUES ('12', 'w', 'w');
INSERT INTO t_teacher VALUES ('13', '1', '1');

-- ----------------------------
-- Table structure for `t_where`
-- ----------------------------
DROP TABLE IF EXISTS `t_where`;
CREATE TABLE `t_where` (
  `w_id` int(10) NOT NULL AUTO_INCREMENT,
  `w_name` varchar(30) NOT NULL,
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_where
-- ----------------------------
INSERT INTO t_where VALUES ('1', 'a3 301');
INSERT INTO t_where VALUES ('2', 'a3 205');
INSERT INTO t_where VALUES ('3', 'a1 101');
INSERT INTO t_where VALUES ('4', 'a1 303');
INSERT INTO t_where VALUES ('5', 'a2 105');
INSERT INTO t_where VALUES ('6', 'a2 106');
INSERT INTO t_where VALUES ('7', 'a7 301');
INSERT INTO t_where VALUES ('8', 'a7 205');
