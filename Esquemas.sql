--Questão 01. Crie as contas de usuário User_A, User_B, User_C, User_D e User_E.

CREATE USER User_A WITH PASSWORD = 'Pt3031861';
CREATE USER User_B WITH PASSWORD = 'Pt3031861';
CREATE USER User_C WITH PASSWORD = 'Pt3031861';
CREATE USER User_D WITH PASSWORD = 'Pt3031861';
CREATE USER User_E WITH PASSWORD = 'Pt3031861';

--Questão 02. Considere o esquema de banco de dados relacional university. O User_A poderá selecionar ou modificar qualquer relação, exceto CLASSROOM, e pode conceder qualquer um desses privilégios a outros usuários

GRANT SELECT, INSERT, UPDATE, DELETE ON 
  advisor, 
  course, 
  department, 
  instructor, 
  prereq, 
  student, 
  takes, 
  teaches, 
  time_slot, 
  departments_total_salary, 
  geology_fall_2009_Whitman, 
  geology_fall_2009_Whitman_2, 
  geology_fall_2009, 
  faculty
  TO User_A WITH GRANT OPTION;

--Questão 03. Liste as permissões do User_A.SELECT

SELECT
  dp.name AS grantee, 
  obj.name AS object_name, 
  perm.permission_name, 
  perm.state_desc 
  FROM sys.database_permissions AS perm
  JOIN sys.objects AS obj ON perm.major_id = obj.object_id 
  JOIN sys.database_principals AS dp ON perm.grantee_principal_id = dp.principal_id 
  WHERE dp.name = 'User_A'
  ORDER BY obj.name, perm.permission_name;
