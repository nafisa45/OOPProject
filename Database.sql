

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `bills` (
  `billID` int(50) NOT NULL,
  `reservationID` int(50) NOT NULL,
  `billDate` date NOT NULL,
  `billAmount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `bills` (`billID`, `reservationID`, `billDate`, `billAmount`) VALUES



CREATE TABLE `customers` (
  `customerIDNumber` int(50) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `customerNationality` varchar(20) NOT NULL,
  `customerGender` varchar(10) NOT NULL,
  `customerPhoneNo` int(50) NOT NULL,
  `customerEmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `customers` (`customerIDNumber`, `customerName`, `customerNationality`, `customerGender`, `customerPhoneNo`, `customerEmail`) VALUES

CREATE TABLE `reservations` (
  `reservationID` int(50) NOT NULL,
  `customerIDNumber` int(10) NOT NULL,
  `roomNumber` varchar(20) NOT NULL,
  `checkInDate` date NOT NULL,
  `checkOutDate` date NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Checked In'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `reservations` (`reservationID`, `customerIDNumber`, `roomNumber`, `checkInDate`, `checkOutDate`, `status`) VALUES
/*
CREATE TABLE `rooms` (
  `roomNumber` varchar(20) NOT NULL,
  `roomType` varchar(50) NOT NULL,
  `price` int(20) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Not Booked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

*/

INSERT INTO `rooms` (`roomNumber`, `roomType`, `price`, `status`) VALUES


CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `securityQuestion` varchar(100) NOT NULL,
  `answer` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*

INSERT INTO `users` (`id`, `name`, `username`, `password`, `gender`, `securityQuestion`, `answer`, `address`, `status`) VALUES


ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomNumber`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

*/


