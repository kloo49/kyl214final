library(tidyverse)

site1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
site2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
site3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
site4 <- read_csv("data/RioMameyesPuenteRoto.csv")

# select()
site1_select <- site1 |> 
  select(c("Sample_ID", "Sample_Date", "K", "NO3-N", "Mg", "Ca", "NH4-N"))
site2_select <- site2 |> 
  select(c("Sample_ID", "Sample_Date", "K", "NO3-N", "Mg", "Ca", "NH4-N"))
site3_select <- site3 |> 
  select(c("Sample_ID", "Sample_Date", "K", "NO3-N", "Mg", "Ca", "NH4-N"))
site4_select <- site4 |> 
  select(c("Sample_ID", "Sample_Date", "K", "NO3-N", "Mg", "Ca", "NH4-N"))

tibble1 <- tibble("site" = NA)
view(tibble1)
tibble1 <- tibble("site" = NA, "window" = NA)
view(tibble1)
tibble1 <- tibble("site" = NA, "window" = NA, "mean_K" = NA)
view(tibble1)
tibble1 <- tibble("site" = NA, "window" = NA, "mean_K" = NA, "mean_Mg" = NA, "mean_Ca" = NA, "mean_no3-n" = NA, "mean_nh4-n" = NA)
tibble2 <- tibble("site" = NA, "window" = NA, "mean_K" = NA, "mean_Mg" = NA, "mean_Ca" = NA, "mean_no3-n" = NA, "mean_nh4-n" = NA)
view(tibble2)
tibble3 <- tibble("site" = NA, "window" = NA, "mean_K" = NA, "mean_Mg" = NA, "mean_Ca" = NA, "mean_no3-n" = NA, "mean_nh4-n" = NA)
tibble4 <- tibble("site" = NA, "window" = NA, "mean_K" = NA, "mean_Mg" = NA, "mean_Ca" = NA, "mean_no3-n" = NA, "mean_nh4-n" = NA)

glimpse(site1)
# Sample_ID, Sample_Date, K, Mg, Ca, `NO3-N`, `NH4-N`
glimpse(site1_select)
tibble1 <- tibble(site1_select$Sample_ID, "window" = NA, "mean_K" = NA, "mean_Mg" = NA, "mean_Ca" = NA, "mean_no3-n" = NA, "mean_nh4-n" = NA)
glimpse(tibble1)

big_frame <- bind_rows(site1, site2, site3, site4)
glimpse(big_frame)
big_frame_select <- big_frame |> 
  select(c("Sample_ID", "Sample_Date", "K", "NO3-N", "Mg", "Ca", "NH4-N"))
glimpse(big_frame_select)

big_frame_select_longer <- big_frame_select |> 
  pivot_longer(
    cols = "K":"NH4-N",
    names_to = "ions",
    values_to = "concentration"
  )
glimpse(big_frame_select_longer)

# plotting ion concentration over time
ggplot(
  data = big_frame_select_longer,
  mapping = aes(
    x = Sample_Date,
    y = concentration,
    color = Sample_ID
  )
) +
  geom_point() +
  labs(
    title = "ion conc over time (not moving avg)"
  ) +
  facet_wrap(
    ~ions,
    scales = "free",
    ncol = 1)

# units are not the same


# Moving average ---------------------------------------------------------

tibble_mov_avg <- tibble(Sample_ID, "window" = NA, "mean_K" = NA, "mean_Mg" = NA, "mean_Ca" = NA, "mean_no3-n" = NA, "mean_nh4-n" = NA)
min(big_frame_select_longer$Sample_Date)
# [1] "1986-05-20"
max(big_frame_select_longer$Sample_Date)
# [1] "2020-12-29"
max(big_frame_select_longer$Sample_Date) - min(big_frame_select_longer$Sample_Date)
# Time difference of 12642 days

window_start <- seq(ymd("1986-05-20"),ymd("2020-12-29"), by = "7 days")
window_end <- window_start + days(7)
tibble_mov_avg <- tibble(big_frame_select_longer$Sample_ID, window_start,window_end, "mean_K" = NA, "mean_Mg" = NA, "mean_Ca" = NA, "mean_no3-n" = NA, "mean_nh4-n" = NA)
tibble_mov_avg <- tibble("site" = NA, window_start,window_end, "mean_K" = NA, "mean_Mg" = NA, "mean_Ca" = NA, "mean_no3-n" = NA, "mean_nh4-n" = NA)
glimpse(tibble_mov_avg)
glimpse(big_frame_select)

for (i in 1:nrow(tibble_mov_avg)) {
  start_date <- window_start[i]
  end_date <- window_end[i]
  site <- mean(big_frame_select$Sample_ID[start_date <= big_frame_select$Sample_Date & end_date > big_frame_select$Sample_Date])
  tibble_mov_avg$site[i] <- site
  mean_k <- mean(big_frame_select$K[start_date <= big_frame_select$Sample_Date & end_date > big_frame_select$Sample_Date])
  tibble_mov_avg$mean_K[i] <- mean_k
  mean_ca <- mean(big_frame_select$Ca[start_date <= big_frame_select$Sample_Date & end_date > big_frame_select$Sample_Date])
  tibble_mov_avg$mean_Ca[i] <- mean_ca
  mean_mg <- mean(big_frame_select$Mg[start_date <= big_frame_select$Sample_Date & end_date > big_frame_select$Sample_Date])
  tibble_mov_avg$mean_Mg[i] <- mean_mg
  mean_nh4 <- mean(big_frame_select$`NH4-N`[start_date <= big_frame_select$Sample_Date & end_date > big_frame_select$Sample_Date])
  tibble_mov_avg$'mean_nh4-n'[i] <- mean_nh4
  mean_no3 <- mean(big_frame_select$`NO3-N`[start_date <= big_frame_select$Sample_Date & end_date > big_frame_select$Sample_Date])
  tibble_mov_avg$'mean_no3-n'[i] <- mean_no3
}
glimpse(tibble_mov_avg)

tibble_mov_avg_longer <- tibble_mov_avg |> 
  pivot_longer(
    cols = "mean_K":"mean_nh4-n",
    names_to = "mean_ions",
    values_to = "mean_conc"
  )

ggplot(
  data = tibble_mov_avg_longer,
  mapping = aes(
    x = window_start,
    y = mean_conc,
    color = mean_ions
  )
) +
  geom_line() +
  labs(
    title = "Moving average of ions",
    x = "Year",
    y = "Concentration"
  ) +
  facet_wrap(
    ~mean_ions,
    scales = "free",
    ncol = 1
  )
