# Load required libraries
install.packages("tidyverse")  # Only run this once
library(tidyverse)

# Sample text (you can replace this with a legal clause)
text <- "Ambiguity in legal discourse often arises from modal verbs and vague phrasing."

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
