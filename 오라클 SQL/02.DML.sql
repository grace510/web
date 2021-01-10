CREATE TABLE IF NOT EXISTS major_info(
  major_id	VARCHAR(5) PRIMARY KEY,
  major		VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS student(
  s_id		 VARCHAR(10),
  s_name	 VARCHAR(20) NOT NULL,
  s_age		 INT(3) UNSIGNED,
  major_id	 VARCHAR(5),
  gender	 CHAR(1)  CHECK(gender IN ('F', 'M')), 
  entry_date DATE NOT NULL,
  
  CONSTRAINT student_key PRIMARY KEY (s_id),
  CONSTRAINT student_fk FOREIGN KEY (major_id) REFERENCES major_info(major_id)
);



/**
* INSERT 
**/

INSERT INTO major_info VALUES ( '12071', '����Ʈ����');
INSERT INTO major_info(major_id, major) VALUES ('12072','��ǻ�Ͱ���');
INSERT INTO major_info VALUES ('12073', '������ǻ��');
COMMIT;
 SELECT * FROM major_info;

# S_ID,S_NAME,S_AGE,MAJOR_ID
INSERT INTO student VALUES('S001','�����',28,'12071', 'M','2020/07/01');
INSERT INTO student VALUES('S002','�����',27,'12071','M','2020/07/01');
INSERT INTO student VALUES('S003','�̸��',26,'12071','M','2020/07/01');
INSERT INTO student VALUES('S004','�ڽ���',27,'12071','M','2020/07/01');
INSERT INTO student VALUES('S005','�ں���',25,'12071','F','2020/07/01');

#INSERT INTO student VALUES('S006','ȫ�浿',25,'12074','M','2020/07/01');
#error : parent key not found
#�θ� ������ �߰� �� �ڽĿ� ������ �߰�

COMMIT;

#Multi INSERT
DROP TABLE emp;
CREATE TABLE emp AS SELECT * FROM employees WHERE 1=2;

INSERT INTO emp ( SELECT * FROM employees WHERE department_id=50);
SELECT * FROM emp;


/**
*UPDATE
**/
UPDATE student 
SET major_id='12073'
WHERE s_id='S005';

COMMIT;
#rollback, savepoint test�� ���� autocommit ���
SET autocommit=false;

#�θ� ���̺��� ������ ������ �ڽ� ���̺��� �����Ϳ� ������ ��ħ
UPDATE major_info
SET major='AI'
WHERE major_id=12071;

ROLLBACK;

#�ڽ��� ���� Ű ������ �θ����̺� �����ϴ� ���� ��� ����
/*UPDATE student 
SET major_id='12076'
WHERE s_id='S005';
#error : parents key not found
*/

UPDATE major_info
SET major_id='12074'
WHERE major_id='12072';

#�ڽ� ���̺��� �����ϰ� �ִ� ������ ������ ����
/*
UPDATE major_info
SET major_id='12075'
WHERE major_id='12071';
#error : child record found 
*/
ROLLBACK;

/**
*DELETE
*/
DELETE student
WHERE s_id='S006';

SELECT * FROM student;

# ������ ������ǻ���� �л� ��� ����
DELETE student
WHERE major_id=(SELECT major_id 
				 FROM major_info 
				 WHERE major='������ǻ��');

SELECT * FROM student;
ROLLBACK;

# SAVEPOINT TEST
INSERT INTO student VALUES('S006','ȫ�浿',25,'12071','M','2020/07/01');
UPDATE student SET major_id='12072' WHERE s_id='S006';

SAVEPOINT ss; #mark

DELETE FROM student WHERE  s_id='S006';

ROLLBACK TO ss; #mark �� ������ �۾����

COMMIT;#INSERT, UPDATE�� ����
