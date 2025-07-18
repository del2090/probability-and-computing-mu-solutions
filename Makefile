TEX_DIR := ./tex
PDF_DIR := ./pdf
TEX_FILES := $(wildcard $(TEX_DIR)/*.tex)
PDF_FILES := $(patsubst $(TEX_DIR)/%.tex,$(PDF_DIR)/%.pdf,$(TEX_FILES))

all: $(PDF_FILES)

$(PDF_DIR)/%.pdf: $(TEX_DIR)/%.tex | $(PDF_DIR)
	pdflatex -output-directory=$(PDF_DIR) $<

$(PDF_DIR):
	mkdir -p $(PDF_DIR)

clean:
	rm -f $(PDF_DIR)/*.aux \
	      $(PDF_DIR)/*.log \
	      $(PDF_DIR)/*.out \
	      $(PDF_DIR)/*.toc \
	      $(PDF_DIR)/*.synctex.gz \
	      $(PDF_DIR)/*.fls \
	      $(PDF_DIR)/*.fdb_latexmk