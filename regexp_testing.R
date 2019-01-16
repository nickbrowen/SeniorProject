tidy_tweets2.1 <- tbl_tweets1 %>% 
  mutate(content = as.character(content)) %>% 
  filter(str_detect(content, "&amp;")) %>%
  unnest_tokens(word, content, token = "tweets") %>% 
  anti_join(stop_words) %>%
  filter(#str_detect(word, "^#[^a-z]+")|!str_detect(word, "[^a-z#@]"), 
         #if want to analyze emoji's later, change above line
         #!str_detect(word, "[:xdigit:]"),
         !word %in% str_remove_all(stop_words$word, "'")) %>% 
  select(-tco1_step1, -tco2_step1, -tco3_step1, -article_url, -post_type) %>%
  mutate(external_author_id = as.character(external_author_id), 
         author = as.character(author),
         region = as.character(region),
         language = as.character(language),
         account_type = as.character(account_type),
         account_category = as.character(account_category),
         publish_date = mdy_hm(publish_date),
         harvested_date = mdy_hm(harvested_date))


tidy_test <- tbl_test %>% 
  mutate(content = as.character(content)) %>% 
  filter(str_detect(content, "&amp;")) %>%
  unnest_tokens(word, content, token = "tweets") %>% 
  anti_join(stop_words) %>%
  filter(#str_detect(word, "^#[^a-z]+")|!str_detect(word, "[^a-z#@]"), 
    #if want to analyze emoji's later, change above line
    #!str_detect(word, "[:xdigit:]"),
    !word %in% str_remove_all(stop_words$word, "'")) %>% 
  select(-tco1_step1, -tco2_step1, -tco3_step1, -article_url, -post_type) %>%
  mutate(external_author_id = as.character(external_author_id), 
         author = as.character(author),
         region = as.character(region),
         language = as.character(language),
         account_type = as.character(account_type),
         account_category = as.character(account_category),
         publish_date = mdy_hm(publish_date),
         harvested_date = mdy_hm(harvested_date))

