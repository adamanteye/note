.DELETE_ON_ERROR:
.ONESHELL:

BUILD_DIR := build
ASSETS_DIR := assets

TEX_DIRS := $(shell find . -type f -name "main.tex" -exec dirname {} \; | sort)
TYP_DIRS := $(shell find . -type f -name "main.typ" -exec dirname {} \; | sort)

TEX_BUILDS := $(foreach dir,$(TEX_DIRS),$(BUILD_DIR)/$(patsubst ./%,%,$(dir)).pdf)
TEX_REFS := $(foreach dir,$(TEX_DIRS),$(BUILD_DIR)/$(patsubst ./%,%,$(dir)).ref)
TYP_BUILDS := $(foreach dir,$(TYP_DIRS),$(BUILD_DIR)/$(patsubst ./%,%,$(dir)).pdf)
TYP_REFS := $(foreach dir,$(TYP_DIRS),$(BUILD_DIR)/$(patsubst ./%,%,$(dir)).ref)

TYPST_DEPS := note-zh.typ note-en.typ common.typ theorem-en.typ theorem-zh.typ physics.typ slide-zh.typ

.DEFAULT_GOAL := site

.PHONY: all site tex typ font clean help remove print

all: site

site: $(BUILD_DIR)/index.html

font: $(BUILD_DIR)/maple.woff2

tex: $(TEX_BUILDS) $(TEX_REFS)

typ: $(TYP_BUILDS) $(TYP_REFS)

$(BUILD_DIR)/maple.woff2: site | $(BUILD_DIR)
	@echo "Generating optimized font..."
	@./union.sh "$(BUILD_DIR)"

$(BUILD_DIR)/%.ref: %/main.typ | $(BUILD_DIR)
	@mkdir -p $(@D)
	@git log -1 --format="%ci %H" -- $* > $@

$(BUILD_DIR)/%.ref: %/main.tex | $(BUILD_DIR)
	@mkdir -p $(@D)
	@git log -1 --format="%ci %H" -- $* > $@

$(BUILD_DIR)/%.pdf: %/main.typ $(TYPST_DEPS) | $(BUILD_DIR)
	@echo "Compiling Typst: $<"
	@mkdir -p $(@D)
	@typst compile --root . $< $@

$(BUILD_DIR)/%.pdf: %/main.tex | $(BUILD_DIR)
	@echo "Compiling LaTeX: $<"
	@mkdir -p $(@D)
	@latexmk -xelatex -cd $< > /dev/null 2>&1
	@cp $(<D)/main.pdf $@

$(BUILD_DIR)/index.html: $(TYP_BUILDS) $(TYP_REFS) $(BUILD_DIR)/assets/ generate.sh index-template.html | $(BUILD_DIR)
	@echo "Generating site index..."
	@cd $(BUILD_DIR) && ../generate.sh . ../index-template.html

$(BUILD_DIR)/assets/: $(ASSETS_DIR)/ | $(BUILD_DIR)
	@echo "Copying assets..."
	@rm -rf $@
	@mkdir -p $(@D)
	@cp -r $<* $@

$(BUILD_DIR):
	@mkdir -p $@

print:
	@echo "Typst PDFs:"
	@for pdf in $(TYP_BUILDS); do echo "  $$pdf"; done
	@echo "LaTeX PDFs:"
	@for pdf in $(TEX_BUILDS); do echo "  $$pdf"; done

remove:
	@echo "Cleaning up dangling files..."
	@# Remove orphaned ref files
	@find $(BUILD_DIR) -depth -type f -name "*.ref" -delete 2>/dev/null || true
	@# Remove orphaned PDF files
	@find $(BUILD_DIR) -type f -name "*.pdf" | while read -r pdf; do \
		if ! echo "$(TEX_BUILDS) $(TYP_BUILDS)" | grep -q "$$pdf"; then \
			echo "Removing orphaned: $$pdf"; \
			rm -f "$$pdf"; \
		fi; \
	done
	@# Remove empty directories
	@find $(BUILD_DIR) -depth -type d -empty -delete 2>/dev/null || true
	@# Remove temporary files
	@rm -f $(BUILD_DIR)/union.txt

clean:
	@echo "Cleaning LaTeX auxiliary files..."
	@for tex_dir in $(TEX_DIRS); do \
		if [ -f "$$tex_dir/main.tex" ]; then \
			latexmk -C -cd "$$tex_dir/main.tex" 2>/dev/null || true; \
		fi; \
	done

distclean: clean
	@echo "Removing entire build directory..."
	@rm -rf $(BUILD_DIR)

help:
	@echo "Available targets:"
	@echo "  all      : Build everything (same as 'site')"
	@echo "  site     : Build complete site with PDFs and index"
	@echo "  font     : Generate optimized font subset"
	@echo "  tex      : Build only LaTeX PDFs"
	@echo "  typ      : Build only Typst PDFs"
	@echo "  print    : List all PDFs that would be built"
	@echo "  remove   : Remove orphaned files and empty directories"
	@echo "  clean    : Remove LaTeX auxiliary files"
	@echo "  distclean: Remove entire build directory"
	@echo "  help     : Show this help message"
