---
layout: page
title: Syllabus
description: >-
    Course policies and information.
---

# Syllabus
{:.no_toc}

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Course Description

R is a programming language and free software environment for statistical computing: for data analysis, data manipulation and data visualization. Always a cornerstone in statistics, R has also become the "lingua franca" of quantitative political science in recent years. Moreover, it has become increasingly popular in industry. This course will introduce political scientists to R, with an emphasis on programming (as compared to statistical analysis) and reproducible workflows including version control with GitHub. Starting with "Base R", the course will also cover various recently popular packages for data manipulation and viszualization (e.g. from the tidyverse). The objective of this course is to lay the foundations for conducting rigorous and reproducible quantitative research in R.

A `.pdf` version of the syllabus can be found [here](https://raw.githubusercontent.com/m-freitag/Syllabus_R2021/main/Syllabus_Introduction-to-Programming-with-R.pdf).

## Learning Objectives

1.  Using the R-Studio IDE and version control with GitHub

2.  Data wrangling and visualization

3.  Writing functions (and clean code)

4.  Conducting reproducible research with Rmarkdown

## Prerequisite Knowledge

This course is intended for advanced B.A. students, M.A. students and junior faculty who want to work with R or switch to R from another programming language (e.g., Stata). No prior experience with R is required. However, basic knowledge of statistics is necessary to follow the (practical) examples of this course (BA students must have completed "Methoden der Politikwissenschaft II"). Proficiency in another programming language (e.g. Stata or Python) may decrease the learning curve.

## Preparation

In order to avoid a sluggish and organization-heavy start of the course, installation of all software components used in this course is to be completed in advance. Preparatory readings are not mandatory but may decrease the learning curve.

### Setting up R, R-Studio and Git(Hub)

If you've never used R, R-Studio or Git(Hub) before, start by installing each software component. I suggest you to do so in the following order:

1.  Install [R](https://www.r-project.org/).

2.  Install [R-Studio](https://www.rstudio.com/products/rstudio/download/#download).

3.  Create a [GitHub](https://github.com/) account. Take some care with the user-name if you want to keep this account throughout your career. You can't change it afterwards.

4.  Install [Git](https://git-scm.com/downloads).

    4.1 Open a shell. On windows, Git comes with its own shell. Open it by searching for "Git Bash". On Mac, just search for your "Terminal" application. Enter the following commands:

    ```
    git config --global user.name 'Your name'
    git config --global user.email 'Your E-mail linked to GitHub'

    ```

    4.2 (optional) Sometimes, using a GUI can be convenient for interacting with Git. [GitHub Desktop](https://desktop.github.com/) has gotten pretty decent recently. The GitHub Desktop installation wizard also helps you with configuring Git such that you can skip step 4.1.

If you already want to familiarize yourself with using Git(Hub) together with R-Studio, you can read into it in more depth [here](https://happygitwithr.com/) (however, we will also cover this in class).

A couple of days before the course you will receive an invitation to the course repo which you have to accept.

### Readings (optional)

#### Preparatory

Monogan III, James E. 2015. *Political Analysis Using R*. 1st ed. 2015. Cham: Springer International Publishing: Imprint: Springer.

Wickham, Hadley, and Garrett Grolemund. 2016. *R for data science: import, tidy, transform, visualize, and model data*. First edition. Sebastopol, CA: O'Reilly. Free online version available: <https://r4ds.had.co.nz/index.html>.

#### Further Reading

Urdinez, Francisco, and Andres Cruz. 2020. *R for Political Data Science: A Practical Guide*. 1st ed. Chapman and Hall/CRC.
