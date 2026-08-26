# The input to this function should be a data frame containing stream chemistry data
moving_average <- function(site_id, ion_data) {
  window_start <- seq(ymd("1986-05-20"),ymd("2020-12-29"), by = "9 weeks")
  window_end <- window_start + weeks(9)
  # Initialize a tibble to contain the results
  result <- tibble(
    window_start = window_start,
    window_end = window_end,
    site = site_id,
    k_mgl = NA,
    ca_mgl = NA,
    mg_mgl = NA,
    nh4_ugl = NA,
    no3_ugl = NA
  )

  # Fill in the iterator and sequence
  for (i in 1:nrow(result)) {
    # Create variables for the start and end of the current window
    w1 <- window_start[i]
    w2 <- window_end[i]
    in_window <- w1 <= ion_data$Sample_Date & w2 > ion_data$Sample_Date

    # Use indexing to pull out the ion concentrations that fall inside the window
    k_window <- ion_data$K[in_window]
    ca_window <- ion_data$Ca[in_window]
    mg_window <- ion_data$Mg[in_window]
    nh4_window <- ion_data$`NH4-N`[in_window]
    no3_window <- ion_data$`NO3-N`[in_window]

    # Calculate the mean of each ion concentration and fill in the result
    result$k_mgl[i] <- mean(k_window, na.rm = TRUE)
    result$ca_mgl[i] <- mean(ca_window, na.rm = TRUE)
    result$mg_mgl[i] <- mean(mg_window, na.rm = TRUE)
    result$nh4_ugl[i] <- mean(nh4_window, na.rm = TRUE)
    result$no3_ugl[i] <- mean(no3_window, na.rm = TRUE)
  }
  
  # Return the result
  glimpse(result)
  return(result)
}
