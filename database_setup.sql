CREATE DATABASE ocean_view_resort;
USE ocean_view_resort;

CREATE TABLE IF NOT EXISTS Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Insert a default admin user (password: admin123)
INSERT INTO Users (username, password) VALUES ('admin', 'admin123') ON DUPLICATE KEY UPDATE id=id;

CREATE TABLE IF NOT EXISTS Rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_type VARCHAR(50) NOT NULL,
    rate_per_night DECIMAL(10, 2) NOT NULL
);

-- Insert room types
INSERT INTO Rooms (room_type, rate_per_night) VALUES 
	('Single', 100.00),
	('Double', 150.00),
	('Deluxe', 250.00),
	('Suite', 400.00)
ON DUPLICATE KEY UPDATE id=id;

CREATE TABLE IF NOT EXISTS Reservations (
    reservation_number VARCHAR(20) PRIMARY KEY,
    guest_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL
);
