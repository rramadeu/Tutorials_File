Tips to teach R in workshops or practical classes for new R learners
================

I’ve being leading R classes for agricultural and genetic data analysis
since 2014. By troubleshooting students codes and watching their learning
process I created a set of personal rules on how to assemble an effective
R script and class for the students. Keep in mind, the scripts you use
for teaching are completely different from the scripts you use for your
own analysis. My students have some basic knowledge of R commands but
they are usually from a Biology oriented major. So, no formal
programming, stats, and logic courses in their background.

Key rules: avoid unnecessary codes/packages, use simple codes, use
simple comments, don’t show off.

## Before running…

## Use a plain R script

Rmarkdowns outputs (html, pdf, word) are pretty for self-learning, for a
companion material, for a blog post, for a tutorial etc. But they are
NOT good for teaching face-to-face. Using an html or pdf with R code requires
the students unnecessary work with searching the correct code and
copy/paste. It might sound easy for you that created the material, but
often will imply troubleshooting and problems for the student (and also
more of your time to prepare and format).

## Set your working directory with your students

Create a clean folder with the workshop name, put your script in there,
open your script in RStudio, clean your R environment, and set your
working directory in that folder. It is not complicated and it will
avoid problems with wrong working directory and old variables in the R
environments I saw several workshops with the instructors showing their
messy with hundreds of files in their working directory. Don’t do that.
You don’t need to be organized in your daily analysis but you need to
have a tidy environment for your teaching.

## Use RStudio

I don’t like it, it has weird bugs, it is clumsy in the
projector/screen, but it is the most used R interface and the one that
your students are familiar with. Don’t complicate their lives on this.

## Make sure they all have R and RStudio installed

If some students do not have them already installed it can take a huge
time of the course. They can face problems with an internet connection,
missing dependencies, or other unpredictable problems. The best thing
to do is to send before the class a tutorial of installation for every
kind of operating system and make yourself available for possible
questions.

If it is an online course, another possible solution is to use tools that
allow running R codes using only the browser, as the Google Colaboratory.
This one was first developed for Python language, but there is an adapted
notebook for R available. With this tool, you overcome the need for
installations, but you left behind some important concepts as the
working directory and the RStudio interface. Therefore, it would be
essential to at least mention these concepts and motivate the
students to use R and RStudio in daily life after the course.

## Make sure they can read the code

To increase the font size Tools -\> Global Options -\> Appearance If
necessary minimize the non-script tabs or change the layout.

## Creating your script

## Just use the really necessary packages, prefer to not use any package at all.

Just use packages that are strictly required to perform your analysis.
The use of every package implies having it installed and this can be
trouble. Keep in mind, your students have a variety of operating
systems with different R versions also they might not have super-user
privileges. Keep also in mind that usually the network in the class
environment is poor or the students might not have access to it.

## Don’t use ggplot2, dplyr, and other tidyverse packages

`ggplot2` and `dplyr` are key for fast analysis and elegant graphics.
But there is a learning curve for their use and often they are overused
in workshops. Keep in mind, first, you learned base R codes, and then you
learned tidyverse things, this is the same with your students. `ggplot2`
graphs require multiple lines and a proper syntax which is not easy to
follow. When you try to use it, the students will forget the `plus`
between its components, will skip lines, and the most important: they
will not be able to adapt for their own problems. Base R has a variety
of good and simple graphs, try to stay on them. Why use three weird
lines of code for a `ggplot2`’s scatterplot when you can do the same
thing with only one line in base R? `dplyr` overcomplicates simple
tasks, your students are not familiar with programming, the pipe `%>%`
logic can really scare them. Remember, it is not your task to teach them
how to use `tidyverse`, you are teaching another subject here.

## Don’t use attach()

Attach saves a lot of writing, but it messes up the R environment and
your students' lives (especially because they don’t clean the workspace).
Be explicit, instead of `plot(x,y)` do a `plot(data$x,data$y)`. Several
functions has the `data` argument, use them.

## Datasheets

If you are loading a datasheet, before load it, open in Excel and show
it to your students. Navigate in it, explain the variables. Prefer
standard `csv` formats. Then, load the sheet in R, check it with `str()`
function and double-check if you correctly loaded it with your students,
convert to factor what is necessary, and show `str()` again.

## Don’t use obscure/low-used packages

If you are using not-common packages, they are not often used by the
community and this implies a low bug report and low maintenance
ratio. For example, a package of mine (`AGHmatrix`) had a bug after the
R/4.0 update that resulted in a function crash. It was reported for me
only four months after the R update. On the other hand, highly used
packages as `ggplot2` have a big community behind them using, testing, and
fixing it. If you still need to use those packages, test and install
them in multiple OS and commonly used R versions.

## Don’t use function composition
Split it into multiple lines

## Go easy on the `apply` family and vectorial manipulation

Explain what your `apply` function is doing. R is supposed to be a vectorial language,
but your students probably don't know this, keep that in mind.

## Dealing with frustrations

In programming, we are used to warnings or error messages. For each code written
we can spend a lot of time fixing bugs, making adaptations, or improving them.
This practice is not very common in other study areas. Imagine that students
from the Biology area usually make their experiments in wet lab or fields, where
the materials their use are usually expensive and scarce. For them, an error
means a waste of money, space, and time. This can be a reason why they are
scared with a single error or warning message. It is important to explain that
errors/warnings are common and give them tools to solve them by themselves as
creating hypotheses and test them, or searching for help in manuals or google.

## Don’t show off

If you are teaching, probably you are already the best in the classroom,
don’t need to show off how good you are at R programming. For example,
in data manipulation don’t use complex logic in the subsetting, there is
no problem to use `subset` function, silly `for` loops, and naive
operations. If you don’t have an easy alternative to do in R but it is
really easy to do in Excel, do it there and reload your data.
Often, there will be a student thinking “Oh, that is so easy in Excel why he
is doing it here? This is silly”. However, it is better to clarify R advantages
using words than codes by making a short presentation at the begging of the
course showing R advantages. For example, amazing graphics built,
collaborative works with big data, and the huge amount of packages
available for specifics study areas. Then, you can motivate them to use
R without turning them more frustrated.
Never say that something is very easy to do. Understand that it can be easy
just for you because you already learned it. For the students, it can be very difficult.
It would not be very nice listening from someone how the thing you are
struggling to do is easy/unchallenging. Instead, show them the learning curve for programming,
and highlight the most common mistakes made for each new concept taught.
For example, it is very common that beginners forget to include the "c"
function to create vectors or include dots instead of commas to separate
functions arguments.

## Use simplified data and analysis

Your students have a common computer. The common undergrad student's computer 
has 4 to 8 GB or RAM, one google chrome open with 20 tabs, Skype or MS Teams running. 
RStudio per se can consude 500 MB, so this means that you have at most 1 GB to use 
in your R application. You don't want your student to have frozen computers and they 
rebooting during your class.

Another issue is the time of the analysis. Try to fit a model with large data in a common computer 
can take the whole class period. So, simplify your data and analysis, reduce its size, reduce the model complexity.
This brings back to the notion of internet speed in the classroom, one day in a workshop the instructor required the
students to download a data set of 2 GBs, the internet speed was terrible and some users even didn't have access. The solution was
a slow flash drive going in each computer. I got my data only at the end of the workshop it was a disaster.

If your data and analysis involved data with more than 1,000 lines and/or columns, you should do a benchmark of this analysis before
the class. If requires more than 1GB of RAM, you need to simplified it to avoid snorting audience. If you really need to use big data, 
give access to a cluster and make sure they do have access and know how to use it, but this can be real troublesome for certain classes.








