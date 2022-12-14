CREATE TABLE Students(
    SID INTEGER,
    Name VARCHAR2(100),
    Major VARCHAR2(100),
    PRIMARY KEY(SID)
);

CREATE TABLE Projects(
    PID INTEGER,
    P_Name VARCHAR2(100) UNIQUE,
    PRIMARY KEY(PID)
);

CREATE TABLE Courses(
    CID INTEGER,
    C_Name VARCHAR2(100) UNIQUE,
    PRIMARY KEY(CID)
);

CREATE TABLE Members(
    PID INTEGER,
    SID INTEGER,
    PRIMARY KEY (PID, SID),
    FOREIGN KEY (PID) REFERENCES Projects(PID),
    FOREIGN KEY (SID) REFERENCES Students(SID)
);

CREATE TABLE Enrollments(
    CID INTEGER,
    SID INTEGER,
    PRIMARY KEY (CID, SID),
    FOREIGN KEY (CID) REFERENCES Courses(CID),
    FOREIGN KEY (SID) REFERENCES Students(SID)
);

CREATE SEQUENCE seq 
    START WITH 1
    INCREMENT BY 1; 

CREATE TRIGGER inc
    BEFORE INSERT ON Students 
    FOR EACH ROW 
    BEGIN 
        SELECT seq.NEXTVAL INTO :NEW.SID FROM DUAL;
    END;
/ 