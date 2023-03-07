#!/bin/bash

mkdir task7
cd task7

size='stat -c %s test_Folder'

# Создание пустого каталога
echo "info: Создаем пустой каталог test_Folder:"
mkdir test_Folder
echo "size: $(${size})"

echo "info: Заполняем каталог test_Folder:"
cd test_Folder
for i in $(seq 1 50);
do
    file="file${i}.txt"
    touch $file
    echo "text for files" > $file
done
cd ..
echo "size: $(${size})"

echo "info: Удалим половину файлов в каталоге test_Folder:"
cd test_Folder
for i in $(seq 1 25);
do
    file="file${i}.txt"
    rm $file
done
cd ..
echo "size: $(${size})"

echo "info: Удалим оставшиеся файлы в каталоге test_Folder:"
rm -f test_Folder/*
echo "size: $(${size})"

cd ..
rm -rf task7
