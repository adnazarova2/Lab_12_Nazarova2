f <- function() {
  data_txt <- suppressWarnings(read.table("L3.txt", header = FALSE))
  data_console <- readline(prompt = "¬ведите текст: ")
  d <- data.frame(txt_file = data_txt, console_input = data_console)
  print(d)
}

f()
