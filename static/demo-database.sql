-- Demo Database for eDemand
-- This file creates a sample table and inserts demo data.
-- For demonstration and testing purposes only.

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email) VALUES
('Alice Demo', 'alice@example.com'),
('Bob Sample', 'bob@example.com');

-- Add more tables and demo data as needed. 