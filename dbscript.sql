DROP DATABASE IF EXISTS eLoan;

CREATE DATABASE eLoan;

USE eLoan;

CREATE TABLE user(
userName VARCHAR(20) PRIMARY KEY,
password VARCHAR(20) NOT NULL,
role VARCHAR(10) NOT NULL
);

INSERT INTO user VALUES
('admin','admin','Admin');

CREATE TABLE loan(
userName VARCHAR(20) NOT NULL,
loanAppNo int PRIMARY KEY AUTO_INCREMENT,
loanName VARCHAR(20) NOT NULL,
loanAmount VARCHAR(10) NOT NULL,
loanAppDate VARCHAR(20) NOT NULL,
businessStructure VARCHAR(20) NOT NULL,
billingIndicator VARCHAR(10) NOT NULL,
taxIndicator VARCHAR(10) NOT NULL,
address VARCHAR(30) NOT NULL,
mobile VARCHAR(10) NOT NULL,
email VARCHAR(30) NOT NULL,
status VARCHAR(10) NOT NULL,
FOREIGN KEY (userName) REFERENCES user(userName)
);

ALTER TABLE loan AUTO_INCREMENT=1000000; 

CREATE TABLE approvedloan(
loanAppNo int PRIMARY KEY,
sanctionedloanAmount decimal NOT NULL,
term decimal NOT NULL,
psd  VARCHAR(20) NOT NULL,
lcd VARCHAR(20) NOT NULL,
emi decimal NOT NULL,
status VARCHAR(10) NOT NULL,
FOREIGN KEY (loanAppNo) REFERENCES loan(loanAppNo)
);

commit;