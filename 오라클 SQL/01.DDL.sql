/**
* Table ����
*/
#���� ���̺�� ���̺� �����ϱ�
CREATE TABLE emp 
AS( SELECT employee_id, first_name, hire_date, salary, job_id, department_id
    FROM employees
);

#�÷���� ������ Ȯ��
show columns from emp;
SELECT * FROM emp;

#������� Ȯ�� - ��������� ���� ����
SELECT * FROM Information_schema.table_constraints WHERE TABLE_NAME='emp';
 
#������� �߰�
ALTER TABLE emp ADD CONSTRAINT emp_pk PRIMARY KEY (employee_id);


#���̺� ����
CREATE TABLE student(
  s_id		VARCHAR(10)  PRIMARY KEY,
  s_name	VARCHAR(20) NOT NULL,
  s_age		INT(3) UNSIGNED,
  major		VARCHAR(30) NOT NULL,
  gender	CHAR(1) CHECK(gender IN ('F','M')),
  entry_date	DATE NOT NULL
);


CREATE TABLE major_info(
  major_id	INT(5) PRIMARY KEY,
  major		VARCHAR(30) NOT NULL
);


show columns from student;         #desc hr.student  #desc student
show columns from major_info;

#������� Ȯ��
SELECT * FROM Information_schema.table_constraints WHERE TABLE_NAME='student'

/**
* Table ����
//COLUMN �߰�
ALTER TABLE [���̺� ��] ADD COLUMN [�÷��� Ÿ�� ��������];

//COLUMN ����
ALTER TABLE [���̺� ��] MODIFY COLUMN [�÷��� Ÿ�� ��������];

//COLUMN �̸����� ����
ALTER TABLE [���̺��] CHANGE COLUMN [�÷��� �����÷��� Ÿ�� ��������]; 

//COLUMN ����
ALTER TABLE [���̺��] DROP COLUMN [�÷���]

// �������� ����
ALTER TABLE [���̺� ��] DROP CONSTRAINT [�������� �̸�];
ALTER TABLE [���̺� ��] DROP FOREIGN KEY [�������� �̸�];

// �������� �߰�
�ܷ�Ű : ALTER TABLE [���̺� ��] ADD CONSTRAINT [�������� �̸�] FOREIGN KEY(�÷� ��)
 REFERENCES [�θ����̺� ��](PK �÷� ��) [ON DELETE CASCADE / ON UPDATE CASCADE];

�⺻Ű : ALTER TABLE [���̺� ��] ADD CONSTRAINT [�������� �̸�] PRIMARY KEY(�÷� ��);

// NOT NULL ���� ���� �߰�
ALTER TABLE [���̺� ��] MODIFY [�÷� ��] [������ Ÿ��] CONSTRAINT [�������� �̸�] NOT NULL;
**/

#Column�̸� ����
ALTER TABLE student CHANGE COLUMN major major_id VARCHAR(30) NOT NULL;

#Column Type ����
ALTER TABLE student MODIFY COLUMN major_id INT(5);

#������� �߰�
ALTER TABLE student ADD CONSTRAINT student_fk_majorId
FOREIGN KEY(major_id) REFERENCES major_info(major_id) ON DELETE CASCADE;

#Ȯ��
SELECT * FROM Information_schema.table_constraints WHERE TABLE_NAME='student'

/**
*Table ����
*/
DROP TABLE student,major_info;







