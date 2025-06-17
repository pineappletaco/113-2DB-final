-- 創建系統角色
CREATE ROLE IF NOT EXISTS 'movie_admin', 'movie_staff', 'movie_customer';

-- 管理員角色 - 完整權限
GRANT ALL PRIVILEGES ON MovieBookingSystem.* TO 'movie_admin';

-- 工作人員角色 - 有限管理權限
GRANT SELECT, INSERT, UPDATE ON MovieBookingSystem.* TO 'movie_staff';
GRANT EXECUTE ON PROCEDURE MovieBookingSystem.CreateBooking TO 'movie_staff';
GRANT EXECUTE ON PROCEDURE MovieBookingSystem.CancelBooking TO 'movie_staff';

-- 顧客角色 - 只讀和基本操作權限
GRANT SELECT ON MovieBookingSystem.Movies TO 'movie_customer';
GRANT SELECT ON MovieBookingSystem.Showtimes TO 'movie_customer';
GRANT EXECUTE ON PROCEDURE MovieBookingSystem.CreateBooking TO 'movie_customer';

-- 系統管理員帳戶
CREATE USER 'admin_john'@'localhost' IDENTIFIED BY 'StrongAdminP@ss123';
GRANT 'movie_admin' TO 'admin_john'@'localhost';
SET DEFAULT ROLE 'movie_admin' FOR 'admin_john'@'localhost';

-- 售票工作人員帳戶
CREATE USER 'staff_lisa'@'localhost' IDENTIFIED BY 'StaffSecureP@ss456';
GRANT 'movie_staff' TO 'staff_lisa'@'localhost';
SET DEFAULT ROLE 'movie_staff' FOR 'staff_lisa'@'localhost';

-- 顧客帳戶 (可由應用程式動態創建)
CREATE USER 'customer_mike'@'%' IDENTIFIED BY 'CustomerP@ss789';
GRANT 'movie_customer' TO 'customer_mike'@'%';
SET DEFAULT ROLE 'movie_customer' FOR 'customer_mike'@'%';

-- 限制特定表的敏感欄位
REVOKE SELECT (credit_card_number, password_hash) ON MovieBookingSystem.Customers FROM 'movie_staff';

-- 建立審計日誌的專用角色
CREATE ROLE 'movie_auditor';
GRANT SELECT ON MovieBookingSystem.audit_log TO 'movie_auditor';

-- 建立報表專用角色 (只讀)
CREATE ROLE 'movie_report';
GRANT SELECT ON MovieBookingSystem.Bookings TO 'movie_report';
GRANT SELECT ON MovieBookingSystem.Showtimes TO 'movie_report';

-- 創建安全視圖限制數據訪問
CREATE VIEW v_customer_bookings AS
SELECT b.booking_id, c.first_name, c.last_name, m.title, s.show_date, s.show_time
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Showtimes s ON b.showtime_id = s.showtime_id
JOIN Movies m ON s.movie_id = m.movie_id;

-- 授予角色訪問視圖的權限
GRANT SELECT ON MovieBookingSystem.v_customer_bookings TO 'movie_staff';
GRANT SELECT ON MovieBookingSystem.v_customer_bookings TO 'movie_report';

-- 限制取消訂票權限
REVOKE EXECUTE ON PROCEDURE MovieBookingSystem.CancelBooking FROM 'movie_customer';

-- 建立專用取消權限角色
CREATE ROLE 'movie_cancel_manager';
GRANT EXECUTE ON PROCEDURE MovieBookingSystem.CancelBooking TO 'movie_cancel_manager';

-- 查看角色權限
SHOW GRANTS FOR 'movie_staff';

-- 查看使用者權限
SHOW GRANTS FOR 'staff_lisa'@'localhost';

-- 測試權限 (使用特定使用者登入後執行)
-- 管理員應能執行所有操作
-- 工作人員應能創建但不能刪除數據
-- 顧客應只能查看電影和場次資訊