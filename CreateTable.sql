--  建立資料表
-- 電影資料表
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    director VARCHAR(50),
    genre VARCHAR(30),
    duration INT, -- 分鐘
    release_date DATE,
    rating VARCHAR(10),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 影廳資料表
CREATE TABLE Theaters (
    theater_id INT PRIMARY KEY AUTO_INCREMENT,
    theater_name VARCHAR(50) NOT NULL,
    seat_capacity INT NOT NULL,
    screen_type VARCHAR(20),
    sound_system VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 座位資料表
CREATE TABLE Seats (
    seat_id INT PRIMARY KEY AUTO_INCREMENT,
    theater_id INT NOT NULL,
    seat_row CHAR(1) NOT NULL,
    seat_number INT NOT NULL,
    seat_type VARCHAR(20) DEFAULT 'Standard',
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id),
    UNIQUE KEY unique_seat (theater_id, seat_row, seat_number)
);

--  客戶資料表
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE,
    gender CHAR(1),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2.5 場次資料表
CREATE TABLE Showtimes (
    showtime_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    theater_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    available_seats INT,
    status VARCHAR(20) DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);

--  訂票資料表
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    showtime_id INT NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(8,2) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Pending',
    booking_status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (showtime_id) REFERENCES Showtimes(showtime_id)
);

--  訂票詳細資料表 (票券資料表)
CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    seat_id INT NOT NULL,
    ticket_price DECIMAL(6,2) NOT NULL,
    ticket_type VARCHAR(20) DEFAULT 'Adult',
    is_used BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);
