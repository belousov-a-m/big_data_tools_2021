# big_data_tools_2021
ЛР1_Белоусов_Жиденко_РИМ-201211

Отчёт по лабораторной работе №1
по дисциплине «Методы и инструменты анализа больших данных»

Преподаватель:	С.Г. Мирвода
Студент: А.М. Белоусов
Студент: А.В. Жиденко
Группа: РИМ-201211

Екатеринбург 2021

Задание 1
1.	Воспользовавшись примерами из презентации (Лекция 5 - Основы хранилищ ключ-значение) установите redis
$ sudo apt-get update

![image](https://user-images.githubusercontent.com/84801418/144710915-53d8cf04-1ea8-4c33-9bf2-7a18f89a1e86.png)

$ sudo apt-get install redis-server

![image](https://user-images.githubusercontent.com/84801418/144710966-09cd1106-be11-410a-977f-e47587ae89e2.png)
 
$ redis-server

![image](https://user-images.githubusercontent.com/84801418/144710982-8f3894e6-81eb-44e1-9e73-9f51b19e5500.png)

$ service redis-server status
 
 ![image](https://user-images.githubusercontent.com/84801418/144710993-0e09d7ff-befe-4fa7-b16e-3731f1625230.png)

$ systemctl status redis

![image](https://user-images.githubusercontent.com/84801418/144710998-2e73e12b-cc1a-47c2-ab43-ec328aee23e0.png)
 
2.	Попробуйте все команды, которые приведены в презентации, для справки необходимо использовать документацию по командам https://redis.io/commands.
$ redis-cli
Подключение
 
 ![image](https://user-images.githubusercontent.com/84801418/144711003-1f2042e0-802b-4c94-8c58-8bcaa9fcdf35.png)

Конфигурация
 
 ![image](https://user-images.githubusercontent.com/84801418/144711010-eb7a2c2b-377b-44bc-a032-beee98d7860e.png)
![image](https://user-images.githubusercontent.com/84801418/144711014-0213529f-e93d-484e-8143-9b34a42df42c.png)
 
Простые типы данных
 
 ![image](https://user-images.githubusercontent.com/84801418/144711025-08360052-50f2-4a6c-99de-8e1c084ea189.png)
![image](https://user-images.githubusercontent.com/84801418/144711026-afae664b-f081-4297-80f7-8f41396e633e.png)
![image](https://user-images.githubusercontent.com/84801418/144711030-b83c598e-fe73-455f-936e-5f629255c23f.png)
![image](https://user-images.githubusercontent.com/84801418/144711032-d69e3553-f5f2-4b92-9a93-e18f7999f21a.png)
 
Устаревание
 
 ![image](https://user-images.githubusercontent.com/84801418/144711041-479bd63e-e6a6-4624-ad98-140fc5892d8e.png)

Хэши
 
 ![image](https://user-images.githubusercontent.com/84801418/144711049-8f1aab06-30f1-433b-8aa7-bfc8df3889fb.png)

Списки
 
 ![image](https://user-images.githubusercontent.com/84801418/144711051-ee9c89b5-4427-41c3-9ddb-edf12c9e4c85.png)

Множества и объединения
 
 ![image](https://user-images.githubusercontent.com/84801418/144711055-b7d90ec5-bc27-4930-8f15-6d724a94b8c0.png)

Упорядоченные множества
 
 ![image](https://user-images.githubusercontent.com/84801418/144711058-d708b687-4323-44a8-bc94-254392d7744d.png)

Задание 2
1.	После выполнения первого задания выполните скрипт
 
 ![image](https://user-images.githubusercontent.com/84801418/144711062-2c99cb8e-46f5-47a1-ae80-a8cdda9782d9.png)

Сохраните вывод этого скрипта в отельный файл, это будет результатом первого задания.
 
 ![image](https://user-images.githubusercontent.com/84801418/144711068-47dcb828-93f2-4cb9-91c2-e68b26c527bd.png)

Результат в файле belozhi.txt
 
 ![image](https://user-images.githubusercontent.com/84801418/144711074-fe5c2f27-7871-414f-9216-2b766b0be68d.png)

Как видно из текста, скрипт использует команды scan, type, lrange, hgetall, get для получения с помощью консольного клиента redis-cli списка ключей, получения типа ключа, и получения значения ключей в зависимости от типа (списки, хэши, простые ключи).
2.	Напишите скрипт для установки 1М простых ключей, 10М простых ключей замерьте скорость и потребление памяти
 
 ![image](https://user-images.githubusercontent.com/84801418/144711089-35c8501b-8841-46ae-8dc6-6bbd67cbf7b5.png)

Таблица 1 – Замеры времени и ОЗУ при записи ключей

![image](https://user-images.githubusercontent.com/84801418/144711144-115b4e3b-282d-427b-a09a-ec5fbe2d46ad.png)
 ![image](https://user-images.githubusercontent.com/84801418/144711154-e4e84094-9bee-442d-959c-04452e30f824.png)

Рисунок 1 – Загрузка ОЗУ при записи 10М ключей
3.	Напишите скрипт для установки 1М хэшей, 10М хэшей. Замерьте скорость и потребление памяти
 
 ![image](https://user-images.githubusercontent.com/84801418/144711172-0a341ed9-da26-4731-a6b8-15da6bbad22e.png)

Таблица 2 – Замеры времени и ОЗУ при записи хэшей

![image](https://user-images.githubusercontent.com/84801418/144711175-b8d69e83-3a51-4e97-8d2d-744c3065d924.png)
 ![image](https://user-images.githubusercontent.com/84801418/144711178-8748f015-77e0-421d-820e-47acf1910da2.png)

Рисунок 2 – Загрузка ОЗУ при записи 10М хэшей
4.	Сохраните на диск аватарку из любой социальной сети и, воспользовавшись результатами из предыдущих пунктов, рассчитайте сколько таких картинок может вместить ОЗУ вашего компьютера, модифицируйте скрипт и попробуйте записать в redis в виде простых ключей. Посмотрите результаты.
 
 ![image](https://user-images.githubusercontent.com/84801418/144711182-df0bf6c3-f3ff-4c60-a976-588dec79c596.png)

Рисунок 3 – Фото для загрузки в Redis
 
 ![image](https://user-images.githubusercontent.com/84801418/144711190-7f050500-4d49-420d-b585-b63df82d4e29.png)
![image](https://user-images.githubusercontent.com/84801418/144711214-bf464e8c-7ab3-4832-a531-a8d6cfcb0389.png)
![image](https://user-images.githubusercontent.com/84801418/144711217-28b8e5fb-2387-42bc-9d3b-ad1f8bdde7bf.png)
 
Рисунок 4 – Загрузка ОЗУ при записи 1М картинок
 
 ![image](https://user-images.githubusercontent.com/84801418/144711219-4197b783-8554-4f8f-a77e-ea7fcbc9dd2b.png)

Рисунок 5 – Ошибка при записи 1М картинок
