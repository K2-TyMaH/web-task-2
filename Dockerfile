# Docker-команда FROM указывает базовый образ контейнера
# Наш базовый образ - это Linux с предустановленным python-3.10
FROM python:3.10
# Установим переменную окружения
ENV APP_HOME /main
# Установим рабочую директорию внутри контейнера
WORKDIR $APP_HOME
# Скопируем остальные файлы в рабочую директорию контейнера
COPY . .
# Установим зависимости внутри контейнера
RUN pip install -r requirements.txt
RUN pip install -e .
# Обозначим порт где работает приложение внутри контейнера
#EXPOSE 5000 - у даному випадку порт непотрібен, так як це не веб додаток
# Запустим наше приложение внутри контейнера
ENTRYPOINT ["python", "main.py"]
#так ви мали на увазі має бути? воно ж і без цього працює (можливо я чогось не розумію, але в докер контейнері
# у мене не було можливості вводити щось, тільки взаємодія з консоллю
# а в консолі і без цього працює (треба лише ввести best_bot) я ж тестував 

# даний бот є консольним застосунком, тому щоб його запустити треба
# прописати best_bot у консолі (запуск через точку входу нічого не дає, лише у логах виводиться привітання)
# тому я прибрав точку входу взагалі
# best_bot запускає бота
