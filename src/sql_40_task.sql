postgres=# update peoples set address='Manas123' where id =10;
UPDATE 1 --1
postgres=# update peoples set occupation='Doctur',email='doctur@gmail.com' where id =10;
UPDATE 1 --2
postgres=# delete from peoples where id =9;
DELETE 1 --3
postgres=# select id from peoples;
id  2 3 4 5 6 7 8 11 12 13 14 15 16 17 18 19 ...
id ...   --4
postgres=# select *from peoples where nationality ='Uzbekistan';
 id | first_name | last_name | age | gender |      address      | phone_number |    email     |        occupation         | nationality |               education                | languages | ismarried | haschildren | height | weight
----+------------+-----------+-----+--------+-------------------+--------------+--------------+---------------------------+-------------+----------------------------------------+-----------+-----------+-------------+--------+--------
  7 | Ignacio    | Mutimer   |  22 | Male   | 61 Brown Crossing | 522-938-9035 | Food Chemist | Automation Specialist III | Uzbekistan  | Tashkent State University of Economics | Swati     | f         | t           |      6 |     34
         --5
postgres=# select * from peoples where age between 25 and 35 and occupation ='Chemical Engineer';
 id | first_name | last_name | age | gender |       address        | phone_number |       email       |    occupation     | nationality |        education        | languages | ismarried | haschildren | height | weight
----+------------+-----------+-----+--------+----------------------+--------------+-------------------+-------------------+-------------+-------------------------+-----------+-----------+-------------+--------+--------
 33 | Hayley     | Hawkshaw  |  32 | Female | 1029 Bayside Terrace | 440-527-5434 | Media Manager III | Chemical Engineer | Philippines | Leyte Normal University | Catalan   | t         | f           |     58 |     97
(1 ёЄЁюър) --6
postgres=# select *from peoples where ismarried=true and haschildren=true;
 id | first_name | last_name  | age |  gender  |        address        | phone_number |             email             |          occupation           | nationality |                               education                               |   languages    | ismarried | haschildren | height | weight
----+------------+------------+-----+----------+-----------------------+--------------+-------------------------------+-------------------------------+-------------+-----------------------------------------------------------------------+----------------+-----------+-------------+--------+--------
  3 | Jarred     | Cocks      |  82 | Male     | 4382 Chive Park       | 231-619-1851 | Research Associate            | Administrative Assistant I    | New Zealand | Christchurch Polytechnic Institute of Technology                      | Gagauz         | t         | t           |     28 |     23
 16 | Melessa    | McAlindon  |  30 | Female   | 796 Harbort Avenue    | 131-155-1982 | Community Outreach Specialist | Programmer I                  | Brazil      | Universidade de Santo Amaro                                           | Swedish        | t         | t           |     99 |     52
 26 | Lauryn     | Kuhwald    |  27 | Agender  | 9863 Glendale Circle  | 102-750-3216 | Human Resources Assistant III | Automation Specialist III     | China       | Yanbian University                                                    | Northern Sotho | t         | t           |     85 |     52
 28 | Duff       | Stirley    |  49 | Bigender | 25 Lillian Plaza      | 709-280-3731 | Professor                     | Structural Analysis Engineer  | China       | China University of Mining Technology - Xuzhou                        | Croatian       | t         | t           |     53 |      1
 30 | Levy       | Kellington |  54 | Male     | 8 6th Lane            | 231-203-3446 | Geologist III                 | Research Assistant II         | Russia      | St. Petersburg State University of Architecture and Civil Engineering | Bislama        | t         | t           |     45 |     35
 32 | Augustina  | Becks      |  61 | Female   | 72578 Cody Point      | 133-619-2983 | Food Chemist                  | VP Sales                      | Norway      | Norwegian University of Sport and Physical Education                  | West Frisian   | t         | t           |     54 |     82
 38 | Lorianna   | Duinbleton |  77 | Female   | 516 Pierstorff Avenue | 990-744-3836 | Internal Auditor              | Analog Circuit Design manager | Yemen       | Thamar University                                                     | Czech          | t         | t           |     24 |     70
(7 ёЄЁюъ) --7
postgres=# select *from peoples where gender ='female' and height>20;
 id | first_name | last_name | age | gender | address | phone_number | email | occupation | nationality | education | languages | ismarried | haschildren | height | weight
----+------------+-----------+-----+--------+---------+--------------+-------+------------+-------------+-----------+-----------+-----------+-------------+--------+--------
(0 ёЄЁюъ) --8
postgres=# select avg(age)from peoples;
         avg
---------------------
 53.9473684210526316
(1 ёЄЁюър   --9
ПОДСКАЗКА:  Возможно, предполагалась ссылка на столбец "peoples.occupation".
postgres=# select occupation,count(*)from peoples group by occupation  ;
              occupation              | count
--------------------------------------+-------
 Financial Advisor                    |     1
 Doctur                               |     1
 Human Resources Manager              |     1
 GIS Technical Architect              |     1
 Research Assistant II                |     1
 Operator                             |     2
 VP Sales                             |     1
 Environmental Tech                   |     2
 Account Executive                    |     2
 Structural Analysis Engineer         |     1
 Staff Scientist                      |     1
 Clinical Specialist                  |     1
 Database Administrator III           |     1
 Nurse                                |     1
 Administrative Assistant I           |     1
 Electrical Engineer                  |     1
 Research Nurse                       |     1
 Health Coach II                      |     1
 Tax Accountant                       |     1
 Office Assistant III                 |     1
 Compensation Analyst                 |     1
 Research Assistant III               |     1
 Media Manager I                      |     1
 Analog Circuit Design manager        |     1
 Chemical Engineer                    |     2
 Analyst Programmer                   |     1
 Librarian                            |     1
 Programmer I                         |     1
 Business Systems Development Analyst |     1
 IT                                   |     1
 Automation Specialist III            |     2
 Safety Technician III                |     1
 VP Quality Control                   |     1
(33 ёЄЁюъш)  --10
postgres=# select first_name,last_name from peoples order by age desc limit 1;
 first_name | last_name
------------+-----------
 Lazaro     | Dibner
(1 ёЄЁюър  )  --11
postgres=# select from peoples email='%gmail.com';
ОШИБКА:  ошибка синтаксиса (примерное положение: "=")
СТРОКА 1: select from peoples email='%gmail.com';
                                   ^
postgres=# select * from peoples where email like'%gmail.com';
 id | first_name | last_name | age | gender |      address      | phone_number |        email         | occupation | nationality |         education          | languages  | ismarried | haschildren | height | weight
----+------------+-----------+-----+--------+-------------------+--------------+----------------------+------------+-------------+----------------------------+------------+-----------+-------------+--------+--------
  4 | Lazaro     | Dibner    |  99 | Male   | Grajdanskaya 129  | 706-372-2698 | peaksoftkg@gmail.com | IT         | Albania     | Epoka University           | Gagauz     | f         | f           |     88 |     48
 10 | Liz        | Silveston |  97 | Female | Manas123          | 955-211-8167 | doctur@gmail.com     | Doctur     | China       | Shanghai Normal University | Portuguese | t         | f           |     35 |     22
(2 ёЄЁюъш)--12
          ^
postgres=# select first_name,height from peoples order by height desc;
 first_name | height
------------+--------
 Kessia     |     99
 Melessa    |     99
 Alanson    |     98
 Jena       |     95
 Jeane      |     89
 Lazaro     |     88
 Mame       |     86
 Xever      |     85
 Lauryn     |     85
 Freddie    |     84
 Germayne   |     84
 Drake      |     84
 Harrison   |     79
 Glen       |     78
 Franchot   |     77
 Siffre     |     73
 Udall      |     71
 Hayley     |     58
 Gayler     |     58
 Augustina  |     54
 Duff       |     53
 Balduin    |     50
 Charissa   |     48
 Bary       |     45
 Levy       |     45
 Giana      |     45
 Torey      |     42
 Benton     |     41
 Liz        |     35
 Aleksandr  |     32
 Renell     |     30
 Land       |     29
 Jarred     |     28
 Lorianna   |     24
 Gerald     |     22
 Dionis     |     13
 Ignacio    |      6
 Mickey     |      2
(38 ёЄЁюъ)


