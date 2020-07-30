DROP SCHEMA IF EXISTS `succor`;

CREATE DATABASE `succor`;

USE `succor`;

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users`
(
    `userId`           int(11)                  NOT NULL AUTO_INCREMENT,
    `username`         varchar(50)              NOT NULL,
    `password`         varchar(128)             NOT NULL,
    `role`             enum ('Admin','Regular') NOT NULL DEFAULT 'Regular',
    `createdByUserId`  int(11)                  NOT NULL,
    `createdDate`      datetime                 NOT NULL,
    `modifiedByUserId` int(11)                  NOT NULL,
    `modifiedDate`     datetime                 NOT NULL,
    `statusId`         int(11)                  NOT NULL,
    PRIMARY KEY (`userId`),
    UNIQUE KEY `usernameUnique` (`username`)
);

CREATE TABLE `Products`
(
    `productId`        int(11)      NOT NULL AUTO_INCREMENT,
    `productName`      varchar(128) NOT NULL,
    `productDetails`   varchar(128) NULL,
    `createdByUserId`  int(11)      NOT NULL,
    `createdDate`      datetime     NOT NULL,
    `modifiedByUserId` int(11)      NOT NULL,
    `modifiedDate`     datetime     NOT NULL,
    `statusId`         int(11)      NOT NULL,
    PRIMARY KEY (`productId`),
    UNIQUE KEY `productNameUnique` (`productName`)

);
