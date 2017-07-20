FILENAME = checklistRazor
LATEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
BIB = bibtex




all:
	$(LATEX) $(FILENAME).tex
	$(LATEX) $(FILENAME).tex
#	$(BIB) $(FILENAME)
#	$(BIB) $(FILENAME)
	$(LATEX) $(FILENAME).tex
	$(LATEX) $(FILENAME).tex
	evince $(FILENAME).pdf &
	@echo "================================================"
	@echo "All done! pdf has been created"
	@echo "================================================"

clean:         
	rm -f *~
	rm -rf *.backup
	rm -f `ls $(FILENAME).* | grep -v .tex | grep -v .pdf`
	@echo "================================================"
	@echo "Cleaning complete!"
	@echo "================================================"
