/**********************************************************
*  Department ���̺� �ߺ� ������
***********************************************************/
INSERT INTO Department VALUES ('����','���к���',      '765-4000');
INSERT INTO Department VALUES ('�İ�','��ǻ�Ͱ��а�',  '765-4100');
INSERT INTO Department VALUES ('����','������Ű��а�','765-4200');
INSERT INTO Department VALUES ('�濵','�濵�а�',      '765-4400');
INSERT INTO Department VALUES ('����','���������а�',  '765-4500');

/**********************************************************
*  Student ���̺� �ߺ� ������
***********************************************************/
INSERT INTO Student  VALUES ('�İ�','3','C1601','�ѿ���','000708-3******','�λ�� ������',  '010-7999-0101', 'c1601@cyber.ac.kr', Null,'2016/02/26');
INSERT INTO Student  VALUES ('�İ�','3','C1602','�����','990205-2******','����� ��������','010-4333-0707', 'c1602@cyber.ac.kr', Null,'2016/02/26');
INSERT INTO Student  VALUES ('�İ�','2','C1701','������','011109-4******','�뱸�� ������',  Null,            'c1701@cyber.ac.kr', Null,'2017/03/02');
INSERT INTO Student  VALUES ('�İ�','2','C1702','���ֿ�','020917-3******','�泲 ���ؽ�',   '010-8555-1616',  'c1702@cyber.ac.kr', Null,'2017/03/02');
INSERT INTO Student  VALUES ('����','2','T1702','������','001117-3******','�泲 õ�Ƚ�',    Null,            't1702@cyber.ac.kr', Null,'2017/03/02');
INSERT INTO Student  VALUES ('�濵','2','B1701','���','961225-1******','������ ������',  Null,            'b1701@cyber.ac.kr', Null,'2017/03/02');
INSERT INTO Student  VALUES ('����','1','A1701','�̹̳�','001217-4******','���� �����',    '010-3888-5050',  Null,               Null,'2017/03/02');
INSERT INTO Student  VALUES ('�İ�','1','C1801','�����','020121-3******','����� ���ı�',  '010-3932-9999', 'c1801@cyber.ac.kr', Null,'2018/02/28');
INSERT INTO Student  VALUES ('�İ�','1','C1802','������','020521-4******','������ �����',  '010-6343-8838', 'c1802cyber.ac.kr',  'H', '2018/02/28');
INSERT INTO Student  VALUES ('����','1','T1801','�躴ȣ','991124-1******','�뱸�� �޼���',  '011-1222-0303',  Null,               Null,'2018/02/28');
INSERT INTO Student  VALUES ('�濵','1','B1801','�����','030422-4******','����� ����',  Null,             Null,               Null,'2018/02/28');

/**********************************************************
*  Professor ���̺� �ߺ� ������
***********************************************************/
INSERT INTO Professor VALUES ('P00', '���ѽ�', '����',   '����','765-4000','hsseo@cyber.ac.kr', '����',    NULL);
INSERT INTO Professor VALUES ('P11', '�ű��', '����',   '�İ�','765-4111','ksshin@cyber.ac.kr','�а���', 'P00');
INSERT INTO Professor VALUES ('P12', '�̴�ȣ', '�α���', '�İ�','765-4112','dhlee@cyber.ac.kr',  Null,    'P11');
INSERT INTO Professor VALUES ('P13', '���ҿ�', '������', '�İ�','765-4113','syyoo@cyber.ac.kr',  Null,    'P11');
INSERT INTO Professor VALUES ('P21', '������', '�α���', '����','765-4211','jspark@cyber.ac.kr','�а���', 'P00');
INSERT INTO Professor VALUES ('P22', '���ϴ�', '�α���', '����','765-4212','hnkim@cyber.ac.kr',  Null,    'P21');
INSERT INTO Professor VALUES ('P23', '�̻���', '������', '����','765-4213','shlee@cyber.ac.kr',  Null,    'P21');
INSERT INTO Professor VALUES ('P24', '�ְ���', '������', '����','765-4214','kjchoi@cyber.ac.kr', Null,    'P21');
INSERT INTO Professor VALUES ('P41', '�ȿ�ȫ', '�α���', '�濵','765-4411','yhahn@cyber.ac.kr', '�а���', 'P00');
INSERT INTO Professor VALUES ('P51', '�Կ���', '�α���', '����','765-4511','yaham@cyber.ac.kr', '�а���', 'P00');

/**********************************************************
*  Course ���̺� �ߺ� ������
***********************************************************/
INSERT INTO Course VALUES ('L0011','TOEIC����',     2, Null,Null);
INSERT INTO Course VALUES ('L0012','���а� ����',   2, Null,Null);
INSERT INTO Course VALUES ('L0013','���а���',      2, Null,Null);
INSERT INTO Course VALUES ('L1011','��ǻ�ͱ���',    2,'P11',Null);
INSERT INTO Course VALUES ('L1012','��������',      2, Null,20000);
INSERT INTO Course VALUES ('L1021','�����ͺ��̽�',  2,'P12',Null);
INSERT INTO Course VALUES ('L1022','������Ű���',  2,'P21',Null);
INSERT INTO Course VALUES ('L1031','SQL',           3,'P12',30000);
INSERT INTO Course VALUES ('L1032','�ڹ����α׷���',3,'P13',Null);
INSERT INTO Course VALUES ('L1041','��ǻ�ͳ�Ʈ��ũ',2,'P21',Null);
INSERT INTO Course VALUES ('L1042','Delphi',        3,'P13',50000);
INSERT INTO Course VALUES ('L1051','����������',    2,'P11',Null);
INSERT INTO Course VALUES ('L1052','���ڻ�ŷ�',    3,'P22',30000);
INSERT INTO Course VALUES ('L2031','�����̷�',      3,'P23',50000);
INSERT INTO Course VALUES ('L2061','�����������ӿ�ũ',3, Null,50000);

/**********************************************************
*  SG_Scores ���̺� �ߺ� ������
***********************************************************/
INSERT INTO SG_Scores VALUES ('C1601','L1011',  93, Null, '2016/12/27');
INSERT INTO SG_Scores VALUES ('C1601','L1021', 105, Null, '2016/12/27');
INSERT INTO SG_Scores VALUES ('C1601','L0011',  68, Null, '2016/12/27');
INSERT INTO SG_Scores VALUES ('C1601','L1031',  82, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1601','L1032',  78, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1601','L1041',  87, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1601','L1051',  87, Null, '2018/06/28');
INSERT INTO SG_Scores VALUES ('C1602','L0011',  98, Null, '2016/12/27');
INSERT INTO SG_Scores VALUES ('C1602','L1011',  87, Null, '2016/12/27');
INSERT INTO SG_Scores VALUES ('C1602','L1021',  98, Null, '2016/12/27');
INSERT INTO SG_Scores VALUES ('C1602','L1031',  94, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1602','L1041',  77, Null, '2018/06/28');
INSERT INTO SG_Scores VALUES ('C1602','L1051',  77, Null, '2018/06/28');
INSERT INTO SG_Scores VALUES ('C1701','L1011',  97, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1701','L1021',  96, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1701','L1031',  96, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1701','L1022',  97, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1701','L1042',  83, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1701','L1032',  93, Null, '2018/06/28');
INSERT INTO SG_Scores VALUES ('C1701','L1051',  89, Null, '2018/06/29'); 
INSERT INTO SG_Scores VALUES ('C1702','L1011',  89, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1702','L1021',  96, Null, '2017/06/29');
INSERT INTO SG_Scores VALUES ('C1702','L1031',  86, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1702','L1022',  87, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1702','L1042',  98, Null, '2017/12/23');
INSERT INTO SG_Scores VALUES ('C1702','L1032',  97, Null, '2018/06/28');
INSERT INTO SG_Scores VALUES ('C1702','L1051',  84, Null, '2018/06/29'); 
INSERT INTO SG_Scores VALUES ('C1801','L1031',  85, Null, '2018/06/27');
INSERT INTO SG_Scores VALUES ('C1802','L1031',  77, Null, '2018/06/27');
INSERT INTO SG_Scores VALUES ('C1701','L2061',Null, Null, '2018/08/26');
INSERT INTO SG_Scores VALUES ('C1702','L2061',Null, Null, '2018/08/26');
INSERT INTO SG_Scores VALUES ('C1601','L2061',Null, Null, '2018/08/26'); 
INSERT INTO SG_Scores VALUES ('C1602','L2061',Null, Null, '2018/08/26'); 

/**********************************************************
*  T_Course ���̺� �ߺ� ������
***********************************************************/
INSERT INTO T_Course VALUES ('L1031','SQL����',       3,'P12',50000);
INSERT INTO T_Course VALUES ('L1032','JAVA',          3,'P13',30000);
INSERT INTO T_Course VALUES ('L1043','JSP���α׷���', 3, NULL,50000);
INSERT INTO T_Course VALUES ('L2033','�������α׷���',3,'P24',40000);
INSERT INTO T_Course VALUES ('L4011','�濵�����ý���',3,'P41',30000);
INSERT INTO T_Course VALUES ('L4012','����������',    3,'P51',50000);

/**********************************************************
*  Course_Grade ���̺� �ߺ� ������
***********************************************************/
INSERT INTO SCORE_GRADE VALUES (95,100,'A+');
INSERT INTO SCORE_GRADE VALUES (90, 94,'A ');
INSERT INTO SCORE_GRADE VALUES (85, 89,'B+');
INSERT INTO SCORE_GRADE VALUES (80, 84,'B ');
INSERT INTO SCORE_GRADE VALUES (75, 79,'C+');
INSERT INTO SCORE_GRADE VALUES (70, 74,'C ');
INSERT INTO SCORE_GRADE VALUES (65, 69,'D+');
INSERT INTO SCORE_GRADE VALUES (60, 64,'D ');
INSERT INTO SCORE_GRADE VALUES ( 0, 59,'F ');

COMMIT;

/**********************************************************
*  �а�(Department) ���̺� �˻�
***********************************************************/
SELECT * FROM Department
/
