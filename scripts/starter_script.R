# Load required libraries
library(tidyverse)
library(tidytext)
library(readr)  # For reading .txt files

# Sample text
text <- read_file("data/Ley48_text.txt")

# Convert to tibble and tokenize
df <- tibble(line = 1, text = text) %>%
  unnest_tokens(word, text)

# Count word frequencies
word_counts <- df %>%
  count(word, sort = TRUE)

# Plot top words
ggplot(word_counts, aes(x = reorder(word, n), y = n)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "Word Frequency", x = "Word", y = "Count")
