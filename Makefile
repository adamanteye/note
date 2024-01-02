TEX_DIRS := $(shell find . -type f -name "main.tex" -exec dirname {} \;)

PDF_FILES := $(foreach dir,$(TEX_DIRS),build/$(patsubst ./%,%,$(dir)).pdf)

.PHONY: all clean help remove print

all: $(PDF_FILES) remove

build/%.pdf: %/main.tex
	@mkdir -p $(dir $@)
	latexmk -xelatex -cd $< > /dev/null 2>&1
	cp $(<D)/main.pdf $@

print:
	@for pdf in $(PDF_FILES); do \
		echo $$pdf; \
	done

remove:
	@find build -type f -name "*.pdf" | while read -r pdf; do \
		if ! echo "$(PDF_FILES)" | grep -q "$$pdf"; then \
			rm -f "$$pdf"; \
		fi \
	done
	-@find build/ -type d -empty -exec rmdir {} \;

clean: $(TEX_DIRS)
	@for tex in $(TEX_DIRS); do \
		latexmk -C -cd "$$tex/main.tex" 1>/dev/null; \
	done

help:
	@echo "Available targets:"
	@echo "  all    : Compile all PDFs that are out of date. This will check all source directories for .tex files and compile them into PDFs in the \"build/\" directory."
	@echo "  clean  : Remove all build files and auxiliary files generated by LaTeX. This will not remove the PDF files in the build directory."
	@echo "  help   : Show this help message, providing a brief description of all the makefile targets."
	@echo "  print  : Print all PDF files that will be built. This will not actually build the PDFs, but will show which ones would be built if the 'all' target were run."
	@echo "  remove : Remove all PDF files from the \"build/\" directory that no longer have a corresponding .tex file in the source tree as well as empty directories."
