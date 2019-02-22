This is my current CV. It has a bit of an idiosyncratic style as far as the build goes.

`cv.Rmd` is where most of the tweaking happens. I have long used a LaTeX CV, and this actually
is one, but I wanted to be able to automatically pull some info from the internet so now I'm
generating the LaTeX document via R Markdown after I scrape my Google Scholar page and check 
CRAN logs.

`cv-simple.tex` is the pandoc template used by `cv.Rmd`. It, in turn, uses the `simplecv` class
defined by `simplecv.cls`, a version of Zach Scrivena's 
`simple-resume-cv`[https://github.com/zachscrivena/simple-resume-cv]. I have tweaked quite a bit
but you can see the basic structure, which I wanted for its section headings in the left margin.
There are a number of useful features in his version that I do not use or even removed in this
because I needed to make it workable as a pandoc template.

Because of some kind of bug in `rmarkdown`, the document won't compile just from `rmarkdown::render()`.
Instead, I use `Makefile` to just `make`, which generates the `cv.tex` file using `rmarkdown` and
then I call `latexmk -xelatex -f cv.tex` to compile `cv.tex` and handle the references via Biblatex.


