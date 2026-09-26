-- DBMS Assignment: Library Management System
-- Based on the submitted database design
-- 9 Tables: Authors, Publishers, Categories, Books, Members,
-- Staff, Loans, Reservations, Fines

CREATE DATABASE IF NOT EXISTS LibraryManagementSystem;
USE LibraryManagementSystem;

-- 1. Authors
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL,
    Nationality VARCHAR(50),
    BirthYear INT
);

-- 2. Publishers
CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL,
    Address VARCHAR(150),
    Phone VARCHAR(15)
);

-- 3. Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL,
    Description VARCHAR(200)
);

-- 4. Books
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    AuthorID INT,
    PublisherID INT,
    CategoryID INT,
    PublicationYear INT,
    TotalCopies INT NOT NULL,
    AvailableCopies INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- 5. Members
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(150),
    MembershipDate DATE NOT NULL,
    MembershipType VARCHAR(20)
);

-- 6. Staff
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    HireDate DATE
);

-- 7. Loans
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    StaffID INT,
    IssueDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 8. Reservations
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    ReservationDate DATE NOT NULL,
    Status VARCHAR(20),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- 9. Fines
CREATE TABLE Fines (
    FineID INT PRIMARY KEY,
    LoanID INT UNIQUE,
    Amount DECIMAL(6,2) NOT NULL,
    PaidStatus VARCHAR(10),
    PaidDate DATE,
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);

-- End of Library Management System Database
