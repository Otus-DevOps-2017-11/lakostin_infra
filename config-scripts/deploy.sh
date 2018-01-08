#!/bin/bash

cd /home/appuser/
git clone https://github.com/Otus-DevOps-2017-11/reddit.git
##Переходим в директорию проекта и устанавливаем зависимости приложения
cd reddit && bundle install

##Запускаем сервер приложения в папке проекта
puma -d

