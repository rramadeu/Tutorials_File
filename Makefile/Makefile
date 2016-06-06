# Our second Makefile

REV_PDF=Review.pdf
PNG_FILES=$(wildcard Figures/*.png)
R_FILES=$(wildcard *.R)
JPEG_FILES=$(patsubst %.R, Figures/%.jpeg, $(R_FILES))

.PHONY : all
all : $(JPEG_FILES) $(REV_PDF) Tutorial_Make.html Tutorial_Make.tar.gz

Figures/%.jpeg : %.R mouse.csv
	Rscript $<

%.pdf : %.tex Figures/Flowchart.png
	xelatex $<
	-bibtex $*.aux
	xelatex $<
	xelatex $<
	rm *.aux *.bbl *.blg *.log

%.html: %.Rmd $(JPEG_FILES) $(PNG_FILES)
	R -e "rmarkdown::render('$<')"

%.tar.gz : $(JPEG_FILES) %.html $(REV_PDF)
	tar -czf $@ $^

.PHONY : clean
clean :
	rm *.pdf *.html *.gz
	cd Figures; rm -f $(JPEG_FILES)
