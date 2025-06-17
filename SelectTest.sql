-- 查詢特定日期的所有場次
SELECT * FROM ShowtimeDetails WHERE show_date = '2025-06-18' ORDER BY show_time;

-- 查詢特定客戶的所有訂票記錄
SELECT * FROM BookingDetails WHERE customer_name LIKE '%客戶021%';
-- 查詢特定影廳的座位狀況
SELECT * FROM SeatStatus WHERE theater_id = 1 ORDER BY seat_position;

--  查詢收入統計
SELECT 
    DATE(booking_date) as booking_date,
    COUNT(*) as total_bookings,
    SUM(total_amount) as daily_revenue
FROM Bookings 
WHERE payment_status = 'Completed'
GROUP BY DATE(booking_date)
ORDER BY booking_date DESC;

--  查詢熱門電影排行
SELECT 
    m.title,
    COUNT(b.booking_id) as booking_count,
    SUM(b.total_amount) as total_revenue
FROM Movies m
JOIN Showtimes s ON m.movie_id = s.movie_id
JOIN Bookings b ON s.showtime_id = b.showtime_id
WHERE b.payment_status = 'Completed'
GROUP BY m.movie_id, m.title
ORDER BY booking_count DESC;

-- 查詢每部電影的總票房收入
SELECT 
    m.title AS 電影名稱,
    COUNT(b.booking_id) AS 訂票數,
    SUM(b.total_amount) AS 總收入,
    AVG(b.total_amount) AS 平均每筆訂單金額
FROM Movies m
JOIN Showtimes s ON m.movie_id = s.movie_id
JOIN Bookings b ON s.showtime_id = b.showtime_id
WHERE b.payment_status = 'Completed'
GROUP BY m.movie_id, m.title
ORDER BY 總收入 DESC;

-- 查詢收入超過 2000 元的電影
SELECT 
    m.title AS 電影名稱,
    SUM(b.total_amount) AS 總收入
FROM Movies m
JOIN Showtimes s ON m.movie_id = s.movie_id
JOIN Bookings b ON s.showtime_id = b.showtime_id
WHERE b.payment_status = 'Completed'
GROUP BY m.movie_id, m.title
HAVING 總收入 > 2000
ORDER BY 總收入 DESC;

-- 查詢預訂最多票的客戶資料
SELECT 
    c.customer_id,
    CONCAT(c.first_name, c.last_name) AS 客戶姓名,
    c.email,
    c.phone,
    COUNT(b.booking_id) AS 訂票次數,
    SUM(b.total_amount) AS 總消費金額
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
WHERE b.payment_status = 'Completed'
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.phone
HAVING COUNT(b.booking_id) = (
    SELECT MAX(booking_count)
    FROM (
        SELECT COUNT(booking_id) AS booking_count
        FROM Bookings
        WHERE payment_status = 'Completed'
        GROUP BY customer_id
    ) AS counts
);
-- 每部電影最受歡迎的座位類型
SELECT 
    m.title,
    seat_stats.seat_type,
    seat_stats.booking_count,
    seat_stats.total_revenue
FROM Movies m
JOIN (
    SELECT 
        s.movie_id,
        st.seat_type,
        COUNT(b.booking_id) AS booking_count,
        SUM(b.total_amount) AS total_revenue,
        RANK() OVER (PARTITION BY s.movie_id ORDER BY COUNT(b.booking_id) DESC) AS rank_by_popularity
    FROM Showtimes s
    JOIN Bookings b ON s.showtime_id = b.showtime_id AND b.payment_status = 'Completed'
    JOIN Tickets t ON b.booking_id = t.booking_id
    JOIN Seats st ON t.seat_id = st.seat_id
    GROUP BY s.movie_id, st.seat_type
) AS seat_stats ON m.movie_id = seat_stats.movie_id
WHERE seat_stats.rank_by_popularity = 1
ORDER BY seat_stats.total_revenue DESC;