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


R is a programming language and free software environment for statistical computing: for data analysis, data manipulation and data visualization. Always a cornerstone in statistics, R has also become the "lingua franca" of quantitative political science in recent years. Moreover, it has become increasingly popular in industry. This course will introduce political scientists to R, with an emphasis on programming basics (as compared to statistical analysis) and reproducible workflows including version control with (Git)Hub. We will lay the foundations for conducting rigorous and reproducible quantitative research in R.

This page was created to provide participants with convenient access to all materials. 