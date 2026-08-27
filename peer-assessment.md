# Peer Assessment

## Automate
### The entire analysis is automated: Meets spec
1_clean_data.R successfull handles data reading and cleaning, delivering the intermediate csv file to output/.
The variable and dataframe names are concise and intuitative.
Comments provide helpful descriptions for each chunk.
Files in R/ are just for the moving-average function, and the R file only defines the function.  I like the inclusion of the glimpse() in addition to return() so that the new dataframe can be seen at the console.
All scripts run without errors--  beautiful graph!

### The analysis produces the expected output: Meets spec
The Quarto document sucessfully performs the data analysis and creates a figure.  I like the inclusion of both the reproduced figure and the figure with the updated time.  Beautiful work formatting the figure!

If you want to make it even more like the original, you could add the variation in line types (which also makes it accessible to people with colorblindness).  Adjusting the facet labels to read in mg/L instead of mg l^-1 will also make them a little more readable.  Check capitalization on the axis and legend titles.

## Organize
### Data are properly organized: Meets spec
Outputs and raw data are separated
### Code is properly organized: Meets spec
moving_average() is defined in R/ and used in 1_clean_data.R
Code is formatted clearly using Air with helpful comments throughout.
## Document
### The repo has an effective REAME: Meets spec
Informative title, concise summary of Schaefer et al. (2000), and clear purpos.  I love the inclusion of the original figure at the beginning and the reproduction at the end.

Description of what's in the repo is well-formated and makes the repo easy to navigate.

### Code follows a professional style: Meets spec
Code style is efficient and effectively utilizes Air to improve readability.  The number of comments is appropriate and helpfully explain why certain code is used.

All around great work!  I'm impressed that you got so much done so quickly!