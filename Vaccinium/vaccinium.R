
otu <- read.csv("otu_with_species.csv")
head(otu)
dim(otu)
View(otu)
colnames(otu)
vaccinium <- otu %>%
  filter(Species == "Vaccinium_myrtillus") %>%
  select(-Species_ID)
View(vaccinium)
dim(vaccinium)
vaccinium_t <- vaccinium %>%
  select(-Species) %>%
  t() %>%
  as.data.frame() %>%
  rownames_to_column("Sample") %>%
  rename(Abundance = V1)
View(vaccinium_t)
colnames(vaccinium_t)
meta_info <- readxl::read_excel("willowrock_sub_season_elev.xlsx")
View(meta_info)
meta_data_400 <- meta_info %>%
  filter(!originalID %in% c("RL_0646", "RL_1020_01", "RL_1729"))
library(dplyr)

combined_data_1 <- vaccinium_t %>%
  left_join(meta_data_400, by = c("Sample" = "originalID"))

View(combined_data_1)
library(dplyr)
library(dplyr)

lagopus_data <- combined_data_1 %>%
  filter(species == "Lagopus.lagopus", sex == "female")

View(lagopus_data)
library(dplyr)

lagopus_data <- lagopus_data %>%
  mutate(
    sampledate = as.Date(sampledate),
    Year = as.numeric(format(sampledate, "%Y")),
    JulianDay = as.numeric(format(sampledate, "%j"))
  )

library(dplyr)

lagopus_160 <- lagopus_data %>%
  filter(JulianDay <= 166)

ggplot(lagopus_data, aes(x = JulianDay, y = Abundance, color = factor(Year))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Linear Trend (Lagopus lagopus - Female, ≤ Day 160)",
    x = "Julian Day",
    y = "Abundance",
    color = "Year"
  ) +
  theme_minimal()


library(dplyr)

slopes <- lagopus_data%>%
  group_by(Year) %>%
  do(model = lm(Abundance ~ JulianDay, data = .)) %>%
  mutate(slope = coef(model)[2]) %>%
  select(Year, slope)

slopes




Model_v <- brms::brm(Abundance ~ Year + JulianDay + (1|plot), 
                     data = lagopus_data, 
                     family = negbinomial (), 
                     chains = 3,
                     backend = "cmdstanr", 
                     iter = 2000, warmup = 500, 
                     seed = 123)
summary(Model_v)
fixef(Model_v) ## detailed value of estimates 
coef(Model_v) ## group level effect
plot(Model_v) ## should be a fuzzy caterpillar pattern for good convergence 
pp_check(Model_v)

str(lagopus_data$JulianDay)
