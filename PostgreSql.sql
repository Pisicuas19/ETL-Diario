-- Create OLAP database
CREATE DATABASE sportsbook_olap;

-- Connect to the database
\c sportsbook_olap

-- Daily totals per agent
CREATE TABLE daily_totals_by_agent (
    date DATE,
    agent_id INTEGER,
    book_id INTEGER,
    total_wagered NUMERIC(12,2),
    total_won NUMERIC(12,2),
    total_lost NUMERIC(12,2),
    total_wagers INTEGER,
    PRIMARY KEY (date, agent_id)
);

-- Player summary
CREATE TABLE player_summary (
    player_id INTEGER PRIMARY KEY,
    agent_id INTEGER,
    book_id INTEGER,
    player_name TEXT,
    total_wagered NUMERIC(12,2),
    total_won NUMERIC(12,2),
    total_wagers INTEGER,
    first_wager_date DATE,
    last_wager_date DATE
);

-- Detailed wagers for analysis
CREATE TABLE wager_details (
    wager_id INTEGER,
    player_id INTEGER,
    agent_id INTEGER,
    book_id INTEGER,
    event_id INTEGER,
    event_name TEXT,
    sport TEXT,
    amount NUMERIC(10,2),
    odds NUMERIC(5,2),
    won BOOLEAN,
    placed_at TIMESTAMP,
    event_date TIMESTAMP
);