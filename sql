#1 +Вибрати усіх клієнтів, чиє ім'я має менше ніж 6 символів.;
select * from client where length(FirstName) < 6;

#2 +Вибрати львівські відділення банку.+;
select * from department where DepartmentCity = 'lviv';

#3 +Вибрати клієнтів з вищою освітою та посортувати по прізвищу.
select * from client where Education = 'high' order by LastName;

#4 +Виконати сортування у зворотньому порядку над таблицею Заявка і вивести 5 останніх елементів.
select * from application order by idApplication DESC limit 5;

#5. +Вивести усіх клієнтів, чиє прізвище закінчується на OV чи OVA. (ov i ova - нема в таблиці^-^)
select * from client where LastName like '%k' or LastName like '%iv';

#6. +Вивести клієнтів банку, які обслуговуються київськими відділеннями.
select * from client where City like 'kyiv';

#7. +Вивести імена клієнтів та їхні номера телефону, погрупувавши їх за іменами.
select FirstName, Passport from client group by FirstName, Passport;

#8. +Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень.
select FirstName, LastName,Passport,City,Age, Sum,CreditState,Currency
from client
    join application a on client.idClient = a.Client_idClient
where Sum>5000;

#9. +Порахувати кількість клієнтів усіх відділень та лише львівських відділень.
select count(idClient),DepartmentCity
from client
join department d on d.idDepartment = client.Department_idDepartment
group by DepartmentCity;

#10. Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.
select Sum, FirstName
from application
join client c on c.idClient = application.Client_idClient
order by Sum;

#11. Визначити кількість заявок на кредит для кожного клієнта.
####################################


#12. Визначити найбільший та найменший кредити.
select min(Sum) as MIN, max(Sum) as  MAX
from application;

#13. Порахувати кількість кредитів для клієнтів,які мають вищу освіту.
# (я так зрозумів що це треба було порахувати неповернуті кредити)
select count(CreditState), CreditState
from application
join client c on c.idClient = application.Client_idClient
where CreditState like 'not%'
and Education like 'high';

#14. Вивести дані про клієнта, в якого середня сума кредитів найвища.
select FirstName, avg(Sum) as Sum
from application
join client c on c.idClient = application.Client_idClient
group by FirstName
order by Sum desc limit 1;

#15. Вивести відділення, яке видало в кредити найбільше грошей
select DepartmentCity, sum(Sum) as Sum
from application
join client c on c.idClient = application.Client_idClient
join department d on d.idDepartment = c.Department_idDepartment
group by DepartmentCity limit 1;

#16. Вивести відділення, яке видало найбільший кредит.
select DepartmentCity, max(Sum) as Sum
from application
join client c on c.idClient = application.Client_idClient
join department d on d.idDepartment = c.Department_idDepartment
group by DepartmentCity limit 1;

#17. Усім клієнтам, які мають вищу освіту, встановити усі їхні кредити у розмірі 6000 грн.
update application
join client c on c.idClient = application.Client_idClient
set Sum = 6000
where Education like 'high';

#18. Усіх клієнтів київських відділень пересилити до Києва.

#19. Видалити усі кредити, які є повернені.
delete
from application
where CreditState like 'ret%';

#20. Видалити кредити клієнтів, в яких друга літера прізвища є голосною.
select FirstName, LastName
from client
where REGEXP_LIKE(LastName, '\b[aeiou](\w*[aeiou])?\b')










