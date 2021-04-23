CREATE TABLE AUTHOR (
AU_ID        NUMERIC(7,0) PRIMARY KEY,
AU_FNAME     VARCHAR(30) NOT NULL  ,
AU_LNAME     VARCHAR(30) NOT NULL  ,
AU_BIRTHYEAR NUMERIC(4)
);

CREATE TABLE PATRON (
PAT_ID      NUMERIC(10,0) PRIMARY KEY,
PAT_FNAME   VARCHAR(20) NOT NULL   ,
PAT_LNAME   VARCHAR(20) NOT NULL   ,
PAT_TYPE    VARCHAR(10) NOT NULL
);

CREATE TABLE BOOK (
BOOK_NUM   NUMERIC(10,0) PRIMARY KEY,
BOOK_TITLE VARCHAR(120) NOT NULL  ,
BOOK_YEAR  NUMERIC(4)               ,
BOOK_COST  NUMERIC(8,2)             ,
BOOK_SUBJECT VARCHAR(120)         ,
PAT_ID    NUMERIC(10) REFERENCES PATRON
);

CREATE TABLE CHECKOUT (
CHECK_NUM         NUMERIC(15) PRIMARY KEY,
BOOK_NUM          NUMERIC(10) REFERENCES BOOK,
PAT_ID            NUMERIC(10) REFERENCES PATRON,
CHECK_OUT_DATE    DATE DEFAULT GETDATE(),
CHECK_DUE_DATE    DATE,
CHECK_IN_DATE     DATE
);

CREATE TABLE WRITES (
BOOK_NUM  NUMERIC(10) REFERENCES BOOK,
AU_ID     NUMERIC(7) REFERENCES AUTHOR,
CONSTRAINT WRITES_BOOK_AU_PK PRIMARY KEY (BOOK_NUM, AU_ID)
);

--AUTHOR rows
INSERT INTO AUTHOR VALUES (185, 'Benson', 'Reeves', 1990);
INSERT INTO AUTHOR VALUES (218, 'Rachel', 'Beatney', 1983);
INSERT INTO AUTHOR VALUES (229, 'Carmine', 'Salvadore', NULL);
INSERT INTO AUTHOR VALUES (251, 'Hugo', 'Bruer', 1972);
INSERT INTO AUTHOR VALUES (262, 'Xia', 'Chiang', NULL);
INSERT INTO AUTHOR VALUES (273, 'Reba', 'Durante', 1969);
INSERT INTO AUTHOR VALUES (284, 'Trina', 'Tankersly', 1961);
INSERT INTO AUTHOR VALUES (383, 'Neal', 'Walsh', 1980);
INSERT INTO AUTHOR VALUES (394, 'Robert', 'Lake', 1982);
INSERT INTO AUTHOR VALUES (438, 'Perry', 'Pearson', 1986);
INSERT INTO AUTHOR VALUES (460, 'Connie', 'Paulsen', 1983);
INSERT INTO AUTHOR VALUES (559, 'Rachel', 'McGill', NULL);
INSERT INTO AUTHOR VALUES (581, 'Manish', 'Aggerwal', 1984);
INSERT INTO AUTHOR VALUES (592, 'Lawrence', 'Sheel', 1976);
INSERT INTO AUTHOR VALUES (603, 'Julia', 'Palca', 1988);

--PATRON rows

INSERT INTO PATRON VALUES (1160, 'robert', 'carter', 'Faculty');
INSERT INTO PATRON VALUES (1161, 'Kelsey', 'Koch', 'Faculty');
INSERT INTO PATRON VALUES (1165, 'Cedric', 'Baldwin', 'Faculty');
INSERT INTO PATRON VALUES (1166, 'Vera', 'Alvarado', 'Student');
INSERT INTO PATRON VALUES (1167, 'Alan', 'Martin', 'FACULTY');
INSERT INTO PATRON VALUES (1170, 'Cory', 'Barry', 'faculty');
INSERT INTO PATRON VALUES (1171, 'Peggy', 'Marsh', 'STUDENT');
INSERT INTO PATRON VALUES (1172, 'Tony', 'Miles', 'STUDENT');
INSERT INTO PATRON VALUES (1174, 'Betsy', 'Malone', 'STUDENT');
INSERT INTO PATRON VALUES (1180, 'Nadine', 'Blair', 'STUDENT');
INSERT INTO PATRON VALUES (1181, 'Allen', 'Horne', 'Student');
INSERT INTO PATRON VALUES (1182, 'Jamal', 'Melendez', 'STUDENT');
INSERT INTO PATRON VALUES (1183, 'Helena', 'Hughes', 'Faculty');
INSERT INTO PATRON VALUES (1184, 'Jimmie', 'Love', 'StudenT');
INSERT INTO PATRON VALUES (1185, 'Sandra', 'Yang', 'student');
INSERT INTO PATRON VALUES (1200, 'Lorenzo', 'Torres', 'Student');
INSERT INTO PATRON VALUES (1201, 'Shelby', 'Noble', 'Student');
INSERT INTO PATRON VALUES (1202, 'Holly', 'Anthony', 'Student');
INSERT INTO PATRON VALUES (1203, 'Tyler', 'Pope', 'STUDENT');
INSERT INTO PATRON VALUES (1204, 'Thomas', 'Duran', 'Student');
INSERT INTO PATRON VALUES (1205, 'Claire', 'Gomez', 'student');
INSERT INTO PATRON VALUES (1207, 'Iva', 'Ramos', 'Student');
INSERT INTO PATRON VALUES (1208, 'Ollie', 'Cantrell', 'Student');
INSERT INTO PATRON VALUES (1209, 'Rena', 'Mathis', 'Student');
INSERT INTO PATRON VALUES (1210, 'Keith', 'Cooley', 'STUdent');
INSERT INTO PATRON VALUES (1211, 'Jerald', 'Gaines', 'Student');
INSERT INTO PATRON VALUES (1212, 'Iva', 'McClain', 'Student');
INSERT INTO PATRON VALUES (1213, 'Desiree', 'Rivas', 'Student');
INSERT INTO PATRON VALUES (1214, 'Marina', 'King', 'Student');
INSERT INTO PATRON VALUES (1215, 'Maureen', 'Downs', 'Student');
INSERT INTO PATRON VALUES (1218, 'Angel', 'Terrell', 'Student');
INSERT INTO PATRON VALUES (1219, 'Desiree', 'Harrington', 'Student');
INSERT INTO PATRON VALUES (1220, 'Carlton', 'Morton', 'Student');
INSERT INTO PATRON VALUES (1221, 'Gloria', 'Pitts', 'Student');
INSERT INTO PATRON VALUES (1222, 'Zach', 'Kelly', 'Student');
INSERT INTO PATRON VALUES (1223, 'Jose', 'Hays', 'Student');
INSERT INTO PATRON VALUES (1224, 'Jewel', 'England', 'Student');
INSERT INTO PATRON VALUES (1225, 'Wilfred', 'Fuller', 'Student');
INSERT INTO PATRON VALUES (1226, 'Jeff', 'Owens', 'Student');
INSERT INTO PATRON VALUES (1227, 'Alicia', 'Dickson', 'Student');
INSERT INTO PATRON VALUES (1228, 'Homer', 'Goodman', 'Student');
INSERT INTO PATRON VALUES (1229, 'Gerald', 'Burke', 'Student');
INSERT INTO PATRON VALUES (1237, 'Brandi', 'Larson', 'Student');
INSERT INTO PATRON VALUES (1238, 'Erika', 'Bowen', 'Student');
INSERT INTO PATRON VALUES (1239, 'Elton', 'Irwin', 'Student');
INSERT INTO PATRON VALUES (1240, 'Jan', 'Joyce', 'Student');
INSERT INTO PATRON VALUES (1241, 'Irene', 'West', 'Student');
INSERT INTO PATRON VALUES (1242, 'Mario', 'King', 'Student');
INSERT INTO PATRON VALUES (1243, 'Roberto', 'Kennedy', 'Student');
INSERT INTO PATRON VALUES (1244, 'Leon', 'Richmond', 'Student');

--BOOK rows

INSERT INTO BOOK VALUES (5235, 'Beginner''s Guide to JAVA', 2012, 59.95, 'Programming', NULL);
INSERT INTO BOOK VALUES (5236, 'Database in the Cloud', 2012, 79.95, 'Cloud', NULL);
INSERT INTO BOOK VALUES (5237, 'Mastering the database environment', 2013, 89.95, 'Database', NULL);
INSERT INTO BOOK VALUES (5238, 'Conceptual Programming', 2013, 59.95, 'Programming', 1229);
INSERT INTO BOOK VALUES (5239, 'J++ in Mobile Apps', 2013, 49.95, 'Programming', NULL);
INSERT INTO BOOK VALUES (5240, 'iOS Programming', 2013, 79.95, 'Programming', 1212);
INSERT INTO BOOK VALUES (5241, 'JAVA First Steps', 2013, 49.95, 'Programming', NULL);
INSERT INTO BOOK VALUES (5242, 'C# in Middleware Deployment', 2013, 59.95, 'Middleware', 1228);
INSERT INTO BOOK VALUES (5243, 'DATABASES in Theory', 2013, 129.95, 'Database', NULL);
INSERT INTO BOOK VALUES (5244, 'Cloud-based Mobile Applications', 2013, 69.95, 'Cloud', NULL);
INSERT INTO BOOK VALUES (5245, 'The Golden Road to Platform independence', 2014, 119.95, 'Middleware', NULL);
INSERT INTO BOOK VALUES (5246, 'Capture the Cloud', 2014, 69.95, 'Cloud', 1172);
INSERT INTO BOOK VALUES (5247, 'Shining Through the Cloud: Sun Programming', 2014, 109.95, 'Programming', NULL);
INSERT INTO BOOK VALUES (5248, 'What You Always Wanted to Know About Database, But Were Afraid to Ask', 2014, 49.95, 'Database', NULL);
INSERT INTO BOOK VALUES (5249, 'Starlight Applications', 2014, 69.95, 'Cloud', 1207);
INSERT INTO BOOK VALUES (5250, 'Reengineering the Middle Tier', 2014, 89.95, 'Middleware', NULL);
INSERT INTO BOOK VALUES (5251, 'Thoughts on Revitalizing Ruby', 2014, 59.95, 'Programming', NULL);
INSERT INTO BOOK VALUES (5252, 'Beyond the Database Veil', 2014, 69.95, 'Database', 1229);
INSERT INTO BOOK VALUES (5253, 'Virtual Programming for Virtual Environments', 2014, 79.95, 'Programming', NULL);
INSERT INTO BOOK VALUES (5254, 'Coding Style for Maintenance', 2015, 49.95, 'Programming', NULL);

--CHECKOUT rows

INSERT INTO CHECKOUT VALUES (91001, 5235, 1165, '03/31/2015', '04/14/2015', '04/09/2015');
INSERT INTO CHECKOUT VALUES (91002, 5238, 1209, '03/31/2015', '04/07/2015', '04/05/2015');
INSERT INTO CHECKOUT VALUES (91003, 5240, 1160, '03/31/2015', '04/14/2015', '04/09/2015');
INSERT INTO CHECKOUT VALUES (91004, 5237, 1160, '03/31/2015', '04/14/2015', '04/03/2015');
INSERT INTO CHECKOUT VALUES (91005, 5236, 1202, '03/31/2015', '04/07/2015', '04/08/2015');
INSERT INTO CHECKOUT VALUES (91006, 5235, 1203, '04/05/2015', '04/12/2015', '04/13/2015');
INSERT INTO CHECKOUT VALUES (91007, 5244, 1174, '04/05/2015', '04/12/2015', '04/08/2015');
INSERT INTO CHECKOUT VALUES (91008, 5248, 1181, '04/05/2015', '04/12/2015', '04/06/2015');
INSERT INTO CHECKOUT VALUES (91009, 5242, 1170, '04/05/2015', '04/19/2015', '04/09/2015');
INSERT INTO CHECKOUT VALUES (91010, 5235, 1161, '04/05/2015', '04/19/2015', '04/05/2015');
INSERT INTO CHECKOUT VALUES (91011, 5236, 1181, '04/05/2015', '04/12/2015', '04/11/2015');
INSERT INTO CHECKOUT VALUES (91012, 5249, 1181, '04/08/2015', '04/15/2015', '04/12/2015');
INSERT INTO CHECKOUT VALUES (91013, 5240, 1160, '04/10/2015', '04/24/2015', '04/19/2015');
INSERT INTO CHECKOUT VALUES (91014, 5236, 1204, '04/11/2015', '04/18/2015', '04/19/2015');
INSERT INTO CHECKOUT VALUES (91015, 5237, 1204, '04/11/2015', '04/18/2015', '04/13/2015');
INSERT INTO CHECKOUT VALUES (91016, 5236, 1183, '04/13/2015', '04/27/2015', '04/14/2015');
INSERT INTO CHECKOUT VALUES (91017, 5240, 1184, '04/14/2015', '04/21/2015', '04/22/2015');
INSERT INTO CHECKOUT VALUES (91018, 5236, 1170, '04/14/2015', '04/28/2015', '04/14/2015');
INSERT INTO CHECKOUT VALUES (91019, 5246, 1171, '04/14/2015', '04/21/2015', '04/17/2015');
INSERT INTO CHECKOUT VALUES (91020, 5254, 1185, '04/16/2015', '04/23/2015', '04/23/2015');
INSERT INTO CHECKOUT VALUES (91021, 5238, 1185, '04/16/2015', '04/23/2015', '04/21/2015');
INSERT INTO CHECKOUT VALUES (91022, 5252, 1171, '04/16/2015', '04/23/2015', '04/19/2015');
INSERT INTO CHECKOUT VALUES (91023, 5249, 1207, '04/16/2015', '04/23/2015', '04/19/2015');
INSERT INTO CHECKOUT VALUES (91024, 5235, 1209, '04/21/2015', '04/28/2015', '04/29/2015');
INSERT INTO CHECKOUT VALUES (91025, 5246, 1172, '04/21/2015', '04/28/2015', '04/27/2015');
INSERT INTO CHECKOUT VALUES (91026, 5254, 1161, '04/21/2015', '05/04/2015', '04/26/2015');
INSERT INTO CHECKOUT VALUES (91027, 5243, 1161, '04/21/2015', '05/04/2015', '04/26/2015');
INSERT INTO CHECKOUT VALUES (91028, 5236, 1183, '04/22/2015', '05/05/2015', '04/30/2015');
INSERT INTO CHECKOUT VALUES (91029, 5244, 1203, '04/22/2015', '04/29/2015', '04/26/2015');
INSERT INTO CHECKOUT VALUES (91030, 5242, 1207, '04/22/2015', '04/29/2015', '04/30/2015');
INSERT INTO CHECKOUT VALUES (91031, 5252, 1165, '04/23/2015', '05/06/2015', '04/30/2015');
INSERT INTO CHECKOUT VALUES (91032, 5238, 1172, '04/23/2015', '04/30/2015', '04/26/2015');
INSERT INTO CHECKOUT VALUES (91033, 5235, 1174, '04/23/2015', '04/30/2015', '04/23/2015');
INSERT INTO CHECKOUT VALUES (91034, 5240, 1185, '04/23/2015', '04/30/2015', '05/01/2015');
INSERT INTO CHECKOUT VALUES (91035, 5248, 1165, '04/24/2015', '05/07/2015', '04/25/2015');
INSERT INTO CHECKOUT VALUES (91036, 5237, 1202, '04/24/2015', '04/30/2015', '04/28/2015');
INSERT INTO CHECKOUT VALUES (91037, 5235, 1210, '04/28/2015', '05/04/2015', '05/01/2015');
INSERT INTO CHECKOUT VALUES (91038, 5238, 1215, '04/28/2015', '05/04/2015', '04/30/2015');
INSERT INTO CHECKOUT VALUES (91039, 5240, 1222, '04/28/2015', '05/04/2015', '05/06/2015');
INSERT INTO CHECKOUT VALUES (91040, 5237, 1228, '04/28/2015', '05/04/2015', '05/05/2015');
INSERT INTO CHECKOUT VALUES (91041, 5236, 1211, '04/28/2015', '05/04/2015', '04/30/2015');
INSERT INTO CHECKOUT VALUES (91042, 5235, 1220, '04/29/2015', '05/05/2015', '05/05/2015');
INSERT INTO CHECKOUT VALUES (91043, 5244, 1226, '04/29/2015', '05/05/2015', '05/07/2015');
INSERT INTO CHECKOUT VALUES (91044, 5248, 1219, '04/30/2015', '05/07/2015', '05/08/2015');
INSERT INTO CHECKOUT VALUES (91045, 5242, 1210, '04/30/2015', '05/07/2015', '05/04/2015');
INSERT INTO CHECKOUT VALUES (91046, 5235, 1225, '04/30/2015', '05/07/2015', '05/03/2015');
INSERT INTO CHECKOUT VALUES (91047, 5236, 1218, '04/30/2015', '05/07/2015', '05/07/2015');
INSERT INTO CHECKOUT VALUES (91048, 5249, 1229, '05/04/2015', '05/11/2015', '05/06/2015');
INSERT INTO CHECKOUT VALUES (91049, 5240, 1214, '05/04/2015', '05/11/2015', '05/04/2015');
INSERT INTO CHECKOUT VALUES (91050, 5236, 1220, '05/08/2015', '05/15/2015', '05/13/2015');
INSERT INTO CHECKOUT VALUES (91051, 5237, 1222, '05/08/2015', '05/15/2015', '05/15/2015');
INSERT INTO CHECKOUT VALUES (91052, 5236, 1213, '05/08/2015', '05/15/2015', '05/08/2015');
INSERT INTO CHECKOUT VALUES (91053, 5240, 1212, '05/09/2015', '05/16/2015', NULL);
INSERT INTO CHECKOUT VALUES (91054, 5236, 1221, '05/09/2015', '05/16/2015', '05/11/2015');
INSERT INTO CHECKOUT VALUES (91055, 5246, 1221, '05/09/2015', '05/16/2015', '05/10/2015');
INSERT INTO CHECKOUT VALUES (91056, 5254, 1224, '05/10/2015', '05/17/2015', '05/15/2015');
INSERT INTO CHECKOUT VALUES (91057, 5238, 1224, '05/10/2015', '05/17/2015', '05/11/2015');
INSERT INTO CHECKOUT VALUES (91058, 5252, 1171, '05/10/2015', '05/17/2015', '05/15/2015');
INSERT INTO CHECKOUT VALUES (91059, 5249, 1207, '05/10/2015', '05/17/2015', NULL);
INSERT INTO CHECKOUT VALUES (91060, 5235, 1209, '05/15/2015', '05/22/2015', '05/18/2015');
INSERT INTO CHECKOUT VALUES (91061, 5246, 1172, '05/15/2015', '05/22/2015', NULL);
INSERT INTO CHECKOUT VALUES (91062, 5254, 1223, '05/15/2015', '05/22/2015', '05/16/2015');
INSERT INTO CHECKOUT VALUES (91063, 5243, 1223, '05/15/2015', '05/22/2015', '05/20/2015');
INSERT INTO CHECKOUT VALUES (91064, 5236, 1183, '05/17/2015', '05/31/2015', '05/21/2015');
INSERT INTO CHECKOUT VALUES (91065, 5244, 1210, '05/17/2015', '05/24/2015', '05/17/2015');
INSERT INTO CHECKOUT VALUES (91066, 5242, 1228, '05/19/2015', '05/26/2015', NULL);
INSERT INTO CHECKOUT VALUES (91067, 5252, 1229, '05/24/2015', '05/31/2015', NULL);
INSERT INTO CHECKOUT VALUES (91068, 5238, 1229, '05/24/2015', '05/31/2015', NULL);


--WRITES rows

INSERT INTO WRITES VALUES (5235, 273);
INSERT INTO WRITES VALUES (5236, 383);
INSERT INTO WRITES VALUES (5237, 185);
INSERT INTO WRITES VALUES (5238, 603);
INSERT INTO WRITES VALUES (5239, 229);
INSERT INTO WRITES VALUES (5239, 460);
INSERT INTO WRITES VALUES (5239, 592);
INSERT INTO WRITES VALUES (5240, 218);
INSERT INTO WRITES VALUES (5241, 460);
INSERT INTO WRITES VALUES (5241, 559);
INSERT INTO WRITES VALUES (5242, 581);
INSERT INTO WRITES VALUES (5243, 251);
INSERT INTO WRITES VALUES (5244, 262);
INSERT INTO WRITES VALUES (5244, 284);
INSERT INTO WRITES VALUES (5245, 394);
INSERT INTO WRITES VALUES (5246, 251);
INSERT INTO WRITES VALUES (5247, 394);
INSERT INTO WRITES VALUES (5248, 229);
INSERT INTO WRITES VALUES (5249, 262);
INSERT INTO WRITES VALUES (5250, 383);
INSERT INTO WRITES VALUES (5250, 438);
INSERT INTO WRITES VALUES (5251, 460);
INSERT INTO WRITES VALUES (5252, 262);
INSERT INTO WRITES VALUES (5253, 185);
INSERT INTO WRITES VALUES (5254, 559);







