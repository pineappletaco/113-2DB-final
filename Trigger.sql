-- 1. 準備測試數據
SET @test_customer_id = 1;
SET @test_showtime_id = 1;
SET @test_seat_id = 2;

-- 2. 創建訂票
INSERT INTO Bookings (customer_id, showtime_id, total_amount, payment_status, booking_status)
VALUES (@test_customer_id, @test_showtime_id, 450.00, 'Completed', 'Active');
SET @test_booking_id = LAST_INSERT_ID();

-- 3. 創建票券
INSERT INTO Tickets (booking_id, seat_id, ticket_price, ticket_type)
VALUES (@test_booking_id, @test_seat_id, 450.00, 'Adult');

-- 4. 檢查所有變化
SELECT * FROM audit_log ORDER BY timestamp DESC LIMIT 5;
SELECT * FROM Seats WHERE seat_id = @test_seat_id;

-- 5. 清理測試數據(可選)
DELETE FROM Tickets WHERE booking_id = @test_booking_id;
DELETE FROM Bookings WHERE booking_id = @test_booking_id;