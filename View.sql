--  建立視圖 (Views) 以簡化查詢

CREATE VIEW ShowtimeDetails AS
SELECT 
    s.showtime_id,
    m.title as movie_title,
    m.duration,
    m.rating,
    t.theater_name,
    t.screen_type,
    s.show_date,
    s.show_time,
    s.price,
    s.available_seats,
    s.status
FROM Showtimes s
JOIN Movies m ON s.movie_id = m.movie_id
JOIN Theaters t ON s.theater_id = t.theater_id;


DESCRIBE Customers;

-- 訂票詳細資訊視圖
CREATE VIEW BookingDetails AS
SELECT 
    b.booking_id,
    CONCAT(c.first_name, c.last_name) as customer_name,
    c.email,
    c.phone,
    m.title as movie_title,
    th.theater_name,
    s.show_date,
    s.show_time,
    b.total_amount,
    b.payment_status,
    b.booking_status,
    COUNT(t.ticket_id) as ticket_count
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Showtimes s ON b.showtime_id = s.showtime_id
JOIN Movies m ON s.movie_id = m.movie_id
JOIN Theaters th ON s.theater_id = th.theater_id
LEFT JOIN Tickets t ON b.booking_id = t.booking_id
GROUP BY b.booking_id, c.first_name, c.last_name, c.email, c.phone, m.title, 
         th.theater_name, s.show_date, s.show_time, b.total_amount, 
         b.payment_status, b.booking_status;

--  座位使用狀況視圖
CREATE VIEW SeatStatus AS
SELECT 
    s.seat_id,
    s.theater_id,
    t.theater_name,
    CONCAT(s.seat_row, s.seat_number) as seat_position,
    s.seat_type,
    CASE 
        WHEN tk.ticket_id IS NOT NULL THEN 'Booked'
        ELSE 'Available'
    END as status
FROM Seats s
JOIN Theaters t ON s.theater_id = t.theater_id
LEFT JOIN Tickets tk ON s.seat_id = tk.seat_id
LEFT JOIN Bookings b ON tk.booking_id = b.booking_id 
    AND b.booking_status = 'Active';

-- 電影類型收入視圖
CREATE VIEW MovieRevenueStats AS
SELECT 
    m.movie_id,
    m.title,
    m.genre,
    COUNT(DISTINCT b.booking_id) AS total_bookings,
    COUNT(t.ticket_id) AS total_tickets_sold,
    SUM(b.total_amount) AS total_revenue,
    AVG(b.total_amount) AS avg_booking_amount,
    MIN(s.show_date) AS first_show_date,
    MAX(s.show_date) AS last_show_date
FROM Movies m
LEFT JOIN Showtimes s ON m.movie_id = s.movie_id
LEFT JOIN Bookings b ON s.showtime_id = b.showtime_id AND b.payment_status = 'Completed'
LEFT JOIN Tickets t ON b.booking_id = t.booking_id
GROUP BY m.movie_id, m.title, m.genre;