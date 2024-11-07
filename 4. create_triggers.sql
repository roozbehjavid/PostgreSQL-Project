-- create_triggers.sql

-- Trigger to prevent negative stock when inserting or updating orders
CREATE OR REPLACE FUNCTION prevent_negative_stock() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.quantity > (SELECT stock_level FROM inventory WHERE product_id = NEW.product_id) THEN
        RAISE EXCEPTION 'Not enough stock for product ID %', NEW.product_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_negative_stock_trigger
BEFORE INSERT OR UPDATE ON orders
FOR EACH ROW EXECUTE FUNCTION prevent_negative_stock();

-- Trigger for restock notification when stock level goes below threshold
CREATE OR REPLACE FUNCTION log_restock_notification() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.stock_level < 5 THEN
        INSERT INTO restock_log (product_id, product_name, stock_level, message)
        VALUES (NEW.product_id, NEW.product_name, NEW.stock_level, 'Stock below threshold, needs restocking.');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER restock_notification_trigger
AFTER UPDATE ON inventory
FOR EACH ROW EXECUTE FUNCTION log_restock_notification();

