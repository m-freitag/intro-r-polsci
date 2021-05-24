---
layout: home
title: PolSciR
nav_exclude: true
seo:
  type: Course
  name: PolSciR
---

# {{ site.tagline }}
{: .mb-2 }
{{ site.description }}
{: .fs-6 .fw-300 }

{% assign instructors = site.staffers | where: 'role', 'Instructor' %}
{% for staffer in instructors %}
{{ staffer }}
{% endfor %}


R is a programming language and free software environment for statistical computing: for data analysis, data manipulation and data visualization. Always a cornerstone in statistics, R has also become the "lingua franca" of quantitative political science in recent years. Moreover, it has become increasingly popular in industry. This course will introduce political scientists to R, with an emphasis on programming (as compared to statistical analysis) and reproducible workflows including version control with GitHub. Starting with "Base R", the course will also cover various recently popular packages for data manipulation and viszualization (e.g. from the tidyverse). The objective of this course is to lay the foundations for conducting rigorous and reproducible quantitative research in R.