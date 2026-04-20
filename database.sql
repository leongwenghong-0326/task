-- ==============================
-- 1. CREATE DATABASE
-- ==============================
CREATE DATABASE logistics_db;
USE logistics_db;

-- ==============================
-- 2. CREATE TABLE (with PRIMARY KEY to avoid safe mode error)
-- ==============================
CREATE TABLE shipments (
    receiving_date DATE,
    tracking_number VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(100),
    cbm DECIMAL(10,2),
    weight DECIMAL(10,2)
);

-- ==============================
-- 3. INSERT 6 ROWS
-- ==============================
INSERT INTO shipments VALUES
('2026-04-01', 'TRK001', 'Laptop', 0.50, 2.50),
('2026-04-02', 'TRK002', 'Phone', 0.20, 0.50),
('2026-04-03', 'TRK003', 'Monitor', 1.20, 5.00),
('2026-04-04', 'TRK004', 'Keyboard', 0.10, 0.80),
('2026-04-05', 'TRK005', 'Mouse', 0.05, 0.30),
('2026-04-06', 'TRK006', 'Printer', 2.00, 8.00);

-- ==============================
-- 4. EDIT (UPDATE DATA)
-- ==============================
UPDATE shipments
SET weight = 3.00
WHERE tracking_number = 'TRK001';

-- ==============================
-- 5. DELETE DATA
-- ==============================
DELETE FROM shipments
WHERE tracking_number = 'TRK006';

-- ==============================
-- 6. FILTER DATA (WHERE)
-- ==============================
SELECT *
FROM shipments
WHERE weight > 2;

-- ==============================
-- 7. SORT DATA (ORDER BY)
-- ==============================
SELECT *
FROM shipments
ORDER BY weight DESC;

-- ==============================
-- 8. ADD COLUMN (ALTER TABLE)
-- ==============================
ALTER TABLE shipments
ADD status VARCHAR(20);

-- ==============================
-- 9. UPDATE NEW COLUMN
-- ==============================
UPDATE shipments
SET status = 'Delivered'
WHERE tracking_number = 'TRK001';

-- ==============================
-- 10. REMOVE COLUMN
-- ==============================
ALTER TABLE shipments
DROP COLUMN status;