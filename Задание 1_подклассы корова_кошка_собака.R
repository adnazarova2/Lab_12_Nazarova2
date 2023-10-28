# Задание №1 - создать класс Домашнее животное с подклассами (кошка, собака, корова), у которых есть общие методы (наследуемые) и собственные.

# Определение класса "Домашнее животное"
Animal <- setRefClass("Animal",
                      fields = list(name = "character"),
                      methods = list(
                        initialize = function(name) {
                          self$name <- name
                        },
                        speak = function() {
                          stop("Метод speak() должен быть переопределен в подклассе")
                        }
                      )
)

# Определение подкласса "Кошка"
Cat <- setRefClass("Cat",
                   contains = "Animal",
                   methods = list(
                     speak = function() {
                       print(paste(self$name, "говорит: Мяу!"))
                     }
                   )
)

# Определение подкласса "Собака"
Dog <- setRefClass("Dog",
                   contains = "Animal",
                   methods = list(
                     speak = function() {
                       print(paste(self$name, "говорит: Гав! Гав!"))
                     }
                   )
)

# Определение подкласса "Корова"
Cow <- setRefClass("Cow",
                   contains = "Animal",
                   methods = list(
                     speak = function() {
                       print(paste(self$name, "говорит: Мууу!"))
                     }
                   )
)
# Использование классов и методов
cat <- Cat$new("Мурка")
cat$speak() # Выводит "Мурка говорит: Мяу!"

dog <- Dog$new("Шарик")
dog$speak() # Выводит "Шарик говорит: Гав! Гав!"

cow <- Cow$new("Буренка")
cow$speak() # Выводит "Буренка говорит: Мууу!"
