library(igraph)
library(statnet) 
install.packages("igraph")
install.packages("statnet")


create_graph <- function(num_companies, num_transactions) {
  adjacency_matrix <- matrix(sample(c(0, 1), num_companies^2, replace = TRUE), ncol = num_companies)
  
  # Установим диагональные элементы матрицы в 0, чтобы предприятия не отправляли платежи самим себе
  diag(adjacency_matrix) <- 0
  
  graph <- graph_from_adjacency_matrix(adjacency_matrix, mode = "directed")
  
  # Создадим случайные ребра между предприятиями
  edges <- sample(as_data_frame(graph), num_transactions, replace = TRUE)
  
  # Преобразуем ребра в edgelist
  edgelist <- as_edgelist(edges)
  
  return(edgelist)
}

create_graph_visualization <- function(edgelist) {
  graph <- graph_from_edgelist(edgelist, directed = TRUE)
  
  return(graph)
}


generate_random_graph_data <- function(num_nodes, num_edges) {
  nodes <- 1:num_nodes
  from_nodes <- sample(nodes, num_edges, replace = TRUE)
  to_nodes <- sample(nodes, num_edges, replace = TRUE)
  edgelist <- data.frame(from = from_nodes, to = to_nodes)
  return(edgelist)
}
# Вызов функции для создания edgelist с 10 узлами и 20 рёбрами
random_data <- generate_random_graph_data(10, 20)
#Создайте граф на основе данных из шага 1, используя библиотеку Statnet или igraph. В данном примере, мы будем использовать библиотеку igraph. Убедитесь, что вы установили пакет igraph с помощью install.packages("igraph"):

library(igraph)
create_graph <- function(edgelist) {
  graph <- graph_from_data_frame(edgelist, directed = TRUE)
  return(graph)
}
# Вызов функции для создания графа
payment_graph <- create_graph(random_data)
#Визуализируйте граф при помощи функции gplot, попробуйте несколько вариантов укладки графа, раскрасьте его и добавьте легенду. Вот пример кода:

plot_payment_graph <- function(graph) {
  layouts <- list(
    layout_with_fr,     # Форсированное укладывание
    layout_nicely,      # Укладка по умолчанию
    layout_randomly     # Случайная укладка
  )
  # Используем разные укладки и цвета
  colors <- c("red", "blue", "yellow")
  par(mfrow = c(1, 3))
  for (i in 1:3) {
    plot(graph, layout = layouts[[i]], vertex.color = colors[i], 
         vertex.label = NA, main = paste("Укладка", i))
  }
  legend("topright", legend = c("Узел 1", "Узел 2", "Узел 3"),
         col = colors, pch = 3)
}

# Функция для визуализации графа
plot_payment_graph(payment_graph)
#Сохраните матрицу смежности или edgelist в файл, используя функцию write. Также попробуйте сохранить диаграмму в виде изображения. Вот пример кода:

write.csv(random_data, "edgelist.csv", row.names = FALSE)

# Сохранение диаграммы
png("payment_graph.png", width = 1000, height = 1000, res = 100)
plot_payment_graph(payment_graph)
dev.off()