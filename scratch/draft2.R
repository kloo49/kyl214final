library(tidyverse)

df <- read_csv("output/allsite_mvavg.csv")
df$ions <- factor(df$ions, levels=c("k_mgl","no3_ugl","mg_mgl","ca_mgl","nh4_ugl"))
df$site <- factor(df$site, levels=c("PRM","BQ1","BQ2","BQ3"))

# plot with all years of data --------------------------------------------

ggplot(
  data = df,
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
  theme_bw() +
  geom_vline(xintercept = ymd("1989-09-18"), linetype = "dashed")
ggsave("figs/fig3updated.png", width = 5, height = 6)

# second ggplot with the dates in the paper
ggplot(
  data = df,
  mapping = aes(
    x = window_start,
    y = concentration,
    color = site
  )
) +
  geom_line() +
  labs(
    title = "Moving Average of Ions in Stream Water in Bisley, PR",
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
  theme_minimal() +
  geom_vline(xintercept = ymd("1989-09-18"), linetype = "dashed") +
  xlim(ym("1988-01"), ym("1994-01"))

# final ggplot after peer review -----------------------------------------

ggplot(
  data = df,
  mapping = aes(
    x = window_start,
    y = concentration,
    linetype = site
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
    labeller = as_labeller(c(k_mgl="K mg/l",
                            ca_mgl="Ca mg/l",
                            mg_mgl="Mg mg/l",
                            nh4_ugl="NH4-N ug/l",
                            no3_ugl="NO3-N ug/l"))
  ) +
  theme_bw() +
  geom_vline(xintercept = ymd("1989-09-18"), linetype = "dashed") +
  scale_linetype_manual(values = c("PRM" = "solid", "BQ1" = "dotted", "BQ2" = "dashed", "BQ3" = "dotdash"))
ggsave("figs/fig3updated.png", width = 5, height = 6)
