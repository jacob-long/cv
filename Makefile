all:
	Rscript -e "rmarkdown::render('cv.rmd')"
	latexmk -xelatex -f cv.tex