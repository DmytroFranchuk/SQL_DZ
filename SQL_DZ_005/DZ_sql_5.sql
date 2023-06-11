-- Создание таблиц
-- 1) Создать таблицу Students с полями:     id целое число первичный ключ автоинкремент  name строка 128 не null age целое число

-- 2) Создать таблицу Teachers с полями:     id целое число первичный ключ автоинкремент  name строка 128 не null age целое число

-- 3) Создать таблицу Competencies с полями: id целое число первичный ключ автоинкремент title строка 128 не null 

-- 4) Создать таблицу Teachers2Competencies с полями: id целое число первичный ключ автоинкремент teacher_id целое число competencies_id целое число

-- 5) Создать таблицу Courses id целое число первичный ключ автоинкремент teacher_id целое число title строка 128 не null headman_id целое число

-- 6) Создать таблицу Students2Courses id целое число первичный ключ автоинкремент student_id целое число course_id целое число
create database University;
use University; 
create table Students(
id integer primary key auto_increment,
name varchar(128) not null,
age integer); 

insert into Students(id, name, age) values
					(1, "Анатолий", 29),
                    (2, "Олег", 25),
                    (3, "Семен", 27),
                    (4, "Олеся", 28),
                    (5, "Ольга", 31),
                    (6, "Иван", 22);

create table Teachers(
id integer primary key auto_increment,
name varchar(128) not null,
age integer);

insert into Teachers(id, name, age) values 
					(1, "Петр", 39),
                    (2, "Максим", 35),
                    (3, "Антон", 37),
                    (4, "Всеволод", 38),
                    (5, "Егор", 41),
                    (6, "Светлана", 32);
                    
create table Competencies(
id integer primary key auto_increment,
 varchar(128) not null);
 
insert into Competencies(id, title) values 
					(1, "Математика"),
                    (2, "Информатика"),
                    (3, "Программирование"),
                    (4, "Графика");

create table Teachers2Competencies(
id integer primary key auto_increment,
teacher_id integer,
competencies_id integer);

insert into Teachers2Competencies(id, teacher_id, competencies_id) values 
					(1, 1, 1),
                    (2, 2, 1),
                    (3, 2, 3),
                    (4, 3, 2),
                    (5, 4, 1),
                    (6, 5, 3);

create table Courses(
id integer primary key auto_increment,
teacher_id integer,
title varchar(128) not null,
headman_id integer); 
insert into Courses(id, teacher_id, title, headman_id) values 
					(1, 1, "Алгебра логики", 2),
                    (2, 2, "Математическая статистика", 3),
                    (3, 4, "Высшая математика", 5),
                    (4, 5, "Javascript", 1),
                    (5, 5, "Базовый Python", 1);

create table Students2Courses(
id integer primary key auto_increment,
student_id integer,
course_id integer); 

insert into Students2Courses(id, student_id, course_id) values 
					(1, 1, 1),
                    (2, 2, 1),
                    (3, 3, 2),
                    (4, 3, 3),
                    (5, 4, 5);
                    
-- 1) Вывести имена студентов и курсы, которые они проходят
SELECT
st.name,
cor.title
FROM students st
INNER JOIN students2courses sc ON st.id = sc.student_id
INNER JOIN courses cor ON cor.id = sc.course_id;

SELECT
tch.name,
comp.title
FROM teachers tch
INNER JOIN teachers2competencies tc ON tch.id = teacher_id
INNER JOIN competencies comp ON comp.id = tc.competencies_id;

SELECT
tch.name
FROM teachers tch
LEFT JOIN teachers2competencies tc ON tch.id = teacher_id
LEft JOIN competencies comp ON comp.id = tc.competencies_id
WHERE competencies_id IS NULL;

SELECT
st.name
FROM students st
LEFT JOIN students2courses sc ON st.id = sc.student_id
LEFT JOIN courses cor ON cor.id = sc.course_id
WHERE course_id IS NULL;

SELECT
cor.title
FROM courses cor
LEFT JOIN students2courses stCor ON stCor.course_id = cor.id
LEFT JOIN students st ON st.id = stCor.student_id
WHERE student_id IS NULL;

SELECT
com.title
FROM competencies com
LEFT JOIN teachers2competencies tchCom ON tchCom.competencies_id = com.id
LEFT JOIN teachers tch ON tch.id = tchCom.teacher_id
WHERE teacher_id IS NULL;

SELECT DISTINCT
st.name,
cor.title
FROM courses cor
LEFT JOIN students2courses stCor ON stCor.course_id = cor.id
LEFT JOIN students st ON cor.headman_id = st.id;

SELECT
st.name,
st2.name
FROM students st

LEFT JOIN students2courses stCor ON stCor.student_id = st.id
LEFT JOIN courses cor ON cor.id = stCor.course_id
LEFT JOIN students st2 ON st2.id =  cor.headman_id;


 




