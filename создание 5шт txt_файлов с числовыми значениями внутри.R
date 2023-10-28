# Шаг 1: Создайте 5 текстовых файлов с числовыми значениями
for (i in 1:5) {
    data <- sample(1:100, 10)  # Генерируем случайные числа
    write.table(data, file = paste0("n", i, ".txt"), col.names = FALSE, row.names = FALSE)
}

# Шаг 2: Прочитайте каждый файл и сохраните его содержимое в переменных
for (i in 1:5) {
    assign(paste0("m", i), read.table(paste0("n", i, ".txt"), header = FALSE)[, 1])
}

# Шаг 3: Объедините 5 переменных в датафрейм и выведите его
data_frame <- data.frame(m1, m2, m3, m4, m5)
print(data_frame)
