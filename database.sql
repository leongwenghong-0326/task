-- ==============================
-- 1. CREATE DATABASE
-- ==============================
CREATE DATABASE logistics_db;
USE logistics_db;

-- ==============================
-- 2. CREATE TABLE (5 columns)
-- ==============================
CREATE TABLE shipments (
    receiving_date DATE,
    tracking_number VARCHAR(50),
    product_name VARCHAR(100),
    cbm DECIMAL(10,2),
    weight DECIMAL(10,2)
);

-- ==============================
-- 3. INSERT 6 ROWS
-- ==============================
INSERT INTO shipments VALUES
('2026-04-01', 'TRK001', 'Laptop', 0.25, 2.50),
('2026-04-02', 'TRK002', 'Shoes', 0.15, 1.20),
('2026-04-03', 'TRK003', 'Phone', 0.10, 0.50),
('2026-04-04', 'TRK004', 'Table', 1.50, 20.00),
('2026-04-05', 'TRK005', 'Chair', 0.80, 8.00),
('2026-04-06', 'TRK006', 'Monitor', 0.40, 4.50);

-- ==============================
-- 4. VIEW ALL DATA
-- ==============================
SELECT * FROM shipments;

-- ==============================
-- 5. UPDATE (EDIT DATA)
-- ==============================
UPDATE shipments
SET weight = 3.00
WHERE tracking_number = 'TRK001';

-- ==============================
-- 6. DELETE ROW
-- ==============================
DELETE FROM shipments
WHERE tracking_number = 'TRK002';

-- ==============================
-- 7. FILTER DATA (WHERE)
-- ==============================
SELECT * FROM shipments
WHERE cbm > 0.5;

SELECT * FROM shipments
WHERE product_name = 'Laptop';

-- ==============================
-- 8. SORT DATA (ORDER BY)
-- ==============================
SELECT * FROM shipments
ORDER BY weight ASC;

SELECT * FROM shipments
ORDER BY cbm DESC;

-- ==============================
-- 9. ADD COLUMN
-- ==============================
ALTER TABLE shipments
ADD shipping_status VARCHAR(50);

-- ==============================
-- 10. UPDATE NEW COLUMN DATA
-- ==============================
UPDATE shipments
SET shipping_status = 'Delivered'
WHERE tracking_number = 'TRK001';

UPDATE shipments
SET shipping_status = 'Pending'
WHERE tracking_number != 'TRK001';

-- ==============================
-- 11. DELETE COLUMN
-- ==============================
ALTER TABLE shipments
DROP COLUMN shipping_status;

-- ==============================
-- 12. FINAL VIEW
-- ==============================
SELECT * FROM shipments;