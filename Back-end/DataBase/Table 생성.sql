CREATE DATABASE awsHealthcare;
USE awsHealthcare;

drop table Members;
drop table exerciseinfo;
drop table medicationssupplements;

-- 회원 정보 테이블
CREATE TABLE Members (
    MemberCode INT PRIMARY KEY,
    Id VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    Height FLOAT,
    Weight FLOAT,
    SmokingFrequency INT, -- 주간 평균 흡연횟수
    DrinkingFrequency INT, -- 주간 평균 음주횟수
    SleepStartTime TIME, -- 수면 시작 시간
    SleepEndTime TIME, -- 수면 종료 시간
    CONSTRAINT UC_Members_Name UNIQUE (Name) -- 회원 이름은 중복되지 않도록 유니크 제약조건 추가
);

-- 운동 정보 테이블
CREATE TABLE ExerciseInfo (
    ExerciseID INT PRIMARY KEY,
    MemberCode INT,
    ExerciseType VARCHAR(50),
    WeeklyFrequency INT, -- 주간 빈도
    CaloriesPerSession FLOAT, -- 회당 평균 소비 칼로리
    WeeklyGoalFrequency INT, -- 주간 목표 빈도
    FOREIGN KEY (MemberCode) REFERENCES Members(MemberCode) ON DELETE CASCADE -- 회원 정보와의 외래키 관계 설정
);

-- 의약품 및 보충제 정보 테이블
CREATE TABLE MedicationsSupplements (
    MedicationID INT PRIMARY KEY,
    MemberCode INT,
    MedicationType VARCHAR(100), -- 의약품 및 보충제 유형
    FOREIGN KEY (MemberCode) REFERENCES Members(MemberCode) ON DELETE CASCADE -- 회원 정보와의 외래키 관계 설정
);

SHOW TABLES;

-- Members 테이블의 구조 확인
DESCRIBE Members;
-- ExerciseInfo 테이블의 구조 확인
DESCRIBE ExerciseInfo;
-- MedicationsSupplements 테이블의 구조 확인
DESCRIBE MedicationsSupplements;

-- Members 테이블의 데이터 조회
SELECT * FROM Members;
-- ExerciseInfo 테이블의 데이터 조회
SELECT * FROM ExerciseInfo;
-- MedicationsSupplements 테이블의 데이터 조회
SELECT * FROM MedicationsSupplements;
