OUTPUT = Projektdokumentation.pdf

%.pdf: %.tex
	# Check that tex files don't contain trailing whitespace.
	(grep -r '[[:blank:]]$$' $< && echo "Found trailing whitespace") || exit 0 && exit 1
	pdflatex -interaction=nonstopmode -halt-on-error $<
	biber *.bcf
	pdflatex -interaction=nonstopmode -halt-on-error $<
	pdflatex -interaction=nonstopmode -halt-on-error $<

build: $(OUTPUT)

open:
	xdg-open $(OUTPUT)

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.xml *.toc

.PHONY: open clean
