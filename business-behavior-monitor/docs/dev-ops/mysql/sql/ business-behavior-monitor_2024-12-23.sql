# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 5.6.39)
# 数据库: business-behavior-monitor
# 生成时间: 2024-06-30 01:58:23 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE database if NOT EXISTS `business-behavior-monitor` default character set utf8mb4 ;
use `business-behavior-monitor`;

# 转储表 monitor_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data`;

CREATE TABLE `monitor_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
  `monitor_name` varchar(64) DEFAULT NULL COMMENT '监控名称',
  `monitor_node_id` varchar(8) NOT NULL COMMENT '节点ID',
  `system_name` varchar(64) NOT NULL COMMENT '系统名称',
  `clazz_name` varchar(256) NOT NULL COMMENT '类的名称',
  `method_name` varchar(128) NOT NULL COMMENT '方法名称',
  `attribute_name` varchar(32) NOT NULL COMMENT '属性名称',
  `attribute_field` varchar(8) NOT NULL COMMENT '属性字段',
  `attribute_value` varchar(128) NOT NULL COMMENT '属性的值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据';

LOCK TABLES `monitor_data` WRITE;
/*!40000 ALTER TABLE `monitor_data` DISABLE KEYS */;

INSERT INTO `monitor_data` (`id`, `monitor_id`, `monitor_name`, `monitor_node_id`, `system_name`, `clazz_name`, `method_name`, `attribute_name`, `attribute_field`, `attribute_value`, `create_time`, `update_time`)
VALUES
	(1,'129009','测试监控流程','1001','big-market','cn.bugstack.monitor.test.ApiTest','test_log','用户ID','userId','10001','2024-05-24 15:13:30','2024-05-29 11:16:02'),
	(2,'129009','测试监控流程','1001','big-market','cn.bugstack.monitor.test.ApiTest','test_log','订单ID','orderId','109099893222','2024-05-24 15:13:33','2024-05-29 11:16:02'),
	(3,'129009','测试监控流程','1001','big-market','cn.bugstack.monitor.test.ApiTest','test_log_00','用户ID','userId','10001','2024-05-28 15:09:18','2024-05-29 11:16:03'),
	(4,'129009','测试监控流程','1001','big-market','cn.bugstack.monitor.test.ApiTest','test_log_00','订单ID','orderId','109099893222','2024-05-28 15:09:18','2024-05-29 11:16:04'),
	(5,'129009','测试监控流程','1003','big-market','cn.bugstack.monitor.test.ApiTest','test_log_02','用户ID','userId','10001','2024-05-28 15:16:06','2024-05-29 11:16:04'),
	(6,'129009','测试监控流程','1003','big-market','cn.bugstack.monitor.test.ApiTest','test_log_02','用户ID','userId','10001','2024-05-28 15:16:48','2024-05-29 11:16:06'),
	(7,'129009','测试监控流程','1004','big-market','cn.bugstack.monitor.test.ApiTest','test_log_03','用户ID','userId','10001','2024-05-28 15:17:06','2024-05-29 11:16:07'),
	(8,'129009','测试监控流程','1002','big-market','cn.bugstack.monitor.test.ApiTest','test_log_01','用户ID','userId','10001','2024-05-28 15:18:04','2024-05-29 11:16:07'),
	(9,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-09 16:39:17','2024-06-09 16:39:17'),
	(10,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-09 16:40:26','2024-06-09 16:40:26'),
	(11,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-09 16:40:26','2024-06-09 16:40:26'),
	(12,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-09 16:48:29','2024-06-09 16:48:29'),
	(13,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-09 16:48:29','2024-06-09 16:48:29'),
	(14,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-09 16:52:15','2024-06-09 16:52:15'),
	(15,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-09 16:52:21','2024-06-09 16:52:21'),
	(16,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-09 16:54:54','2024-06-09 16:54:54'),
	(17,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-09 16:54:58','2024-06-09 16:54:58'),
	(18,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-09 16:57:04','2024-06-09 16:57:04'),
	(19,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-09 16:57:04','2024-06-09 16:57:04'),
	(20,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-09 16:57:04','2024-06-09 16:57:04'),
	(21,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-09 17:50:03','2024-06-09 17:50:03'),
	(22,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-09 17:50:03','2024-06-09 17:50:03'),
	(23,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-09 17:50:04','2024-06-09 17:50:04'),
	(24,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-09 17:50:04','2024-06-09 17:50:04'),
	(25,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-09 17:50:04','2024-06-09 17:50:04'),
	(26,'129101','大营销抽奖流程','100211','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.BlackListLogicChain','logic','用户ID','userId','xiaofuge','2024-06-09 17:50:04','2024-06-09 17:50:04'),
	(27,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-09 17:50:04','2024-06-09 17:50:04'),
	(28,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-09 18:01:20','2024-06-09 18:01:20'),
	(29,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-09 18:01:20','2024-06-09 18:01:20'),
	(30,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-09 18:01:20','2024-06-09 18:01:20'),
	(31,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-09 18:01:20','2024-06-09 18:01:20'),
	(32,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-09 18:01:20','2024-06-09 18:01:20'),
	(33,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-09 18:01:20','2024-06-09 18:01:20'),
	(34,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-09 18:01:21','2024-06-09 18:01:21'),
	(35,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-09 18:44:47','2024-06-09 18:44:47'),
	(36,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-09 18:44:47','2024-06-09 18:44:47'),
	(37,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-09 18:44:47','2024-06-09 18:44:47'),
	(38,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-09 18:44:47','2024-06-09 18:44:47'),
	(39,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-09 18:44:47','2024-06-09 18:44:47'),
	(40,'129101','大营销抽奖流程','100213','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.DefaultLogicChain','logic','用户ID','userId','xiaofuge','2024-06-09 18:44:47','2024-06-09 18:44:47'),
	(41,'129101','大营销抽奖流程','10031','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicTree','用户ID','userId','xiaofuge','2024-06-09 18:44:47','2024-06-09 18:44:47'),
	(42,'129101','大营销抽奖流程','100312','big-market','cn.bugstack.domain.strategy.service.rule.tree.impl.RuleStockLogicTreeNode','logic','用户ID','userId','xiaofuge','2024-06-09 18:44:47','2024-06-09 18:44:47'),
	(43,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-09 18:44:47','2024-06-09 18:44:47'),
	(44,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-10 08:16:55','2024-06-10 08:16:55'),
	(45,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 08:16:55','2024-06-10 08:16:55'),
	(46,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 08:16:55','2024-06-10 08:16:55'),
	(47,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-10 08:16:55','2024-06-10 08:16:55'),
	(48,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-10 08:16:55','2024-06-10 08:16:55'),
	(49,'129101','大营销抽奖流程','100213','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.DefaultLogicChain','logic','用户ID','userId','xiaofuge','2024-06-10 08:16:55','2024-06-10 08:16:55'),
	(50,'129101','大营销抽奖流程','10031','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicTree','用户ID','userId','xiaofuge','2024-06-10 08:16:55','2024-06-10 08:16:55'),
	(51,'129101','大营销抽奖流程','100312','big-market','cn.bugstack.domain.strategy.service.rule.tree.impl.RuleStockLogicTreeNode','logic','用户ID','userId','xiaofuge','2024-06-10 08:16:55','2024-06-10 08:16:55'),
	(52,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-10 08:16:56','2024-06-10 08:16:56'),
	(53,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-10 09:35:30','2024-06-10 09:35:30'),
	(54,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:35:30','2024-06-10 09:35:30'),
	(55,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:35:30','2024-06-10 09:35:30'),
	(56,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-10 09:35:30','2024-06-10 09:35:30'),
	(57,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-10 09:35:30','2024-06-10 09:35:30'),
	(58,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-10 09:35:30','2024-06-10 09:35:30'),
	(59,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-10 09:35:31','2024-06-10 09:35:31'),
	(60,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-10 09:36:23','2024-06-10 09:36:23'),
	(61,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:23','2024-06-10 09:36:23'),
	(62,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(63,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(64,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(65,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(66,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(67,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(68,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(69,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(70,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(71,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(72,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(73,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(74,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(75,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(76,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:24','2024-06-10 09:36:24'),
	(77,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(78,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(79,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(80,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(81,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(82,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(83,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(84,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(85,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(86,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(87,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(88,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(89,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(90,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(91,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(92,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(93,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(94,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(95,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(96,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(97,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(98,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(99,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(100,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(101,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(102,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(103,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(104,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(105,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(106,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(107,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-10 09:36:25','2024-06-10 09:36:25'),
	(108,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(109,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(110,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(111,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(112,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(113,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(114,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(115,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(116,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(117,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(118,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(119,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(120,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(121,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(122,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(123,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(124,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(125,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(126,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(127,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(128,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(129,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-10 09:36:26','2024-06-10 09:36:26'),
	(130,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-15 20:02:16','2024-06-15 20:02:16'),
	(131,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-15 20:02:16','2024-06-15 20:02:16'),
	(132,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-15 20:02:16','2024-06-15 20:02:16'),
	(133,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-15 20:02:17','2024-06-15 20:02:17'),
	(134,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-15 20:02:17','2024-06-15 20:02:17'),
	(135,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-15 20:02:17','2024-06-15 20:02:17'),
	(136,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-15 20:02:17','2024-06-15 20:02:17'),
	(137,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(138,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(139,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(140,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(141,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(142,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(143,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(144,'129101','大营销抽奖流程','1001','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(145,'129101','大营销抽奖流程','10011','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(146,'129101','大营销抽奖流程','10015','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(147,'129101','大营销抽奖流程','1002','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(148,'129101','大营销抽奖流程','10021','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(149,'129101','大营销抽奖流程','100212','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36'),
	(150,'129101','大营销抽奖流程','1004','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','用户ID','userId','xiaofuge','2024-06-15 20:19:36','2024-06-15 20:19:36');

/*!40000 ALTER TABLE `monitor_data` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 monitor_data_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data_map`;

CREATE TABLE `monitor_data_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
  `monitor_name` varchar(64) NOT NULL COMMENT '监控名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据地图配置';

LOCK TABLES `monitor_data_map` WRITE;
/*!40000 ALTER TABLE `monitor_data_map` DISABLE KEYS */;

INSERT INTO `monitor_data_map` (`id`, `monitor_id`, `monitor_name`, `create_time`, `update_time`)
VALUES
	(1,'129009','测试监控流程','2024-05-24 14:51:45','2024-05-24 14:51:45'),
	(2,'129101','大营销抽奖流程','2024-06-09 16:11:49','2024-06-09 16:11:49');

/*!40000 ALTER TABLE `monitor_data_map` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 monitor_data_map_node
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data_map_node`;

CREATE TABLE `monitor_data_map_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
  `monitor_node_id` varchar(8) NOT NULL COMMENT '节点ID',
  `monitor_node_name` varchar(32) NOT NULL COMMENT '节点名称',
  `gather_system_name` varchar(64) NOT NULL COMMENT '采集，系统名称',
  `gather_clazz_name` varchar(256) NOT NULL COMMENT '采集，类的名称',
  `gather_method_name` varchar(128) NOT NULL COMMENT '采集，方法名称',
  `loc` varchar(32) NOT NULL COMMENT '渲染节点坐标',
  `color` varchar(8) NOT NULL DEFAULT '#2ECC40' COMMENT '节点颜色',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据地图节点配置';

LOCK TABLES `monitor_data_map_node` WRITE;
/*!40000 ALTER TABLE `monitor_data_map_node` DISABLE KEYS */;

INSERT INTO `monitor_data_map_node` (`id`, `monitor_id`, `monitor_node_id`, `monitor_node_name`, `gather_system_name`, `gather_clazz_name`, `gather_method_name`, `loc`, `color`, `create_time`, `update_time`)
VALUES
	(1,'129009','1001','用户下单','big-market','cn.bugstack.monitor.test.ApiTest','test_log_00','210 110','#2ECC40','2024-05-24 14:51:15','2024-06-09 18:03:07'),
	(2,'129009','1002','支付完成','big-market','cn.bugstack.monitor.test.ApiTest','test_log_01','210 290','#2ECC40','2024-05-28 14:12:42','2024-06-09 18:03:08'),
	(3,'129009','1003','发货完成','big-market','cn.bugstack.monitor.test.ApiTest','test_log_02','210 430','#2ECC40','2024-05-28 14:12:42','2024-06-09 18:03:09'),
	(4,'129009','1004','发货失败','big-market','cn.bugstack.monitor.test.ApiTest','test_log_03','430 440','#2ECC40','2024-05-28 14:12:42','2024-06-09 18:03:10'),
	(5,'129101','1001','开始抽奖啦(启动)','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','120 50','#006400','2024-06-09 16:15:23','2024-06-09 18:08:51'),
	(7,'129101','10011','创建抽奖单(开始)','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','120 180','#006400','2024-06-09 16:15:23','2024-06-09 18:09:00'),
	(8,'129101','10012','活动未开始(状态)','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','350 230','#FF8C00','2024-06-09 16:15:23','2024-06-09 18:10:09'),
	(9,'129101','10013','活动未开始(时间)','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','350 320','#FF8C00','2024-06-09 16:15:23','2024-06-09 18:10:24'),
	(10,'129101','10014','订单未消费(存在)','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','350 140','#2E8B57','2024-06-09 16:15:23','2024-06-09 18:10:46'),
	(12,'129101','10015','创建抽奖单(完成)','big-market','cn.bugstack.domain.activity.service.partake.AbstractRaffleActivityPartake','createOrder','350 50','#2E8B57','2024-06-09 16:15:23','2024-06-09 18:10:44'),
	(13,'129101','1002','抽奖策略表(计算)','big-market','cn.bugstack.domain.strategy.service.AbstractRaffleStrategy','performRaffle','770 50','#FF1493','2024-06-09 17:20:30','2024-06-09 18:11:02'),
	(14,'129101','10021','责任链策略(计算)','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicChain','1230 50','#0000FF','2024-06-09 17:20:30','2024-06-09 18:11:23'),
	(15,'129101','100211','黑名单策略(计算)','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.BlackListLogicChain','logic','1230 160','#1E90FF','2024-06-09 17:20:30','2024-06-09 18:11:33'),
	(16,'129101','100212','权重值策略(计算)','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain','logic','1230 260','#1E90FF','2024-06-09 17:20:30','2024-06-09 18:11:34'),
	(17,'129101','100213','兜底的策略(计算)','big-market','cn.bugstack.domain.strategy.service.rule.chain.impl.DefaultLogicChain','logic','1230 360','#1E90FF','2024-06-09 17:20:30','2024-06-09 18:11:35'),
	(18,'129101','10031','抽奖规则树(计算)','big-market','cn.bugstack.domain.strategy.service.raffle.DefaultRaffleStrategy','raffleLogicTree','770 260','#000000','2024-06-09 17:20:30','2024-06-09 18:11:55'),
	(19,'129101','100311','次数锁判断(计算)','big-market','cn.bugstack.domain.strategy.service.rule.tree.impl.RuleLockLogicTreeNode','logic','1010 260','#2F4F4F','2024-06-09 17:20:30','2024-06-09 18:12:14'),
	(20,'129101','100312','扣库存处理(计算)','big-market','cn.bugstack.domain.strategy.service.rule.tree.impl.RuleStockLogicTreeNode','logic','1010 160','#2F4F4F','2024-06-09 17:20:30','2024-06-09 18:12:15'),
	(21,'129101','100313','兜底类奖品(计算)','big-market','cn.bugstack.domain.strategy.service.rule.tree.impl.RuleLuckAwardLogicTreeNode','logic','1010 360','#2F4F4F','2024-06-09 17:20:30','2024-06-09 18:12:16'),
	(22,'129101','1004','中奖记录值(结果)','big-market','cn.bugstack.domain.award.service.AwardService','saveUserAwardRecord','120 340','#006400','2024-06-09 17:20:30','2024-06-09 18:09:09'),
	(23,'129101','10041','异步发奖品(结果)','big-market','cn.bugstack.trigger.listener.SendAwardCustomer','listener','120 450','#006400','2024-06-09 17:20:30','2024-06-09 18:09:19'),
	(24,'129101','10042','抽奖失败啦(结果)','big-market','cn.bugstack.trigger.http.RaffleActivityController','draw','350 450','#B22222','2024-06-09 17:20:30','2024-06-09 18:09:33');

/*!40000 ALTER TABLE `monitor_data_map_node` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 monitor_data_map_node_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data_map_node_field`;

CREATE TABLE `monitor_data_map_node_field` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
  `monitor_node_id` varchar(8) NOT NULL COMMENT '节点ID',
  `log_name` varchar(64) NOT NULL COMMENT '日志名称；执行抽奖开始 userId',
  `log_index` int(11) NOT NULL DEFAULT '0' COMMENT '解析顺序；第几个字段',
  `log_type` varchar(8) NOT NULL DEFAULT 'Object' COMMENT '字段类型；Object、String',
  `attribute_name` varchar(32) NOT NULL COMMENT '属性名称',
  `attribute_field` varchar(8) NOT NULL COMMENT '属性字段',
  `attribute_ognl` varchar(16) NOT NULL COMMENT '解析公式',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据地图节点字段配置';

LOCK TABLES `monitor_data_map_node_field` WRITE;
/*!40000 ALTER TABLE `monitor_data_map_node_field` DISABLE KEYS */;

INSERT INTO `monitor_data_map_node_field` (`id`, `monitor_id`, `monitor_node_id`, `log_name`, `log_index`, `log_type`, `attribute_name`, `attribute_field`, `attribute_ognl`, `create_time`, `update_time`)
VALUES
	(1,'129009','1001','',3,'Object','用户ID','userId','userId','2024-05-21 08:38:01','2024-05-24 15:09:20'),
	(2,'129009','1001','',3,'Object','订单ID','orderId','orderId','2024-05-21 08:38:01','2024-05-24 15:09:21'),
	(3,'129009','1002','',3,'Object','用户ID','userId','userId','2024-05-21 08:38:01','2024-05-24 15:09:20'),
	(4,'129009','1003','',3,'Object','用户ID','userId','userId','2024-05-21 08:38:01','2024-05-24 15:09:20'),
	(5,'129009','1004','活动抽奖开始',3,'Object','用户ID','userId','userId','2024-05-21 08:38:01','2024-06-09 16:17:02'),
	(6,'129009','1005','活动抽奖开始',3,'Object','用户ID','userId','userId','2024-05-21 08:38:01','2024-06-09 16:17:02'),
	(7,'129101','1001','活动抽奖开始',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 16:26:18'),
	(8,'129101','10011','创建活动抽奖单开始',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 16:26:18'),
	(9,'129101','10012','创建活动抽奖单失败，活动状态未开启',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 16:29:45'),
	(10,'129101','10013','创建活动抽奖单失败，活动时间未开始',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 16:30:17'),
	(11,'129101','10014','创建参与活动订单存在',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 16:30:29'),
	(12,'129101','10015','创建活动抽奖单完成',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 16:30:34'),
	(13,'129101','1002','抽奖策略计算',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 17:32:37'),
	(14,'129101','10021','抽奖策略-责任链',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 17:33:29'),
	(15,'129101','100211','抽奖责任链-黑名单接管',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 17:52:15'),
	(16,'129101','100212','抽奖责任链-权重接管',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 17:52:40'),
	(17,'129101','100213','抽奖责任链-默认处理',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 17:34:18'),
	(18,'129101','10031','抽奖策略-规则树',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 17:35:04'),
	(19,'129101','100311','规则过滤-次数锁',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 17:35:13'),
	(20,'129101','100312','规则过滤-库存扣减',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 17:35:20'),
	(21,'129101','100313','规则过滤-兜底奖品',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 17:35:28'),
	(22,'129101','1004','中奖记录保存完成',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 17:32:37'),
	(23,'129101','10041','监听用户奖品发送消息，发奖完成',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 17:32:37'),
	(24,'129101','10042','活动抽奖失败',1,'String','用户ID','userId','userId','2024-06-09 16:26:18','2024-06-09 17:32:37');

/*!40000 ALTER TABLE `monitor_data_map_node_field` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 monitor_data_map_node_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `monitor_data_map_node_link`;

CREATE TABLE `monitor_data_map_node_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` varchar(8) NOT NULL COMMENT '监控ID',
  `from_monitor_node_id` varchar(8) NOT NULL COMMENT 'from 监控ID',
  `to_monitor_node_id` varchar(8) NOT NULL COMMENT 'to 监控ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监控数据地图节点链路配置';

LOCK TABLES `monitor_data_map_node_link` WRITE;
/*!40000 ALTER TABLE `monitor_data_map_node_link` DISABLE KEYS */;

INSERT INTO `monitor_data_map_node_link` (`id`, `monitor_id`, `from_monitor_node_id`, `to_monitor_node_id`, `create_time`, `update_time`)
VALUES
	(1,'129009','1001','1002','2024-05-28 14:14:24','2024-05-28 14:14:24'),
	(2,'129009','1002','1003','2024-05-28 14:14:24','2024-05-28 14:14:24'),
	(3,'129009','1002','1004','2024-05-28 14:14:24','2024-05-28 14:14:24'),
	(58,'129101','1001','10011','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(59,'129101','10011','10012','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(60,'129101','10011','10013','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(61,'129101','10011','10014','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(62,'129101','10011','10015','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(63,'129101','10015','1002','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(64,'129101','1002','10021','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(65,'129101','10021','100211','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(66,'129101','100211','100212','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(67,'129101','100212','100213','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(68,'129101','1002','10031','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(69,'129101','10031','100311','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(70,'129101','10031','100312','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(71,'129101','10031','100313','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(72,'129101','10011','1004','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(73,'129101','1004','10041','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(74,'129101','1004','10042','2024-06-09 18:41:29','2024-06-09 18:41:29'),
	(75,'129101','10014','1002','2024-06-09 18:41:29','2024-06-09 18:41:29');

/*!40000 ALTER TABLE `monitor_data_map_node_link` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
