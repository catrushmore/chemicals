%.html: %.md style.css Makefile
	    pandoc -c style.css --normalize --smart -f markdown -t html --bibliography=references.bibtex --standalone --include-in-header=style.css  -o build/$@ $<

%.odt: %.md Makefile
	    pandoc --standalone --normalize --smart --bibliography=references.bibtex -f markdown -t odt -o build/$@ $<

%.docx: %.md Makefile
			pandoc --standalone --normalize --smart -f markdown -t docx --bibliography=references.bibtex -o build/$@ $<

%.pdf: %.md %.odt
	    pandoc -c style.css --normalize --smart --standalone --bibliography=references.bibtex -f markdown -o build/$@ $<

all: thesis.html thesis.odt thesis.pdf thesis.docx
