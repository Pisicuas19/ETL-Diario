-- Create OLTP database
CREATE DATABASE SportsbookOLTP;
GO

USE SportsbookOLTP;
GO

-- Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Agents table
CREATE TABLE Agents (
    AgentID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT NOT NULL,
    Name NVARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Players table
CREATE TABLE Players (
    PlayerID INT PRIMARY KEY IDENTITY(1,1),
    AgentID INT NOT NULL,
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1,
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID)
);

-- Events table
CREATE TABLE Events (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    Sport NVARCHAR(50),
    EventName NVARCHAR(100),
    EventDate DATETIME
);

-- Wagers table
CREATE TABLE Wagers (
    WagerID INT PRIMARY KEY IDENTITY(1,1),
    PlayerID INT NOT NULL,
    EventID INT NOT NULL,
    Amount DECIMAL(10,2),
    Odds DECIMAL(5,2),
    Won BIT NULL,  -- NULL = pending, 1 = won, 0 = lost
    PlacedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);