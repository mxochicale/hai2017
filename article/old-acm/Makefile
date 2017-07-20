fileinfo := Makefile to compile a tex document
author   := Miguel Perez-Xochicale
version  := alpha



# CHANGES:
#

# IMPORTANT:
#
#

FILENAME = proceedings
# LATEX 	 = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
LATEX 	 = pdflatex -synctex=1 -interaction=nonstopmode
#					pdflatex -synctex=1 -interaction=nonstopmode -output-directory=build master.tex
BIB = bibtex
GLOSSARIES = makeglossaries

### Build Chain
all:
	$(LATEX) $(FILENAME).tex          #compile
	$(BIB) $(FILENAME).aux  #bibliography
	#$(GLOSSARIES) $(FILENAME)  #glossaries
	$(LATEX) $(FILENAME).tex  #compile
	#$(GLOSSARIES) $(FILENAME) #glossaries
	$(LATEX) $(FILENAME).tex #compile
	$(LATEX) $(FILENAME).tex #compile
	rm -rf *.ps *.log *.dvi *.aux *.*% *.lof *.lop *.lot *.toc *.idx *.ilg *.ind *.bbl *.blg *.cpt *.out *.synctex.gz
	evince $(FILENAME).pdf & #viewpdf

	@echo "================================================"
	@echo " PDF file has been created! :) "
	@echo "================================================"

clean:
	rm -f *~
	rm -rf *.ps *.log *.dvi *.aux *.*% *.lof *.lop *.lot *.toc *.idx *.ilg *.ind *.bbl *.blg *.cpt *.out *.synctex.gz
	rm -rf *.backup
	rm -f `ls $(FILENAME).* | grep -v .tex | grep -v .pdf`
	@echo "================================================"
	@echo "All cleaned! :) "
	@echo "================================================"

####TESTING  ZONE
# TEXMFOUTPUT="build:" $(BIB) build/$(FILENAME).aux  #bibliography
