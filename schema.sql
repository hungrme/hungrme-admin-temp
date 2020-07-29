-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: hungrmedb-v1.ccw21h1mi9ce.us-east-2.rds.amazonaws.com    Database: hungrme_db
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `allergens`
--

DROP TABLE IF EXISTS `allergens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'allergen name',
  `description` varchar(150) DEFAULT NULL,
  `updatedat` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branchId` bigint(20) NOT NULL AUTO_INCREMENT,
  `merchantId` bigint(20) NOT NULL,
  `branchName` varchar(45) NOT NULL,
  `reservationPossible` tinyint(4) DEFAULT NULL,
  `deliveryService` tinyint(4) DEFAULT NULL,
  `takeAway` tinyint(4) DEFAULT NULL,
  `recommendedFor` tinyint(4) DEFAULT NULL COMMENT 'Further business information\n		reservation possible Yes delivery service No Take-Away No Recommended for Dinner Parking & Parking road Suitable for children Yes Suitable for groups Yes Dress code Casual ambiance Casual noise normal alcohol All alcoholics Outdoor seating Yes WIRELESS INTERNET ACCESS No Has TV No  \n',
  `parking` tinyint(4) DEFAULT NULL,
  `suitableForChildren` tinyint(4) DEFAULT NULL,
  `dressCode` tinyint(4) DEFAULT NULL,
  `ambiance` tinyint(4) DEFAULT NULL,
  `noise` tinyint(4) DEFAULT NULL,
  `outdoorSeating` tinyint(4) DEFAULT NULL,
  `wlanAvailable` tinyint(4) DEFAULT NULL,
  `hasTV` tinyint(4) DEFAULT NULL,
  `monOpenHour` time DEFAULT NULL COMMENT 'Mon.\nClosed\n\nTue.\n18:00 - 00:00\n\nWed.\n18:00 - 00:00\n\nDo.\n18:00 - 00:00\n\nFr.\n18:00 - 00:00\n\nSat.\n18:00 - 00:00\nNow closed\nSo.\nClosed\n',
  `monCloseHour` time DEFAULT NULL,
  `tueOpenHour` time DEFAULT NULL,
  `tueCloseHour` time DEFAULT NULL,
  `wedOpenHour` time DEFAULT NULL,
  `wedCloseHour` time DEFAULT NULL,
  `thuOpenHour` time DEFAULT NULL,
  `thuCloseHour` time DEFAULT NULL,
  `friOpenHour` time DEFAULT NULL,
  `friCloseHour` time DEFAULT NULL,
  `satOpenHour` time DEFAULT NULL,
  `satCloseHour` time DEFAULT NULL,
  `sunOpenHour` time DEFAULT NULL,
  `sunCloseHour` time DEFAULT NULL,
  `hasBathroom` tinyint(4) DEFAULT NULL,
  `address` varchar(45) NOT NULL,
  `xCoordinate` decimal(15,0) NOT NULL,
  `yCoordinate` decimal(15,0) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `secondaryTelephone` int(11) DEFAULT NULL,
  `zCoordinate` decimal(15,0) DEFAULT NULL,
  PRIMARY KEY (`branchId`),
  KEY `merchantId2` (`merchantId`),
  CONSTRAINT `fk_branch_branch_servicesavailable` FOREIGN KEY (`branchId`) REFERENCES `branch_servicesavailable` (`branch_id`),
  CONSTRAINT `merchantId2` FOREIGN KEY (`merchantId`) REFERENCES `merchant` (`merchantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `branch_servicesavailable`
--

DROP TABLE IF EXISTS `branch_servicesavailable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_servicesavailable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `servicesavailable_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_branch_servicesavailable_servicesavailable_id` (`servicesavailable_id`),
  UNIQUE KEY `unq_branch_servicesavailable_branch_id` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cuisinetype`
--

DROP TABLE IF EXISTS `cuisinetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisinetype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `createdat` date DEFAULT NULL,
  `updatedat` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `foodId` bigint(20) NOT NULL AUTO_INCREMENT,
  `branchId` bigint(20) NOT NULL,
  `foodName` varchar(45) NOT NULL,
  `foodPrice` decimal(5,2) NOT NULL,
  `cuisine` varchar(45) NOT NULL,
  `carbServing` varchar(45) DEFAULT NULL COMMENT 'One serving of carbohydrate is measured as 15 grams. A food that contains 15 grams of carbohydrate is called “one carb serving”. For example, one slice of bread, a small piece of fruit, or a ear of corn each have around 15 grams of carb. Each of these equals one carb serving.',
  `calories` varchar(45) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL COMMENT 'food description',
  `allergyid` bigint(20) DEFAULT NULL,
  `cuisineid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`foodId`),
  KEY `branchId_idx` (`branchId`),
  CONSTRAINT `branchId1` FOREIGN KEY (`branchId`) REFERENCES `branch` (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `foodTag`
--

DROP TABLE IF EXISTS `foodTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodTag` (
  `foodTagId` bigint(20) NOT NULL AUTO_INCREMENT,
  `foodId` bigint(20) NOT NULL,
  `tagId` bigint(20) NOT NULL,
  PRIMARY KEY (`foodTagId`),
  KEY `foodId_idx` (`foodId`),
  KEY `tagId_idx` (`tagId`),
  CONSTRAINT `foodId1` FOREIGN KEY (`foodId`) REFERENCES `food` (`foodId`),
  CONSTRAINT `tagId0` FOREIGN KEY (`tagId`) REFERENCES `tags` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `food_allegens`
--

DROP TABLE IF EXISTS `food_allegens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_allegens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `foodid` bigint(20) NOT NULL,
  `allergenid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `memberId` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `accountType` tinyint(4) DEFAULT NULL,
  `emailAddress` varchar(60) DEFAULT NULL,
  `timeCreated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `membershipId` bigint(20) NOT NULL AUTO_INCREMENT,
  `membershipType` varchar(45) NOT NULL,
  `renewTime` datetime NOT NULL,
  `createdTime` timestamp NOT NULL,
  `hungrmecardNumber` varchar(45) NOT NULL,
  `merchantId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`membershipId`),
  KEY `merchantId_idx` (`merchantId`),
  CONSTRAINT `merchantId3` FOREIGN KEY (`merchantId`) REFERENCES `merchant` (`merchantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant` (
  `merchantId` bigint(20) NOT NULL AUTO_INCREMENT,
  `displayMerchantID` bigint(20) NOT NULL,
  `memberId` bigint(20) NOT NULL,
  `businessName` varchar(45) NOT NULL,
  `businessOwner` varchar(45) DEFAULT NULL,
  `membershipId` bigint(20) NOT NULL,
  PRIMARY KEY (`merchantId`),
  KEY `memberId_idx` (`memberId`),
  CONSTRAINT `memberId1` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `calories` int(11) DEFAULT NULL,
  `time_total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`,`name`),
  UNIQUE KEY `unq_role_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `roleId` bigint(20) NOT NULL,
  `permissionId` bigint(20) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_role_permission_roleid` (`roleId`),
  KEY `fk_role_permission_permission` (`permissionId`),
  CONSTRAINT `fk_role_permission_permission` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `fk_role_permission_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicesavailable`
--

DROP TABLE IF EXISTS `servicesavailable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicesavailable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `data` varchar(20) DEFAULT NULL,
  `last_updated` date DEFAULT NULL,
  ` yesno` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_servicesavailable_branch_servicesavailable` FOREIGN KEY (`id`) REFERENCES `branch_servicesavailable` (`servicesavailable_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tagId` bigint(20) NOT NULL,
  `tagName` varchar(45) DEFAULT NULL,
  `timeCreated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `xCoordinate` decimal(15,0) DEFAULT NULL,
  `yCoordinate` decimal(15,0) DEFAULT NULL,
  `zCoordinate` decimal(15,0) DEFAULT NULL,
  `dateOfBirth` datetime NOT NULL,
  `gender` varchar(45) NOT NULL,
  `memberId` bigint(20) DEFAULT NULL,
  `roleid` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `unq_user_roleid` (`roleid`),
  KEY `memberId_idx` (`memberId`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`),
  CONSTRAINT `memberId0` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userBranchRating`
--

DROP TABLE IF EXISTS `userBranchRating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userBranchRating` (
  `userBranchRatingId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `branchId` bigint(20) NOT NULL,
  `bathroomQuality` tinyint(4) DEFAULT NULL,
  `staff` tinyint(4) DEFAULT NULL,
  `cleanliness` tinyint(4) DEFAULT NULL,
  `serviceSpeed` tinyint(4) DEFAULT NULL,
  `foodQuality` tinyint(4) DEFAULT NULL,
  `price` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userBranchRatingId`),
  KEY `userId_idx` (`userId`),
  KEY `branchId_idx` (`branchId`),
  CONSTRAINT `branchId0` FOREIGN KEY (`branchId`) REFERENCES `branch` (`branchId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userBranchReview`
--

DROP TABLE IF EXISTS `userBranchReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userBranchReview` (
  `userBranchReviewId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `branchId` bigint(20) NOT NULL,
  `branchReview` varchar(255) NOT NULL,
  `upvoteCount` int(11) DEFAULT NULL,
  `downvoteCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`userBranchReviewId`),
  KEY `userId_idx` (`userId`),
  KEY `branchId_idx` (`branchId`),
  CONSTRAINT `branchId2` FOREIGN KEY (`branchId`) REFERENCES `branch` (`branchId`),
  CONSTRAINT `userId4` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userBranchSubscription`
--

DROP TABLE IF EXISTS `userBranchSubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userBranchSubscription` (
  `userBranchSubscriptionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `branchId` bigint(20) NOT NULL,
  `userBranchSubscription` tinyint(4) NOT NULL,
  `createdTime` timestamp NOT NULL,
  PRIMARY KEY (`userBranchSubscriptionId`),
  KEY `userId_idx` (`userId`),
  KEY `branchId_idx` (`branchId`),
  CONSTRAINT `branchId4` FOREIGN KEY (`branchId`) REFERENCES `branch` (`branchId`),
  CONSTRAINT `userId8` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userBranchVote`
--

DROP TABLE IF EXISTS `userBranchVote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userBranchVote` (
  `userBranchVoteId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `branchId` bigint(20) NOT NULL,
  `userBranchVoteValue` tinyint(4) NOT NULL,
  PRIMARY KEY (`userBranchVoteId`),
  KEY `userId_idx` (`userId`),
  KEY `branchId_idx` (`branchId`),
  CONSTRAINT `branchId3` FOREIGN KEY (`branchId`) REFERENCES `branch` (`branchId`),
  CONSTRAINT `userId6` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userFoodRating`
--

DROP TABLE IF EXISTS `userFoodRating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userFoodRating` (
  `userFoodRatingId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `foodId` bigint(20) NOT NULL,
  `presentation` tinyint(4) NOT NULL,
  `taste` tinyint(4) NOT NULL,
  `freshness` tinyint(4) NOT NULL,
  `cleanliness` tinyint(4) NOT NULL,
  `experience` tinyint(4) NOT NULL COMMENT 'Ratings\nSome publications issue starred ratings along with the reviews, while others let the writing stand for itself. AFJ does not take a position on the validity of ratings. Should you use ratings, here are some suggestions for how to think about imposing them:\nRatings should reflect a reviewer’s reaction to menu, atmosphere, service and value, and should be determined with regard to what the restaurant is trying to accomplish: An Indian restaurant shouldn’t be downgraded because it doesn’t serve filet mignon, for example. A star system should not serve as a hierarchy of elegance.\nHave a sense of what a star or other rating symbol mean. Although you should develop a rating system appropriate for your readership, here are some definitions to consider:\nFOUR STARS (Extraordinary) Transcendent. A one-of-a-kind experience that sets the local standard.\nTHREE STARS (Excellent) Superior. Memorable, high-quality food; exciting environs; savvy service; smart concept.\nTWO STARS (Good) Solid example of rest',
  PRIMARY KEY (`userFoodRatingId`),
  KEY `userId_idx` (`userId`),
  KEY `foodId_idx` (`foodId`),
  CONSTRAINT `foodId0` FOREIGN KEY (`foodId`) REFERENCES `food` (`foodId`),
  CONSTRAINT `userId0` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userFoodReview`
--

DROP TABLE IF EXISTS `userFoodReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userFoodReview` (
  `userFoodReviewId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `foodId` bigint(20) NOT NULL,
  `foodReview` varchar(255) NOT NULL,
  `upvoteCount` int(11) DEFAULT NULL,
  `downvoteCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`userFoodReviewId`),
  KEY `userId_idx` (`userId`),
  KEY `foodId_idx` (`foodId`),
  CONSTRAINT `foodId2` FOREIGN KEY (`foodId`) REFERENCES `food` (`foodId`),
  CONSTRAINT `userId3` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userFoodReviewVote`
--

DROP TABLE IF EXISTS `userFoodReviewVote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userFoodReviewVote` (
  `userFoodReviewVoteId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `userFoodReviewId` bigint(20) NOT NULL,
  `userFoodReviewVoteValue` tinyint(4) NOT NULL,
  PRIMARY KEY (`userFoodReviewVoteId`),
  KEY `userId_idx` (`userId`),
  KEY `userFoodReview_idx` (`userFoodReviewId`),
  CONSTRAINT `userFoodReview` FOREIGN KEY (`userFoodReviewId`) REFERENCES `userFoodReview` (`userFoodReviewId`),
  CONSTRAINT `userId7` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userFoodVote`
--

DROP TABLE IF EXISTS `userFoodVote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userFoodVote` (
  `userFoodVoteId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `foodId` bigint(20) NOT NULL,
  `userFoodVoteValue` tinyint(4) NOT NULL,
  PRIMARY KEY (`userFoodVoteId`),
  KEY `userId_idx` (`userId`),
  KEY `foodId_idx` (`foodId`),
  CONSTRAINT `foodId3` FOREIGN KEY (`foodId`) REFERENCES `food` (`foodId`),
  CONSTRAINT `userId5` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userPoints`
--

DROP TABLE IF EXISTS `userPoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userPoints` (
  `userPointsId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `pointsValue` int(11) DEFAULT NULL,
  `pointsUsageCount` int(11) DEFAULT NULL,
  `usedPoints` int(11) DEFAULT NULL,
  PRIMARY KEY (`userPointsId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `userId2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userReputation`
--

DROP TABLE IF EXISTS `userReputation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userReputation` (
  `userReputationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `upCount` int(11) DEFAULT NULL,
  `downCount` int(11) DEFAULT NULL,
  `reputationValue` int(11) DEFAULT NULL,
  PRIMARY KEY (`userReputationId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `userId1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-23 14:22:32
