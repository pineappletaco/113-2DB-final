-- 在常用查詢欄位上建立索引
CREATE INDEX idx_showtimes_date_time ON Showtimes(show_date, show_time);
CREATE INDEX idx_bookings_customer ON Bookings(customer_id);
CREATE INDEX idx_bookings_showtime ON Bookings(showtime_id);
CREATE INDEX idx_tickets_booking ON Tickets(booking_id);
CREATE INDEX idx_seats_theater ON Seats(theater_id);
CREATE INDEX idx_customers_email ON Customers(email);