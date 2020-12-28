# Урок 7. Обзор движков MySQL, управление и обслуживание.

-- 1. Создать нового пользователя и задать ему права доступа на базу данных «Страны и города мира».
    Создаем нового пользователя из консоли MySQL:
    CREATE USER 'newuser'@localhost' IDENTIFIED BY 'password';
    Предоставляем пользователю доступ к базе данных 'geodata' и всем ее таблицам '*':
    GRANT ALL PRIVILEGES ON geodata. * TO 'newuser'@localhost';
    Обновляем права доступа:
    FLUSH PRIVILEGES;
    
-- 2. Сделать резервную копию базы, удалить базу и пересоздать из бекапа.
# Создаем базу данных "test":
![1](https://user-images.githubusercontent.com/67762168/103217612-1124a380-492a-11eb-91ab-c3b11ee733fe.png)
![2](https://user-images.githubusercontent.com/67762168/103217615-12ee6700-492a-11eb-9ca0-32f638314f0b.png)
# которая содержит таблицу "tbl":
![3](https://user-images.githubusercontent.com/67762168/103217616-12ee6700-492a-11eb-91a1-243471722990.png)
# так же добавлены следующие строки "test" и "record":
![4](https://user-images.githubusercontent.com/67762168/103217617-1386fd80-492a-11eb-9eff-7583ba9c4d11.png)
# используя команду mysqldump создаем резервную копию БД:
![5](https://user-images.githubusercontent.com/67762168/103217619-141f9400-492a-11eb-9534-4e7a66c4aa0c.png)
# Удаляем базу данных "test":
![6](https://user-images.githubusercontent.com/67762168/103217622-14b82a80-492a-11eb-8118-c58d279e82ce.png)
![7](https://user-images.githubusercontent.com/67762168/103217624-14b82a80-492a-11eb-97c3-f115ddb10651.png)
# Для востановления БД из бекапа создаем снова БД:
    CREATE DATABASE test;
# И выполняем загрузку dump в созданную базу:
   mysql -u root -p test < test-dump.sql
