/*
Navicat MySQL Data Transfer

Source Server         : 1710
Source Server Version : 50518
Source Host           : 127.0.0.1:3306
Source Database       : educationsystem

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2017-11-08 10:57:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ta_classchange`
-- ----------------------------
DROP TABLE IF EXISTS `ta_classchange`;
CREATE TABLE `ta_classchange` (
  `CLASSCHANGEID` int(11) NOT NULL,
  `CLASSID` int(11) DEFAULT NULL,
  `ChangeType` varchar(255) DEFAULT NULL,
  `TEACHERID` int(11) DEFAULT NULL,
  `PERIOD` varchar(20) NOT NULL,
  `EXEDATE` date NOT NULL,
  `COMMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CLASSCHANGEID`),
  KEY `FK_RELATIONSHIP_10` (`CLASSID`),
  KEY `FK_RELATIONSHIP_11` (`TEACHERID`),
  CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`CLASSID`) REFERENCES `tb_class` (`CLASSID`),
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`TEACHERID`) REFERENCES `tb_teacher` (`TEACHERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�༶����ʦ';

-- ----------------------------
-- Records of ta_classchange
-- ----------------------------

-- ----------------------------
-- Table structure for `ta_student_change`
-- ----------------------------
DROP TABLE IF EXISTS `ta_student_change`;
CREATE TABLE `ta_student_change` (
  `CHANGEID` int(11) NOT NULL,
  `FROM_CLASSID` int(11) DEFAULT NULL,
  `TO_CLASSID` int(11) DEFAULT NULL,
  `STUID` int(11) DEFAULT NULL,
  `CHANGETYPEID` int(11) DEFAULT NULL,
  `EXEDATE` date NOT NULL,
  `COMMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CHANGEID`),
  KEY `FK_RELATIONSHIP_1` (`STUID`),
  KEY `FK_RELATIONSHIP_3` (`TO_CLASSID`),
  KEY `FK_RELATIONSHIP_4` (`FROM_CLASSID`),
  KEY `FK_RELATIONSHIP_7` (`CHANGETYPEID`),
  CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`STUID`) REFERENCES `tb_student` (`STUID`),
  CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`TO_CLASSID`) REFERENCES `tb_class` (`CLASSID`),
  CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`FROM_CLASSID`) REFERENCES `tb_class` (`CLASSID`),
  CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`CHANGETYPEID`) REFERENCES `tb_change_type` (`CHANGETYPEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ѧ��ת�࣬��ѧ����ѧ������';

-- ----------------------------
-- Records of ta_student_change
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_change_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_change_type`;
CREATE TABLE `tb_change_type` (
  `CHANGETYPEID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPENAME` varchar(20) NOT NULL,
  `COMMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CHANGETYPEID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='1:ת��\r\n2.��ѧ\r\n3.��ѧ\r\n4.�ϰ�';

-- ----------------------------
-- Records of tb_change_type
-- ----------------------------
INSERT INTO `tb_change_type` VALUES ('1', '开班', '首次入班');
INSERT INTO `tb_change_type` VALUES ('2', '休学', null);
INSERT INTO `tb_change_type` VALUES ('3', '转班', null);
INSERT INTO `tb_change_type` VALUES ('4', '退学', null);
INSERT INTO `tb_change_type` VALUES ('5', '结课', null);
INSERT INTO `tb_change_type` VALUES ('6', '降班', null);

-- ----------------------------
-- Table structure for `tb_class`
-- ----------------------------
DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class` (
  `CLASSID` int(11) NOT NULL AUTO_INCREMENT,
  `CLASSNAME` varchar(20) DEFAULT NULL,
  `CLASSTYPE` varchar(20) DEFAULT NULL,
  `TEACHERID` int(11) DEFAULT NULL,
  `CLASS_GUIDEID` int(11) DEFAULT NULL,
  `JOB_GUIDEID` int(11) DEFAULT NULL,
  `CreatedDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `COMMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CLASSID`),
  KEY `FK_RELATIONSHIP_18` (`CLASS_GUIDEID`),
  KEY `FK_RELATIONSHIP_9` (`TEACHERID`),
  KEY `FK_JOBGUIE12` (`JOB_GUIDEID`),
  CONSTRAINT `FK_JOBGUIE12` FOREIGN KEY (`JOB_GUIDEID`) REFERENCES `tb_guide` (`GUIDEID`),
  CONSTRAINT `FK_RELATIONSHIP_18` FOREIGN KEY (`CLASS_GUIDEID`) REFERENCES `tb_guide` (`GUIDEID`),
  CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`TEACHERID`) REFERENCES `tb_teacher` (`TEACHERID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_class
-- ----------------------------
INSERT INTO `tb_class` VALUES ('1', 'JAVA1710', 'java', '2', '1', '3', '2017-10-18', null, '1', '新开班56人');
INSERT INTO `tb_class` VALUES ('2', 'java1410', 'java', '2', '2', '4', '1998-08-08', null, '1', null);
INSERT INTO `tb_class` VALUES ('3', 'bd1701', '大数据', '3', '1', '4', '2017-09-07', null, '1', null);
INSERT INTO `tb_class` VALUES ('4', 'bd1701', '大数据', '3', '1', '4', '2017-09-07', null, '1', null);
INSERT INTO `tb_class` VALUES ('5', 'bd1701', '大数据', '3', '1', '4', '2017-09-07', null, '1', null);
INSERT INTO `tb_class` VALUES ('6', 'bd1701', '大数据', '3', '1', '4', '2017-09-07', null, '1', null);
INSERT INTO `tb_class` VALUES ('7', 'java1787', 'java', '2', '3', '5', '2016-08-08', null, '1', null);
INSERT INTO `tb_class` VALUES ('8', 'java1712', 'java', '3', '1', '4', '2017-11-11', null, '1', null);
INSERT INTO `tb_class` VALUES ('9', 'UI1710', 'ui', '1', '1', '5', '2017-11-13', null, '1', '开班45人，全日制');
INSERT INTO `tb_class` VALUES ('10', 'java1718', 'java', '2', '3', '5', '1998-08-08', null, '1', 'sdfdsd');

-- ----------------------------
-- Table structure for `tb_exam`
-- ----------------------------
DROP TABLE IF EXISTS `tb_exam`;
CREATE TABLE `tb_exam` (
  `EXAMID` int(11) NOT NULL,
  `CLASSID` int(11) DEFAULT NULL,
  `NAME` varchar(20) NOT NULL,
  `PERIOD` varchar(20) NOT NULL,
  `EXEDATE` date NOT NULL,
  `COMMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`EXAMID`),
  KEY `FK_RELATIONSHIP_12` (`CLASSID`),
  CONSTRAINT `FK_RELATIONSHIP_12` FOREIGN KEY (`CLASSID`) REFERENCES `tb_class` (`CLASSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_exam
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_examsocre`
-- ----------------------------
DROP TABLE IF EXISTS `tb_examsocre`;
CREATE TABLE `tb_examsocre` (
  `SCOREID` int(11) NOT NULL,
  `CLASSID` int(11) DEFAULT NULL,
  `EXAMID` int(11) DEFAULT NULL,
  `SCORE` int(11) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `COMMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`SCOREID`),
  KEY `FK_RELATIONSHIP_13` (`EXAMID`),
  KEY `FK_RELATIONSHIP_15` (`CLASSID`),
  CONSTRAINT `FK_RELATIONSHIP_13` FOREIGN KEY (`EXAMID`) REFERENCES `tb_exam` (`EXAMID`),
  CONSTRAINT `FK_RELATIONSHIP_15` FOREIGN KEY (`CLASSID`) REFERENCES `tb_class` (`CLASSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ѧ���ɼ�����';

-- ----------------------------
-- Records of tb_examsocre
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_guide`
-- ----------------------------
DROP TABLE IF EXISTS `tb_guide`;
CREATE TABLE `tb_guide` (
  `GUIDEID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL COMMENT '1:��ͨ������\r\n            2.��ҵ������',
  `state` int(11) DEFAULT '1',
  `COMMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`GUIDEID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_guide
-- ----------------------------
INSERT INTO `tb_guide` VALUES ('1', '莫丹', '1', '1', null);
INSERT INTO `tb_guide` VALUES ('2', '鲁颖', '1', '1', null);
INSERT INTO `tb_guide` VALUES ('3', '周薇', '1', '1', null);
INSERT INTO `tb_guide` VALUES ('4', '刘迪', '2', '1', null);
INSERT INTO `tb_guide` VALUES ('5', '关键', '2', '1', null);

-- ----------------------------
-- Table structure for `tb_homework`
-- ----------------------------
DROP TABLE IF EXISTS `tb_homework`;
CREATE TABLE `tb_homework` (
  `HOMEWORKID` int(11) NOT NULL,
  `CLASSID` int(11) DEFAULT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `PERIOD` varchar(20) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL COMMENT '1:��ͨ������\r\n            2.��ҵ������',
  `COMMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`HOMEWORKID`),
  KEY `FK_RELATIONSHIP_14` (`CLASSID`),
  CONSTRAINT `FK_RELATIONSHIP_14` FOREIGN KEY (`CLASSID`) REFERENCES `tb_class` (`CLASSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_homework
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_homeworkscore`
-- ----------------------------
DROP TABLE IF EXISTS `tb_homeworkscore`;
CREATE TABLE `tb_homeworkscore` (
  `HOMEWORKSOCREID` int(11) NOT NULL,
  `HOMEWORKID` int(11) DEFAULT NULL,
  `STUID` int(11) DEFAULT NULL,
  `WORKSCORE` varchar(20) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `COMMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`HOMEWORKSOCREID`),
  KEY `FK_RELATIONSHIP_16` (`HOMEWORKID`),
  KEY `FK_RELATIONSHIP_17` (`STUID`),
  CONSTRAINT `FK_RELATIONSHIP_16` FOREIGN KEY (`HOMEWORKID`) REFERENCES `tb_homework` (`HOMEWORKID`),
  CONSTRAINT `FK_RELATIONSHIP_17` FOREIGN KEY (`STUID`) REFERENCES `tb_student` (`STUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_homeworkscore
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_school`
-- ----------------------------
DROP TABLE IF EXISTS `tb_school`;
CREATE TABLE `tb_school` (
  `SCHOOLID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  `COMMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`SCHOOLID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_school
-- ----------------------------
INSERT INTO `tb_school` VALUES ('1', '东北林业大学', '211');
INSERT INTO `tb_school` VALUES ('2', '哈尔滨工业大学', '985');
INSERT INTO `tb_school` VALUES ('3', '哈尔滨工程大学', '211');
INSERT INTO `tb_school` VALUES ('4', '东北农业大学', '211');
INSERT INTO `tb_school` VALUES ('5', '黑龙江大学', '本科');
INSERT INTO `tb_school` VALUES ('6', '哈尔滨理工大学', '本科');
INSERT INTO `tb_school` VALUES ('7', '哈尔滨商业大学', '本科');
INSERT INTO `tb_school` VALUES ('8', '哈尔滨师范大学', '本科');
INSERT INTO `tb_school` VALUES ('9', '黑龙江工程大学', '本科');
INSERT INTO `tb_school` VALUES ('10', '黑龙江科技大学', '本科');
INSERT INTO `tb_school` VALUES ('11', '齐齐哈尔大学', '本科');
INSERT INTO `tb_school` VALUES ('12', '大庆师范学院', '本科');
INSERT INTO `tb_school` VALUES ('13', '牡丹江师范学院', '本科');

-- ----------------------------
-- Table structure for `tb_state`
-- ----------------------------
DROP TABLE IF EXISTS `tb_state`;
CREATE TABLE `tb_state` (
  `STATEID` int(11) NOT NULL AUTO_INCREMENT,
  `STATENAME` varchar(20) DEFAULT NULL,
  `COMMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`STATEID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='��Σ�\r\n�����ϿΣ�\r\n��ѧ\r\n��ѧ\r\n����\r\n������Ա\r\n';

-- ----------------------------
-- Records of tb_state
-- ----------------------------
INSERT INTO `tb_state` VALUES ('1', '在读', null);
INSERT INTO `tb_state` VALUES ('2', '休学', null);
INSERT INTO `tb_state` VALUES ('3', '就业', null);
INSERT INTO `tb_state` VALUES ('4', '考研，专升本', null);
INSERT INTO `tb_state` VALUES ('5', '考公务员，当兵', null);
INSERT INTO `tb_state` VALUES ('6', '退学', null);
INSERT INTO `tb_state` VALUES ('7', '延迟就业', null);
INSERT INTO `tb_state` VALUES ('8', '转行', null);
INSERT INTO `tb_state` VALUES ('9', '未就业', null);

-- ----------------------------
-- Table structure for `tb_student`
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
  `STUID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  `SEX` varchar(5) NOT NULL,
  `CLASSID` int(11) NOT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `teacherId` int(11) DEFAULT NULL,
  `IDCARD` varchar(50) DEFAULT NULL,
  `TEL` varchar(50) DEFAULT NULL,
  `FTEL` varchar(30) DEFAULT NULL,
  `MTEL` varchar(30) DEFAULT NULL,
  `SCHOOLID` int(11) DEFAULT NULL,
  `MAJOR` varchar(30) DEFAULT NULL,
  `GRADE` varchar(30) DEFAULT NULL,
  `CLASSGUIDEID` int(11) DEFAULT NULL,
  `JOBGUIDEID` int(11) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `INTENDCITY` varchar(20) DEFAULT NULL,
  `WORKCITY` varchar(30) DEFAULT NULL,
  `JOB` varchar(30) DEFAULT NULL,
  `WORKTIME` date DEFAULT NULL,
  `SALARY` varchar(50) DEFAULT NULL,
  `SALARYOFYEAR` int(11) DEFAULT NULL,
  `STATEID` int(11) DEFAULT '1',
  `COMMENT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`STUID`),
  KEY `FK_RELATIONSHIP_2` (`CLASSID`),
  KEY `FK_RELATIONSHIP_20` (`SCHOOLID`),
  KEY `FK_RELATIONSHIP_5` (`JOBGUIDEID`),
  KEY `FK_RELATIONSHIP_6` (`CLASSGUIDEID`),
  KEY `FK_RELATIONSHIP_8` (`STATEID`),
  KEY `FK_Teahcerid` (`teacherId`),
  CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`CLASSID`) REFERENCES `tb_class` (`CLASSID`),
  CONSTRAINT `FK_RELATIONSHIP_20` FOREIGN KEY (`SCHOOLID`) REFERENCES `tb_school` (`SCHOOLID`),
  CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`JOBGUIDEID`) REFERENCES `tb_guide` (`GUIDEID`),
  CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`CLASSGUIDEID`) REFERENCES `tb_guide` (`GUIDEID`),
  CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`STATEID`) REFERENCES `tb_state` (`STATEID`),
  CONSTRAINT `FK_Teahcerid` FOREIGN KEY (`teacherId`) REFERENCES `tb_teacher` (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES ('1', '李小龙', '男', '2', '本科', null, '230106199812253654', '16456789', '16303654897', '136547892354', '5', '软件工程', '15', '3', '2', '哈尔滨香坊区', null, null, null, null, null, null, '1', '班长一个');
INSERT INTO `tb_student` VALUES ('2', '张无忌', '女', '1', '本科', null, '234234234', '2342342', '23423', '4234', '4', '开发', '152015', '1', '3', '23423423', null, null, null, null, null, null, '1', null);
INSERT INTO `tb_student` VALUES ('3', '张无忌', '女', '1', '本科', null, '234234234', '2342342', '23423', '4234', '4', '开发', '152015', '1', '3', '23423423', null, null, null, null, null, null, '1', null);
INSERT INTO `tb_student` VALUES ('4', '张无忌4', '男', '6', '本科', null, 'a234234234', '2342342', '23423', '4234', '4', '开发', '2015', '1', '4', '23423423', null, null, null, null, null, null, '1', 'qweqwff');
INSERT INTO `tb_student` VALUES ('5', '张大成', '女', '9', '中专', null, 'a234234234', '2342342', '23423423423', '234234234', '7', '艺术', '95', '1', '5', '234234234', null, null, null, null, null, null, '1', '2342342');
INSERT INTO `tb_student` VALUES ('6', '张无忌', '男', '9', '本科', null, '234234', '23432', '423423', '234', '4', '4234', '23432', '1', '5', '234', null, null, null, null, null, null, '1', '234234');

-- ----------------------------
-- Table structure for `tb_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher` (
  `teacherId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `teacherType` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_teacher
-- ----------------------------
INSERT INTO `tb_teacher` VALUES ('1', '戚爱斌', 'java', '1', null);
INSERT INTO `tb_teacher` VALUES ('2', '代俊朴', 'bigdata', '1', null);
INSERT INTO `tb_teacher` VALUES ('3', '闫立伟', 'web', '1', null);
