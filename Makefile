OUTPUT = Projektdokumentation.pdf

%.pdf: %.tex
	pdflatex -interaction=nonstopmode -halt-on-error *.tex
	biber *.bcf
	pdflatex -interaction=nonstopmode -halt-on-error *.tex
	pdflatex -interaction=nonstopmode -halt-on-error *.tex

build: $(OUTPUT)

open:
	xdg-open $(OUTPUT)

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.xml *.toc

.PHONY: open clean
