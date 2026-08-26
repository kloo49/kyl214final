library(tidyverse)
library(lubridate)

source("R/moving-average.R")

bq1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
prm <- read_csv("data/RioMameyesPuenteRoto.csv")

bq1_mvavg <- moving_average("BQ1", bq1)
bq2_mvavg <- moving_average("BQ2", bq2)
bq3_mvavg <- moving_average("BQ3", bq3)
prm_mvavg <- moving_average("PRM", prm)

big_frame <- bind_rows(bq1_mvavg, bq2_mvavg, bq3_mvavg, prm_mvavg)
glimpse(big_frame)

big_frame_longer <- big_frame |> 
  pivot_longer(
    cols = "k_mgl":"no3_ugl",
    names_to = "ions",
    values_to = "concentration"
  )

ggplot(
  data = big_frame_longer,
  mapping = aes(
    x = window_start,
    y = concentration,
    color = site
  )
) +
  geom_line() +
  labs(
    title = "Moving average of ions in stream water",
    x = "Years"
  ) +
  facet_wrap(
    ~ions,
    scales = "free",
    ncol = 1,
    strip.position = "left",
    labeller = as_labeller(c(k_mgl="K mg l^-1",
                            ca_mgl="Ca mg l^-1",
                            mg_mgl="Mg mg l^-1",
                            nh4_ugl="NH4-N ug l^-1",
                            no3_ugl="NO3-N ug l^-1"))
  ) +
  theme_bw()
