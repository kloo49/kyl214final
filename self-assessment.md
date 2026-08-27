# Specifications

## Automate
**The entire analysis is automated** (_meets spec_)  
- Data reading and cleaning is handled in a standalone script that creates intermediate output(s). (_meets spec_)  
- The analysis is performed in a Quarto document that reads intermediate outputs. (_meets spec_)  
- Files in the R/ folder exclusively define functions and have no other side effects. (_meets spec_)  
- All scripts run without errors. (_meets spec_)  
_All the file paths and folders are arranged in such a way that only the Quarto file needs to ran to see the results._

**The analysis produces the expected output**  (_not yet_)  
- The Quarto document performs the data analysis (moving average). (_meets spec_)
- The Quarto document creates a figure that is a reasonable approximation of the original. (_not yet_)  
_While I have all my code in Quarto, I still need to have the figure match Schaefer et al. Right now, I have a figure for the entire EDI dataset, but not the same time period from the paper._

## Organize  
**Data are properly organized** (_meets spec_)  
- Raw data is contained in its own folder. (_meets spec_). 
- Outputs are contained in a separate folder from raw data. (_meets spec_). 
_I have the folders clearly labeled and the appropriate files are in each corresponding folder._

**Code is properly organized** (_meets spec_)  
- At least one function is defined in a script in R/ and used elsewhere in the workflow. (_meets spec_)  
- All code in the repo (except in the scratch/ folder) is required for the analysis (i.e., no “safety blanket” code remaining) (_meets spec_)  
_I have one function (moving_average) defined, and I ensured that all code that is not in scratch is cleaned up._

## Document
**The repo has an effective README** (_meets spec_)  
- A short, but descriptive title (_meets spec_)   
- A brief explanation of the repository’s purpose (_meets spec_)  
- A concise description of what’s housed in the repository (_meets spec_)  
- Details regarding data access (_meets spec_)  
- A list of authors or current contributors (for collaborative work) (_meets spec_)  
- References (_meets spec_)  
_The README meets all the requirements, including visuals of Schaefer et al. Figure 3 and the final result. I also have the repo folder with a short description in the order that it appears._

**Code follows a professional style** (_not yet_)  
- All code files follow a consistent style (the Air formatter automates this). (_meets spec_)  
- The code has an appropriate amount of comments. (_not yet_)  
_Most of my code is pretty straightforward, so I would have to include some comments to break up the flow and have it be easier to follow, even if the comment is short._
