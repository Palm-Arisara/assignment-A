# assignment-A

Reproducible Coding Practices for Health Data Sciences — Part 1, **Option A**
(pre-specified dataset).

This project refactors the provided R notebook that models obesity levels from
the *Estimation of Obesity Levels Based On Eating Habits and Physical Condition*
dataset, applying the clean-coding and version-control practices from the course.

## Project structure

```
assignment-A/
├── part1a_r.Rmd          # analysis notebook (sources the R/ files)
├── README.md
├── .gitignore
├── renv.lock             # exact package versions (created with renv)
├── data/
│   └── ObesityDataSet_raw_and_data_sinthetic.csv
└── R/
    ├── data_preparation.R   # load + feature-engineering functions
    ├── modelling.R          # model training + error metric
    └── plotting.R           # plotting helper
```

## Requirements

* R (>= 4.1)
* R packages: `readr`, `randomForest`

The notebook installs any missing packages automatically on first run.

## Reproducing the environment (renv)

Exact package versions are pinned with
[`renv`](https://rstudio.github.io/renv/). To create the lockfile (do this once
in the project, then commit `renv.lock`):

```r
install.packages("renv")
renv::init()        # creates renv.lock from the packages you use
```

Anyone else can then restore the same versions with:

```r
renv::restore()
```

## How to run

1. Make sure the dataset is at `data/ObesityDataSet_raw_and_data_sinthetic.csv`.
2. Open `part1a_r.Rmd` in RStudio / VS Code and **Run All**.
   The notebook reads the local CSV — it downloads nothing.

## Dataset

* Source: UC Irvine ML Repository — <https://doi.org/10.24432/C5H31Z>
* Original authors: Mendoza Palechor & De la Hoz Manotas
* 2,111 rows (first 498 are real survey records; the rest are synthetic).

## Use of generative AI

Generative AI was used to assist with refactoring and documentation. All
changes were reviewed and verified by the author.

## Author

Arisara Choochern
