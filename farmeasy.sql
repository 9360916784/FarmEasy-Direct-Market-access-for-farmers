-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2018 at 07:52 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `farmeasy`

-- Table structure for table `buyer`
CREATE TABLE `buyer` (
  `bid` INT NOT NULL AUTO_INCREMENT,
  `bname` VARCHAR(100) NOT NULL,
  `busername` VARCHAR(100) NOT NULL,
  `bpassword` VARCHAR(100) NOT NULL,
  `bhash` VARCHAR(100) NOT NULL,
  `bemail` VARCHAR(100) NOT NULL,
  `bmobile` VARCHAR(100) NOT NULL,
  `baddress` TEXT NOT NULL,
  `bactive` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `farmer`
CREATE TABLE `farmer` (
  `fid` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(255) NOT NULL,
  `fusername` VARCHAR(255) NOT NULL,
  `fpassword` VARCHAR(255) NOT NULL,
  `fhash` VARCHAR(255) NOT NULL,
  `femail` VARCHAR(255) NOT NULL,
  `fmobile` VARCHAR(255) NOT NULL,
  `faddress` TEXT NOT NULL,
  `factive` INT NOT NULL DEFAULT '0',
  `frating` INT NOT NULL DEFAULT '0',
  `picExt` VARCHAR(255) NOT NULL DEFAULT 'png',
  `picStatus` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `fproduct`
CREATE TABLE `fproduct` (
  `pid` INT NOT NULL AUTO_INCREMENT,
  `fid` INT NOT NULL,
  `product` VARCHAR(255) NOT NULL,
  `pcat` VARCHAR(255) NOT NULL,
  `pinfo` VARCHAR(255) NOT NULL,
  `price` FLOAT NOT NULL,
  `pimage` VARCHAR(255) NOT NULL DEFAULT 'blank.png',
  `picStatus` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  FOREIGN KEY (`fid`) REFERENCES `farmer` (`fid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `favorites`
CREATE TABLE `favorites` (
  `bid` INT NOT NULL,
  `pid` INT NOT NULL,
  FOREIGN KEY (`bid`) REFERENCES `buyer` (`bid`) ON DELETE CASCADE,
  FOREIGN KEY (`pid`) REFERENCES `fproduct` (`pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `review`
CREATE TABLE `review` (
  `pid` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `rating` INT NOT NULL,
  `comment` TEXT NOT NULL,
  FOREIGN KEY (`pid`) REFERENCES `fproduct` (`pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `transaction`
CREATE TABLE `transaction` (
  `tid` INT NOT NULL AUTO_INCREMENT,
  `bid` INT NOT NULL,
  `pid` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `mobile` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `pincode` VARCHAR(255) NOT NULL,
  `addr` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`tid`),
  FOREIGN KEY (`bid`) REFERENCES `buyer` (`bid`) ON DELETE CASCADE,
  FOREIGN KEY (`pid`) REFERENCES `fproduct` (`pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
