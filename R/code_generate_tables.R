library(kableExtra)
set.seed(4020)
table_dir <- "~/Documents/GitHub/public-opinion-AI-2021/tables/"

# The attributes
bread <- c("rye", "whole wheat", "rice flour")
filling <- c("peanut butter", "Impossible Meat", "roasted veggies")
side <- c("fries", "salad", "cake", "jelly")
price <- c("$5", "$7", "$10", "12")

# With 4 attributes
df_4 <- expand.grid(bread = bread, filling = filling, side = side, price = price)
dim(df_4)
df_4$ID <- paste0("A4_", 1:nrow(df_4))
write.csv(x = df_4,
          file = "~/Documents/GitHub/public-opinion-AI-2021/data/df_4.csv", row.names = FALSE)

# With 3 attributes
df_3 <- expand.grid(bread = bread, filling = filling, side = side)
dim(df_3)
df_3$ID <- paste0("A3_", 1:nrow(df_3))
write.csv(x = df_3,
          file = "~/Documents/GitHub/public-opinion-AI-2021/data/df_3.csv", row.names = FALSE)

# Function to export the 4 attribute tables
df4_export_func <- function(row_number) {
  # Get one row of the expanded grid
  x <- df_4[row_number,]
  # Make the output table
  output_table <- rbind(data.frame(Attribute = "Bread", Level = x$bread),
                        data.frame(Attribute = "Filling", Level = x$filling),
                        data.frame(Attribute = "Side", Level = x$side),
                        data.frame(Attribute = "Price", Level = x$price))
  # Randomize the order of the attributes
  attribute_order <- sample(x = 1:nrow(output_table), 
                            replace = FALSE, size = 4)
  output_table <- output_table[attribute_order,]
  file_name <- paste0("table_", x$ID)
  # Make the table and save it 
  kable(output_table, "html", row.names = FALSE, ) %>%
    kable_styling("striped") %>%
    save_kable(paste0(table_dir, file_name, ".html"))
  return(data.frame(ID = x$ID, attribute_order = paste(attribute_order, 
                                                       collapse = " | ")))
}

df_4_order <- do.call(rbind, lapply(1:nrow(df_4), df4_export_func))
# Save the ordering
write.csv(x = df_4_order,
          file = "~/Documents/GitHub/public-opinion-AI-2021/data/df_4_order.csv", row.names = FALSE)

# Function to export the 3 attribute tables
df3_export_func <- function(row_number) {
  # Get one row of the expanded grid
  x <- df_3[row_number,]
  # Make the output table
  output_table <- rbind(data.frame(Attribute = "Bread", Level = x$bread),
                        data.frame(Attribute = "Filling", Level = x$filling),
                        data.frame(Attribute = "Side", Level = x$side))
  # Randomize the order of the attributes
  attribute_order <- sample(x = 1:nrow(output_table), 
                            replace = FALSE, size = 3)
  output_table <- output_table[attribute_order,]
  file_name <- paste0("table_", x$ID)
  # Make the table and save it 
  kable(output_table, "html", row.names = FALSE, ) %>%
    kable_styling("striped") %>%
    save_kable(paste0(table_dir, file_name, ".html"))
  return(data.frame(ID = x$ID, attribute_order = paste(attribute_order, 
                                                       collapse = " | ")))
}

df_3_order <- do.call(rbind, lapply(1:nrow(df_3), df3_export_func))
# Save the ordering
write.csv(x = df_3_order,
          file = "~/Documents/GitHub/public-opinion-AI-2021/data/df_3_order.csv", row.names = FALSE)
