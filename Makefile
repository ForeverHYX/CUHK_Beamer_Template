MAIN = main
PDF  = $(MAIN).pdf

.PHONY: all clean distclean help

all: $(PDF)

$(PDF): $(MAIN).tex cuhk_beamer_pro.sty
	latexmk -xelatex -interaction=nonstopmode $(MAIN).tex
	latexmk -xelatex -interaction=nonstopmode $(MAIN).tex

clean:
	@echo "Cleaning up..."
	@rm -f $(MAIN).aux $(MAIN).log $(MAIN).out $(MAIN).toc $(MAIN).nav \
	       $(MAIN).snm $(MAIN).vrb $(MAIN).fls $(MAIN).fdb_latexmk $(MAIN).xdv
	@echo "Done."

distclean: clean
	@rm -f $(PDF)

help:
	@echo "Makefile help:"
	@echo "  make          build main.pdf (latexmk -xelatex, two passes)"
	@echo "  make clean    remove auxiliary files"
	@echo "  make distclean also remove the PDF"
