## Radical Prostatectomy Follow-Up Study
This data set contains 316 men who had undergone radical prostatectomy and 
received transfusion during or within 30 days of the surgical procedure and had 
available PSA follow-up data. The main exposure of interest was RBC storage duration group.
A number of demographic, baseline and prognostic factors were also collected. 
The outcome was time to biochemical cancer recurrence. The dataset is cleaned and complete. 
There are no outliers or data problems. These are data from a study by Cata et al. 
“Blood Storage Duration and Biochemical Recurrence of Cancer after Radical Prostatectomy”. 
Mayo Clin Proc 2011; 86(2): 120-127.

*To produce the html, render Final Report.html*

If changes to the data are needed, bring the data.rds object into the working environment 
using readRDS(), make and save your changes, and save the updated data as a .rds object 
using saveRDS(). 

*Notes on AI usage*
The only place I used AI was to help me understand an error message I kept getting when rendering 
the quarto html. 
tbl-one shows the demographics, baseline, and prognostic factors of the study participants. The mean age of participants was r gtsummary::inline_text(table_one, variable = "Age", column = "stat_0"). Most study participants had an extensive tumor volume r gtsummary::inline_text(table_one, variable = "Tumor Volume", column = "stat_0").
Error in eval(parse_only(code), envir = envir) : 
  object 'table_one' not found
Calls: .main ... hook_eval -> withVisible -> eval -> eval -> <Anonymous>

Thought for 5s

Thought for 5s
This error means table_one doesn't exist yet in your R environment at the point the inline code (`r ...`) is evaluated. In R Markdown/Quarto, inline code runs in the same environment as your chunks, in document order — so this is almost always one of:
1. Chunk ordering — the most common cause
The code chunk that creates table_one (e.g., with gtsummary::tbl_summary(...)) appears after this inline text in the document, not before it. Inline code can only see objects created in chunks that have already run above it.
2. The creating chunk has eval=FALSE or include=FALSE with an error
Check the chunk options on whatever chunk builds table_one:
r
{r table-one-setup}
table_one <- gtsummary::tbl_summary(...)
If that chunk has eval=FALSE, or if it silently errored earlier (sometimes suppressed by message=FALSE, warning=FALSE), table_one never gets created.
3. Variable name mismatch
Double check for typos — e.g. you created table1 or Table_one but are calling table_one, or it was created inside a different .Rmd/child document whose environment isn't shared.
4. Object created inside a function or local() block
If the tbl_summary() call happens inside a function, sapply, or local({}), the resulting object stays in that local scope and won't exist in the global/knit environment.
5. Caching (cache=TRUE)
If the creating chunk is cached and the cache is stale/invalidated separately from downstream chunks, you can get inconsistent object availability. Try clearing the cache (delete the *_cache folder) and re-knitting fully.
Quick fix checklist
Confirm the chunk defining table_one is above this paragraph in the .Rmd/.qmd file.
Add print(exists("table_one")) in a chunk right before this paragraph to confirm it's in scope.
Knit fresh (not "Run All" in the IDE then knit — those can have different environments). Use Knit directly, or rmarkdown::render() from a clean session.
If using Quarto, make sure you're not accidentally using #| eval: false on the chunk that builds the table.
If you paste the chunk that creates table_one, I can pinpoint the exact issue.
