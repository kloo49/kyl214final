library(tidyverse)

# read in moving average function
source("R/moving-average.R")

# read in raw data
bq1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
prm <- read_csv("data/RioMameyesPuenteRoto.csv")

# apply function to the raw data, also isolates the columns that we need
bq1_mvavg <- moving_average("BQ1", bq1)
bq2_mvavg <- moving_average("BQ2", bq2)
bq3_mvavg <- moving_average("BQ3", bq3)
prm_mvavg <- moving_average("PRM", prm)

# combine moving average from all 4 sites into one dataframe
big_frame <- bind_rows(bq1_mvavg, bq2_mvavg, bq3_mvavg, prm_mvavg)

# pivot longer for ions and concentration columns to make plotting easier
big_frame_longer <- big_frame |> 
  pivot_longer(
    cols = "k_mgl":"no3_ugl",
    names_to = "ions",
    values_to = "concentration"
  )

write_csv(big_frame_longer,"output/allsite_mvavg.csv")
