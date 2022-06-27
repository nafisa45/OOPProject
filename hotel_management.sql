SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `billID` int(50) NOT NULL,
  `reservationID` int(50) NOT NULL,
  `billDate` date NOT NULL,
  `billAmount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`billID`, `reservationID`, `billDate`, `billAmount`) VALUES
(1, 2, '2022-04-20', 28000),
(2, 5, '2022-05-23', 22000);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerIDNumber` int(50) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `customerNationality` varchar(20) NOT NULL,
  `customerGender` varchar(10) NOT NULL,
  `customerPhoneNo` int(50) NOT NULL,
  `customerEmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerIDNumber`, `customerName`, `customerNationality`, `customerGender`, `customerPhoneNo`, `customerEmail`) VALUES
(251002, 'Nafisa Anzum', 'Bangladesh', 'Female', 01911403292, 'nafisa20@gmail.com'),
(934957, 'Naziha Zaman', 'India', 'Female', 01911568093, 'Naz2@gmail.com'),
(25100992, 'Abdul Muhit', 'Bangladesh', 'Male', 01911408332, 'Muhit@gmail.com'),
(35518441, 'Sourove Hossen', 'Pakistan', 'Male', 01911443250, 'sourove@gmail.com'),
(22510092, 'Lee Jong Suk', 'south Korea', 'Male', 01911403099, 'LeeJong22@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservationID` int(50) NOT NULL,
  `customerIDNumber` int(10) NOT NULL,
  `roomNumber` varchar(20) NOT NULL,
  `checkInDate` date NOT NULL,
  `checkOutDate` date NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Checked In'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservationID`, `customerIDNumber`, `roomNumber`, `checkInDate`, `checkOutDate`, `status`) VALUES
(1, 22510092, '500', '2022-04-02', '2022-04-10', 'Checked In'),
(2, 25100992, '600', '2022-04-12', '2022-04-20', 'Checked Out'),
(3, 35518441, '505', '2022-04-21', '2022-04-30', 'Checked In'),
(4, 251002, '502', '2022-05-01', '2022-05-10', 'Checked In'),
(5, 934957, '605', '2022-05-12', '2022-05-23', 'Checked Out');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `roomNumber` varchar(20) NOT NULL,
  `roomType` varchar(50) NOT NULL,
  `price` int(20) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Not Booked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`roomNumber`, `roomType`, `price`, `status`) VALUES
('500', 'Single', 1000, 'Booked'),
('501', 'Double', 2000, 'Not Booked'),
('502', 'Single', 1000, 'Booked'),
('503', 'Family', 3500, 'Not Booked'),
('504', 'Executive Suite', 6000, 'Not Booked'),
('505', 'Double', 2000, 'Booked'),
('506', 'Executive Suite', 6000, 'Not Booked'),
('507', 'Executive Suite', 6000, 'Not Booked'),
('600', 'Family', 3500, 'Not Booked'),
('601', 'Single', 1000, 'Not Booked'),
('602', 'Double', 2000, 'Not Booked'),
('603', 'Presidential Suite', 12000, 'Not Booked'),
('604', 'Presidential Suite', 12000, 'Not Booked'),
('605', 'Double', 2000, 'Not Booked');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `gender`, `address`, `status`) VALUES
(1, 'Nafisa', 'Nafisa80', 'Nafisa', 'Female',  'Dhanmondi', NULL),
(2, 'Sourove', 'Sourove22', 'Sour22', 'Male', 'Mohammadpur', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`billID`),
  ADD UNIQUE KEY `fk_bills_res` (`reservationID`) USING BTREE;

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerIDNumber`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservationID`),
  ADD KEY `fk_customers_res` (`customerIDNumber`),
  ADD KEY `fk_rooms_res` (`roomNumber`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomNumber`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `billID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservationID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `fk_bills_res` FOREIGN KEY (`reservationID`) REFERENCES `reservations` (`reservationID`) ON UPDATE CASCADE;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_customers_res` FOREIGN KEY (`customerIDNumber`) REFERENCES `customers` (`customerIDNumber`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rooms_res` FOREIGN KEY (`roomNumber`) REFERENCES `rooms` (`roomNumber`) ON UPDATE CASCADE;
COMMIT;

