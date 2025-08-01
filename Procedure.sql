--  建立新訂票的存儲程序
CREATE PROCEDURE CreateBooking(
    IN p_customer_id INT,
    IN p_showtime_id INT,
    IN p_seat_ids TEXT,
    IN p_ticket_types TEXT,
    OUT p_booking_id INT,
    OUT p_total_amount DECIMAL(8,2)
)
BEGIN
    DECLARE v_price DECIMAL(6,2);
    DECLARE v_seat_count INT;
    
    -- 取得場次價格
    SELECT price INTO v_price FROM Showtimes WHERE showtime_id = p_showtime_id;
    
    -- 計算座位數量
    SET v_seat_count = (LENGTH(p_seat_ids) - LENGTH(REPLACE(p_seat_ids, ',', ''))) + 1;
    
    -- 計算總金額
    SET p_total_amount = v_price * v_seat_count;
    
    -- 建立訂票記錄
    INSERT INTO Bookings (customer_id, showtime_id, total_amount, payment_status, booking_status)
    VALUES (p_customer_id, p_showtime_id, p_total_amount, 'Pending', 'Active');
    
    SET p_booking_id = LAST_INSERT_ID();
    
    -- 更新場次可用座位數
    UPDATE Showtimes 
    SET available_seats = available_seats - v_seat_count 
    WHERE showtime_id = p_showtime_id;
END;

-- 聲明變量接收輸出
SET @new_booking_id = 0;
SET @total_price = 0;

-- 呼叫存儲過程
-- 參數說明：(客戶ID, 場次ID, 座位ID列表, 票種列表, 輸出訂單ID, 輸出總金額)
CALL CreateBooking(1, 1, '1,2,3', '成人,成人,兒童', @new_booking_id, @total_price);

-- 查看結果
SELECT @new_booking_id AS 訂單編號, @total_price AS 總金額;

--  取消訂票的存儲程序
CREATE PROCEDURE CancelBooking(
    IN p_booking_id INT,                 -- 輸入參數：訂票ID
    OUT p_result VARCHAR(100))           -- 輸出參數：取消結果
BEGIN
    DECLARE v_showtime_id INT;           -- 場次ID變數
    DECLARE v_seat_count INT;            -- 座位數量變數
    
    -- 查詢訂票對應的場次ID
    SELECT showtime_id INTO v_showtime_id 
    FROM Bookings 
    WHERE booking_id = p_booking_id AND booking_status = 'Active';
    
    -- 判斷訂票是否存在
    IF v_showtime_id IS NULL THEN
        SET p_result = '錯誤：訂票不存在或已取消';
    ELSE
        -- 計算該訂票的座位數量
        SELECT COUNT(*) INTO v_seat_count FROM Tickets WHERE booking_id = p_booking_id;
        
        -- 更新訂票狀態為已取消
        UPDATE Bookings SET booking_status = 'Cancelled' WHERE booking_id = p_booking_id;
        
        -- 釋放座位，增加場次可用座位數
        UPDATE Showtimes SET available_seats = available_seats + v_seat_count 
        WHERE showtime_id = v_showtime_id;
        
        -- 設置成功訊息
        SET p_result = CONCAT('成功：已取消訂票，釋放 ', v_seat_count, ' 個座位');
    END IF;
END;

DELIMITER $$
CREATE PROCEDURE CreateBookingWithSeatCheck(
    IN p_customer_id INT,
    IN p_showtime_id INT,
    IN p_seat_id_list TEXT, -- 簡化為只訂一個座位，方便測試
    OUT p_booking_id INT,
    OUT p_status_message VARCHAR(255)
)
BEGIN
    DECLARE v_seat_id INT;
    DECLARE v_is_available BOOLEAN;
    DECLARE v_price DECIMAL(6,2);

    -- 宣告一個處理程序，用來捕捉 SQL 錯誤並 Rollback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_status_message = '發生未知錯誤，交易已復原。';
    END;

    SET v_seat_id = CAST(p_seat_id_list AS UNSIGNED);

    START TRANSACTION;

    -- 檢查座位是否可用 (假設 Seats 表有 is_available 欄位)
    SELECT is_available INTO v_is_available 
    FROM Seats 
    WHERE seat_id = v_seat_id FOR UPDATE; -- 鎖定該行以避免同時預訂

    IF v_is_available = TRUE THEN
        -- 取得票價
        SELECT price INTO v_price FROM Showtimes WHERE showtime_id = p_showtime_id;

        -- 1. 新增訂單
        INSERT INTO Bookings (customer_id, showtime_id, total_amount, payment_status)
        VALUES (p_customer_id, p_showtime_id, v_price, 'Completed');
        SET p_booking_id = LAST_INSERT_ID();

        -- 2. 新增票券
        INSERT INTO Tickets (booking_id, seat_id, ticket_price)
        VALUES (p_booking_id, v_seat_id, v_price);

        -- 3. 更新座位狀態
        UPDATE Seats SET is_available = FALSE WHERE seat_id = v_seat_id;

        SET p_status_message = '訂票成功！';
        COMMIT;
    ELSE
        SET p_booking_id = -1;
        SET p_status_message = '訂票失敗：座位已被預訂或不存在。';
        ROLLBACK;
    END IF;
END$$
DELIMITER ;