use Education;
--1
select*from subject;
--2
select*from institute;
--3
select stipendia from student;
--4
select distinct course from student;
--5
select* from student order by family;
select* from student order by name; 
select* from student order by last_name;
select* from student order by birthday;
--6
select distinct family,  course,  birthday from student ;
select distinct family,  course,  birthday from student order by course asc;
select distinct family,  course,  birthday from student order by birthday desc;
--7
select distinct lect_id, family, name, last_name from lecturer;
--8
select*from student where stipendia !=0 order by stipendia desc, last_name asc;
--9
select*from student where course =1  order by last_name desc;
--10
select*from student where course =2 or course =3;
--11
select*from student where course !=1 and not course =3;
--12
select distinct subj_name, subj_id, mark from exam, subject where mark=5;
--13
select distinct subj_name, hour, mark from subject, exam, knowledge, nagruzka where(subject.subj_id=knowledge.subj_id and knowledge.kvant_id = nagruzka.kvant_id and nagruzka.nagr_id=exam.nagr_id)and mark=2;
--14
select distinct name, last_name, subj_name, town_name, mark
from student,subject, parents,exam, knowledge,town, nagruzka
where town.town_name='Березовский'
and student.student_id=exam.student_id
and subject.subj_id=1 
and exam.nagr_id=nagruzka.nagr_id
and nagruzka.kvant_id=knowledge.kvant_id
and knowledge.subj_id=subject.subj_id
and mark>2 
and student.student_id=parents.student_id
and parents.town_id=town.town_id
--15
select name, last_name, subj_name, mark
from student,subject, parents,exam, knowledge, nagruzka, attest
where exam.nagr_id=nagruzka.nagr_id
and student.student_id=exam.student_id
and exam.nagr_id=nagruzka.nagr_id
and nagruzka.kvant_id=knowledge.kvant_id
and knowledge.subj_id=subject.subj_id
and student.student_id=parents.student_id
and mark!=2
and attest.attest_id=knowledge.attest_id
and attest.attest_id=1
order by subj_name asc, mark desc, last_name asc;
--16
select name, last_name, subj_name, mark
from student,subject, parents,exam, knowledge, nagruzka
where exam.nagr_id=nagruzka.nagr_id
and student.student_id=exam.student_id
and subject.subj_id=1 
and exam.nagr_id=nagruzka.nagr_id
and nagruzka.kvant_id=knowledge.kvant_id
and knowledge.subj_id=subject.subj_id
and student.student_id=parents.student_id
and mark=2
order by last_name asc
--17
select distinct name, last_name, name_medal,  inst_name, town_name 
from student
join medalist on student.student_id=medalist.student_id
join parents on student.student_id=parents.student_id
join town on parents.town_id=town.town_id
join medali on medalist.medal_id=medali.medal_id
join institute on student.inst_id=institute.inst_id
where medalist.medal_id=2;
--18
select distinct name, last_name, mark, exam_date, subj_name
from student 
join exam on student.student_id=exam.student_id
join nagruzka on nagruzka.nagr_id=exam.nagr_id
join knowledge on knowledge.kvant_id=nagruzka.kvant_id
join subject on knowledge.subj_id=subject.subj_id
where exam.mark=2 order by exam_date asc
--19
select distinct name, last_name, mark, exam_date, subj_name
from student 
join exam on exam.student_id=student.student_id
join nagruzka on exam.nagr_id=nagruzka.nagr_id
join knowledge on knowledge.kvant_id=nagruzka.kvant_id
join subject on subject.subj_id=knowledge.subj_id
where mark=2 
and (exam_date='2019.05.24' or exam_date='2019.06.13');
--20
select distinct student.name, student.family, mark, exam_date, subj_name, lecturer.family, lecturer.name
from student
join exam on exam.student_id=student.student_id
join nagruzka on exam.nagr_id=nagruzka.nagr_id
join knowledge on knowledge.kvant_id=nagruzka.kvant_id
join subject on subject.subj_id=knowledge.subj_id
join lecturer on nagruzka.lect_id=lecturer.lect_id
where mark=5 
--21
select distinct student.name, student.family, mark, exam_date, subj_name, lecturer.family, lecturer.name, institute.inst_name, knowledge.hour
from student
join exam on exam.student_id=student.student_id
join nagruzka on exam.nagr_id=nagruzka.nagr_id
join knowledge on knowledge.kvant_id=nagruzka.kvant_id
join subject on subject.subj_id=knowledge.subj_id
join lecturer on nagruzka.lect_id=lecturer.lect_id
join institute on institute.inst_id=lecturer.inst_id
where mark=2 and knowledge.hour>80