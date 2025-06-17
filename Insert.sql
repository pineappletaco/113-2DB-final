-- 插入電影資料
INSERT INTO Movies (title, director, genre, duration, release_date, rating, description) VALUES
('阿凡達：水之道', 'James Cameron', '科幻', 192, '2022-12-16', 'PG-13', '潘朵拉星球的壯麗冒險續集'),
('捍衛戰士：獨行俠', 'Joseph Kosinski', '動作', 130, '2022-05-27', 'PG-13', '湯姆克魯斯重返天際的精彩續集'),
('黑豹2：瓦干達萬歲', 'Ryan Coogler', '動作', 161, '2022-11-11', 'PG-13', '瓦干達王國的英雄傳奇'),
('玩具總動員4', 'Josh Cooley', '動畫', 100, '2019-06-21', 'G', '胡迪和夥伴們的全新冒險'),
('蜘蛛人：無家日', 'Jon Watts', '動作', 148, '2021-12-17', 'PG-13', '多重宇宙的蜘蛛人大集合');

-- 插入影廳資料 (3個影廳)
INSERT INTO Theaters (theater_name, seat_capacity, screen_type, sound_system) VALUES
('IMAX影廳', 40, 'IMAX', 'Dolby Atmos'),
('4DX影廳', 80, '4DX', 'DTS-X'),
('標準影廳', 120, 'Standard', 'Dolby Digital');

-- 影廳1 
INSERT INTO Seats (theater_id, seat_row, seat_number, seat_type) VALUES
-- A排
(1, 'A', 1, 'Premium'), (1, 'A', 2, 'Premium'), (1, 'A', 3, 'Premium'), (1, 'A', 4, 'Premium'),
(1, 'A', 5, 'Premium'), (1, 'A', 6, 'Premium'), (1, 'A', 7, 'Premium'), (1, 'A', 8, 'Premium'),
-- B排
(1, 'B', 1, 'Premium'), (1, 'B', 2, 'Premium'), (1, 'B', 3, 'Premium'), (1, 'B', 4, 'Premium'),
(1, 'B', 5, 'Premium'), (1, 'B', 6, 'Premium'), (1, 'B', 7, 'Premium'), (1, 'B', 8, 'Premium'),
-- C排
(1, 'C', 1, 'Standard'), (1, 'C', 2, 'Standard'), (1, 'C', 3, 'Standard'), (1, 'C', 4, 'Standard'),
(1, 'C', 5, 'Standard'), (1, 'C', 6, 'Standard'), (1, 'C', 7, 'Standard'), (1, 'C', 8, 'Standard'),
-- D排
(1, 'D', 1, 'Standard'), (1, 'D', 2, 'Standard'), (1, 'D', 3, 'Standard'), (1, 'D', 4, 'Standard'),
(1, 'D', 5, 'Standard'), (1, 'D', 6, 'Standard'), (1, 'D', 7, 'Standard'), (1, 'D', 8, 'Standard'),
-- E排
(1, 'E', 1, 'Standard'), (1, 'E', 2, 'Standard'), (1, 'E', 3, 'Standard'), (1, 'E', 4, 'Standard'),
(1, 'E', 5, 'Standard'), (1, 'E', 6, 'Standard'), (1, 'E', 7, 'Standard'), (1, 'E', 8, 'Standard');

-- 影廳2 
INSERT INTO Seats (theater_id, seat_row, seat_number, seat_type) VALUES
(2, 'A', 1, 'Premium'), (2, 'A', 2, 'Premium'), (2, 'A', 3, 'Premium'), (2, 'A', 4, 'Premium'), (2, 'A', 5, 'Premium'),
(2, 'A', 6, 'Premium'), (2, 'A', 7, 'Premium'), (2, 'A', 8, 'Premium'), (2, 'A', 9, 'Premium'), (2, 'A', 10, 'Premium'),
(2, 'B', 1, 'Premium'), (2, 'B', 2, 'Premium'), (2, 'B', 3, 'Premium'), (2, 'B', 4, 'Premium'), (2, 'B', 5, 'Premium'),
(2, 'B', 6, 'Premium'), (2, 'B', 7, 'Premium'), (2, 'B', 8, 'Premium'), (2, 'B', 9, 'Premium'), (2, 'B', 10, 'Premium'),
(2, 'C', 1, 'Standard'), (2, 'C', 2, 'Standard'), (2, 'C', 3, 'Standard'), (2, 'C', 4, 'Standard'), (2, 'C', 5, 'Standard'),
(2, 'C', 6, 'Standard'), (2, 'C', 7, 'Standard'), (2, 'C', 8, 'Standard'), (2, 'C', 9, 'Standard'), (2, 'C', 10, 'Standard'),
(2, 'D', 1, 'Standard'), (2, 'D', 2, 'Standard'), (2, 'D', 3, 'Standard'), (2, 'D', 4, 'Standard'), (2, 'D', 5, 'Standard'),
(2, 'D', 6, 'Standard'), (2, 'D', 7, 'Standard'), (2, 'D', 8, 'Standard'), (2, 'D', 9, 'Standard'), (2, 'D', 10, 'Standard'),
(2, 'E', 1, 'Standard'), (2, 'E', 2, 'Standard'), (2, 'E', 3, 'Standard'), (2, 'E', 4, 'Standard'), (2, 'E', 5, 'Standard'),
(2, 'E', 6, 'Standard'), (2, 'E', 7, 'Standard'), (2, 'E', 8, 'Standard'), (2, 'E', 9, 'Standard'), (2, 'E', 10, 'Standard'),
(2, 'F', 1, 'Standard'), (2, 'F', 2, 'Standard'), (2, 'F', 3, 'Standard'), (2, 'F', 4, 'Standard'), (2, 'F', 5, 'Standard'),
(2, 'F', 6, 'Standard'), (2, 'F', 7, 'Standard'), (2, 'F', 8, 'Standard'), (2, 'F', 9, 'Standard'), (2, 'F', 10, 'Standard'),
(2, 'G', 1, 'Economy'), (2, 'G', 2, 'Economy'), (2, 'G', 3, 'Economy'), (2, 'G', 4, 'Economy'), (2, 'G', 5, 'Economy'),
(2, 'G', 6, 'Economy'), (2, 'G', 7, 'Economy'), (2, 'G', 8, 'Economy'), (2, 'G', 9, 'Economy'), (2, 'G', 10, 'Economy'),
(2, 'H', 1, 'Economy'), (2, 'H', 2, 'Economy'), (2, 'H', 3, 'Economy'), (2, 'H', 4, 'Economy'), (2, 'H', 5, 'Economy'),
(2, 'H', 6, 'Economy'), (2, 'H', 7, 'Economy'), (2, 'H', 8, 'Economy'), (2, 'H', 9, 'Economy'), (2, 'H', 10, 'Economy');

-- 影廳3 
INSERT INTO Seats (theater_id, seat_row, seat_number, seat_type) 
SELECT 3, seat_row, seat_number, seat_type FROM (
    SELECT 'A' as seat_row, 1 as seat_number, 'Premium' as seat_type UNION ALL
    SELECT 'A', 2, 'Premium' UNION ALL SELECT 'A', 3, 'Premium' UNION ALL SELECT 'A', 4, 'Premium' UNION ALL
    SELECT 'A', 5, 'Premium' UNION ALL SELECT 'A', 6, 'Premium' UNION ALL SELECT 'A', 7, 'Premium' UNION ALL
    SELECT 'A', 8, 'Premium' UNION ALL SELECT 'A', 9, 'Premium' UNION ALL SELECT 'A', 10, 'Premium' UNION ALL
    SELECT 'A', 11, 'Premium' UNION ALL SELECT 'A', 12, 'Premium' UNION ALL
    SELECT 'B', 1, 'Premium' UNION ALL SELECT 'B', 2, 'Premium' UNION ALL SELECT 'B', 3, 'Premium' UNION ALL
    SELECT 'B', 4, 'Premium' UNION ALL SELECT 'B', 5, 'Premium' UNION ALL SELECT 'B', 6, 'Premium' UNION ALL
    SELECT 'B', 7, 'Premium' UNION ALL SELECT 'B', 8, 'Premium' UNION ALL SELECT 'B', 9, 'Premium' UNION ALL
    SELECT 'B', 10, 'Premium' UNION ALL SELECT 'B', 11, 'Premium' UNION ALL SELECT 'B', 12, 'Premium' UNION ALL
    SELECT 'C', 1, 'Standard' UNION ALL SELECT 'C', 2, 'Standard' UNION ALL SELECT 'C', 3, 'Standard' UNION ALL
    SELECT 'C', 4, 'Standard' UNION ALL SELECT 'C', 5, 'Standard' UNION ALL SELECT 'C', 6, 'Standard' UNION ALL
    SELECT 'C', 7, 'Standard' UNION ALL SELECT 'C', 8, 'Standard' UNION ALL SELECT 'C', 9, 'Standard' UNION ALL
    SELECT 'C', 10, 'Standard' UNION ALL SELECT 'C', 11, 'Standard' UNION ALL SELECT 'C', 12, 'Standard' UNION ALL
    SELECT 'D', 1, 'Standard' UNION ALL SELECT 'D', 2, 'Standard' UNION ALL SELECT 'D', 3, 'Standard' UNION ALL
    SELECT 'D', 4, 'Standard' UNION ALL SELECT 'D', 5, 'Standard' UNION ALL SELECT 'D', 6, 'Standard' UNION ALL
    SELECT 'D', 7, 'Standard' UNION ALL SELECT 'D', 8, 'Standard' UNION ALL SELECT 'D', 9, 'Standard' UNION ALL
    SELECT 'D', 10, 'Standard' UNION ALL SELECT 'D', 11, 'Standard' UNION ALL SELECT 'D', 12, 'Standard' UNION ALL
    SELECT 'E', 1, 'Standard' UNION ALL SELECT 'E', 2, 'Standard' UNION ALL SELECT 'E', 3, 'Standard' UNION ALL
    SELECT 'E', 4, 'Standard' UNION ALL SELECT 'E', 5, 'Standard' UNION ALL SELECT 'E', 6, 'Standard' UNION ALL
    SELECT 'E', 7, 'Standard' UNION ALL SELECT 'E', 8, 'Standard' UNION ALL SELECT 'E', 9, 'Standard' UNION ALL
    SELECT 'E', 10, 'Standard' UNION ALL SELECT 'E', 11, 'Standard' UNION ALL SELECT 'E', 12, 'Standard' UNION ALL
    SELECT 'F', 1, 'Standard' UNION ALL SELECT 'F', 2, 'Standard' UNION ALL SELECT 'F', 3, 'Standard' UNION ALL
    SELECT 'F', 4, 'Standard' UNION ALL SELECT 'F', 5, 'Standard' UNION ALL SELECT 'F', 6, 'Standard' UNION ALL
    SELECT 'F', 7, 'Standard' UNION ALL SELECT 'F', 8, 'Standard' UNION ALL SELECT 'F', 9, 'Standard' UNION ALL
    SELECT 'F', 10, 'Standard' UNION ALL SELECT 'F', 11, 'Standard' UNION ALL SELECT 'F', 12, 'Standard' UNION ALL
    SELECT 'G', 1, 'Standard' UNION ALL SELECT 'G', 2, 'Standard' UNION ALL SELECT 'G', 3, 'Standard' UNION ALL
    SELECT 'G', 4, 'Standard' UNION ALL SELECT 'G', 5, 'Standard' UNION ALL SELECT 'G', 6, 'Standard' UNION ALL
    SELECT 'G', 7, 'Standard' UNION ALL SELECT 'G', 8, 'Standard' UNION ALL SELECT 'G', 9, 'Standard' UNION ALL
    SELECT 'G', 10, 'Standard' UNION ALL SELECT 'G', 11, 'Standard' UNION ALL SELECT 'G', 12, 'Standard' UNION ALL
    SELECT 'H', 1, 'Economy' UNION ALL SELECT 'H', 2, 'Economy' UNION ALL SELECT 'H', 3, 'Economy' UNION ALL
    SELECT 'H', 4, 'Economy' UNION ALL SELECT 'H', 5, 'Economy' UNION ALL SELECT 'H', 6, 'Economy' UNION ALL
    SELECT 'H', 7, 'Economy' UNION ALL SELECT 'H', 8, 'Economy' UNION ALL SELECT 'H', 9, 'Economy' UNION ALL
    SELECT 'H', 10, 'Economy' UNION ALL SELECT 'H', 11, 'Economy' UNION ALL SELECT 'H', 12, 'Economy' UNION ALL
    SELECT 'I', 1, 'Economy' UNION ALL SELECT 'I', 2, 'Economy' UNION ALL SELECT 'I', 3, 'Economy' UNION ALL
    SELECT 'I', 4, 'Economy' UNION ALL SELECT 'I', 5, 'Economy' UNION ALL SELECT 'I', 6, 'Economy' UNION ALL
    SELECT 'I', 7, 'Economy' UNION ALL SELECT 'I', 8, 'Economy' UNION ALL SELECT 'I', 9, 'Economy' UNION ALL
    SELECT 'I', 10, 'Economy' UNION ALL SELECT 'I', 11, 'Economy' UNION ALL SELECT 'I', 12, 'Economy' UNION ALL
    SELECT 'J', 1, 'Economy' UNION ALL SELECT 'J', 2, 'Economy' UNION ALL SELECT 'J', 3, 'Economy' UNION ALL
    SELECT 'J', 4, 'Economy' UNION ALL SELECT 'J', 5, 'Economy' UNION ALL SELECT 'J', 6, 'Economy' UNION ALL
    SELECT 'J', 7, 'Economy' UNION ALL SELECT 'J', 8, 'Economy' UNION ALL SELECT 'J', 9, 'Economy' UNION ALL
    SELECT 'J', 10, 'Economy' UNION ALL SELECT 'J', 11, 'Economy' UNION ALL SELECT 'J', 12, 'Economy'
) AS seat_data;

-- 插入客戶資料 
INSERT INTO Customers (first_name, last_name, email, phone, date_of_birth, gender) 
SELECT 
    CONCAT('客戶', LPAD(n, 3, '0')) as first_name,
    '測試' as last_name,
    CONCAT('customer', LPAD(n, 3, '0'), '@email.com') as email,
    CONCAT('091', LPAD(n, 7, '0')) as phone,
    DATE_ADD('1980-01-01', INTERVAL FLOOR(RAND() * 15000) DAY) as date_of_birth,
    CASE WHEN n % 2 = 0 THEN 'F' ELSE 'M' END as gender
FROM (
    SELECT 21 as n UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25 UNION ALL
    SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL SELECT 30 UNION ALL
    SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL
    SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL SELECT 40 UNION ALL
    SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45 UNION ALL
    SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49 UNION ALL SELECT 50 UNION ALL
    SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55 UNION ALL
    SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59 UNION ALL SELECT 60 UNION ALL
    SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65 UNION ALL
    SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69 UNION ALL SELECT 70 UNION ALL
    SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75 UNION ALL
    SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79 UNION ALL SELECT 80 UNION ALL
    SELECT 81 UNION ALL SELECT 82 UNION ALL SELECT 83 UNION ALL SELECT 84 UNION ALL SELECT 85 UNION ALL
    SELECT 86 UNION ALL SELECT 87 UNION ALL SELECT 88 UNION ALL SELECT 89 UNION ALL SELECT 90 UNION ALL
    SELECT 91 UNION ALL SELECT 92 UNION ALL SELECT 93 UNION ALL SELECT 94 UNION ALL SELECT 95 UNION ALL
    SELECT 96 UNION ALL SELECT 97 UNION ALL SELECT 98 UNION ALL SELECT 99 UNION ALL SELECT 100 UNION ALL
    SELECT 101 UNION ALL SELECT 102 UNION ALL SELECT 103 UNION ALL SELECT 104 UNION ALL SELECT 105 UNION ALL
    SELECT 106 UNION ALL SELECT 107 UNION ALL SELECT 108 UNION ALL SELECT 109 UNION ALL SELECT 110 UNION ALL
    SELECT 111 UNION ALL SELECT 112 UNION ALL SELECT 113 UNION ALL SELECT 114 UNION ALL SELECT 115 UNION ALL
    SELECT 116 UNION ALL SELECT 117 UNION ALL SELECT 118 UNION ALL SELECT 119 UNION ALL SELECT 120 UNION ALL
    SELECT 121 UNION ALL SELECT 122 UNION ALL SELECT 123 UNION ALL SELECT 124 UNION ALL SELECT 125 UNION ALL
    SELECT 126 UNION ALL SELECT 127 UNION ALL SELECT 128 UNION ALL SELECT 129 UNION ALL SELECT 130 UNION ALL
    SELECT 131 UNION ALL SELECT 132 UNION ALL SELECT 133 UNION ALL SELECT 134 UNION ALL SELECT 135 UNION ALL
    SELECT 136 UNION ALL SELECT 137 UNION ALL SELECT 138 UNION ALL SELECT 139 UNION ALL SELECT 140 UNION ALL
    SELECT 141 UNION ALL SELECT 142 UNION ALL SELECT 143 UNION ALL SELECT 144 UNION ALL SELECT 145 UNION ALL
    SELECT 146 UNION ALL SELECT 147 UNION ALL SELECT 148 UNION ALL SELECT 149 UNION ALL SELECT 150 UNION ALL
    SELECT 151 UNION ALL SELECT 152 UNION ALL SELECT 153 UNION ALL SELECT 154 UNION ALL SELECT 155 UNION ALL
    SELECT 156 UNION ALL SELECT 157 UNION ALL SELECT 158 UNION ALL SELECT 159 UNION ALL SELECT 160 UNION ALL
    SELECT 161 UNION ALL SELECT 162 UNION ALL SELECT 163 UNION ALL SELECT 164 UNION ALL SELECT 165 UNION ALL
    SELECT 166 UNION ALL SELECT 167 UNION ALL SELECT 168 UNION ALL SELECT 169 UNION ALL SELECT 170 UNION ALL
    SELECT 171 UNION ALL SELECT 172 UNION ALL SELECT 173 UNION ALL SELECT 174 UNION ALL SELECT 175 UNION ALL
    SELECT 176 UNION ALL SELECT 177 UNION ALL SELECT 178 UNION ALL SELECT 179 UNION ALL SELECT 180 UNION ALL
    SELECT 181 UNION ALL SELECT 182 UNION ALL SELECT 183 UNION ALL SELECT 184 UNION ALL SELECT 185 UNION ALL
    SELECT 186 UNION ALL SELECT 187 UNION ALL SELECT 188 UNION ALL SELECT 189 UNION ALL SELECT 190 UNION ALL
    SELECT 191 UNION ALL SELECT 192 UNION ALL SELECT 193 UNION ALL SELECT 194 UNION ALL SELECT 195 UNION ALL
    SELECT 196 UNION ALL SELECT 197 UNION ALL SELECT 198 UNION ALL SELECT 199 UNION ALL SELECT 200
) numbers;

-- 插入場次資料
INSERT INTO Showtimes (movie_id, theater_id, show_date, show_time, price, available_seats) VALUES
-- 阿凡達：水之道
(1, 1, '2025-06-18', '14:00:00', 450.00, 40),
(1, 1, '2025-06-18', '17:30:00', 450.00, 40),
(1, 1, '2025-06-18', '21:00:00', 450.00, 40),
(1, 2, '2025-06-19', '13:30:00', 380.00, 80),
(1, 2, '2025-06-19', '16:45:00', 380.00, 80),
(1, 3, '2025-06-20', '15:00:00', 320.00, 120),

-- 捍衛戰士：獨行俠
(2, 1, '2025-06-18', '19:30:00', 450.00, 40),
(2, 2, '2025-06-18', '14:15:00', 380.00, 80),
(2, 2, '2025-06-18', '19:00:00', 380.00, 80),
(2, 3, '2025-06-19', '13:00:00', 320.00, 120),
(2, 3, '2025-06-19', '16:30:00', 320.00, 120),

-- 黑豹2：瓦干達萬歲
(3, 1, '2025-06-19', '15:00:00', 450.00, 40),
(3, 2, '2025-06-18', '21:30:00', 380.00, 80),
(3, 2, '2025-06-19', '20:00:00', 380.00, 80),
(3, 3, '2025-06-18', '18:00:00', 320.00, 120),
(3, 3, '2025-06-20', '12:30:00', 320.00, 120),

-- 玩具總動員4
(4, 2, '2025-06-18', '11:00:00', 380.00, 80),
(4, 2, '2025-06-19', '11:30:00', 380.00, 80),
(4, 3, '2025-06-18', '10:30:00', 320.00, 120),
(4, 3, '2025-06-19', '10:00:00', 320.00, 120),
(4, 3, '2025-06-20', '11:15:00', 320.00, 120),

-- 蜘蛛人：無家日
(5, 1, '2025-06-20', '13:30:00', 450.00, 40),
(5, 1, '2025-06-20', '16:00:00', 450.00, 40),
(5, 2, '2025-06-20', '14:30:00', 380.00, 80),
(5, 2, '2025-06-20', '18:15:00', 380.00, 80),
(5, 3, '2025-06-19', '21:30:00', 320.00, 120),
(5, 3, '2025-06-20', '20:00:00', 320.00, 120);

-- 插入一些範例訂票資料
INSERT INTO Bookings (customer_id, showtime_id, total_amount, payment_status, booking_status) VALUES
(1, 1, 900.00, 'Completed', 'Active'),   -- 王小明訂了2張阿凡達票
(2, 5, 760.00, 'Completed', 'Active'),   -- 李小華訂了2張阿凡達票
(3, 8, 380.00, 'Completed', 'Active'),   -- 陳志強訂了1張捍衛戰士票
(4, 12, 640.00, 'Completed', 'Active'),  -- 林美玲訂了2張黑豹票
(5, 15, 760.00, 'Completed', 'Active'),  -- 張大偉訂了2張玩具總動員票
(6, 18, 960.00, 'Completed', 'Active'),  -- 黃小芳訂了3張玩具總動員票
(7, 21, 450.00, 'Completed', 'Active'),  -- 吳建國訂了1張蜘蛛人票
(8, 22, 900.00, 'Completed', 'Active'),  -- 周雅婷訂了2張蜘蛛人票
(9, 3, 1350.00, 'Completed', 'Active'), -- 徐志明訂了3張阿凡達票
(10, 7, 450.00, 'Pending', 'Active');   -- 孫麗華訂了1張捍衛戰士票(未付款)

-- 插入票券詳細資料
INSERT INTO Tickets (booking_id, seat_id, ticket_price, ticket_type) VALUES
-- 訂票1: 王小明的2張票 (IMAX影廳 A1, A2)
(1, 1, 450.00, 'Adult'),
(1, 2, 450.00, 'Adult'),

-- 訂票2: 李小華的2張票 (4DX影廳 A1, A2)
(2, 41, 380.00, 'Adult'),
(2, 42, 380.00, 'Adult'),

-- 訂票3: 陳志強的1張票 (4DX影廳 A3)
(3, 43, 380.00, 'Adult'),

-- 訂票4: 林美玲的2張票 (標準影廳 A1, A2)
(4, 121, 320.00, 'Adult'),
(4, 122, 320.00, 'Adult'),

-- 訂票5: 張大偉的2張票 (4DX影廳 A4, A5)
(5, 44, 380.00, 'Adult'),
(5, 45, 380.00, 'Adult'),

-- 訂票6: 黃小芳的3張票 (標準影廳 A3, A4, A5)
(6, 123, 320.00, 'Adult'),
(6, 124, 320.00, 'Child'),
(6, 125, 320.00, 'Child'),

-- 訂票7: 吳建國的1張票 (IMAX影廳 B1)
(7, 9, 450.00, 'Adult'),

-- 訂票8: 周雅婷的2張票 (IMAX影廳 B2, B3)
(8, 10, 450.00, 'Adult'),
(8, 11, 450.00, 'Adult'),

-- 訂票9: 徐志明的3張票 (IMAX影廳 C1, C2, C3)
(9, 17, 450.00, 'Adult'),
(9, 18, 450.00, 'Adult'),
(9, 19, 450.00, 'Adult'),

-- 訂票10: 孫麗華的1張票 (IMAX影廳 B4)
(10, 12, 450.00, 'Adult');