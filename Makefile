# Report Makefile
# Builds the latex report contained in the directory. 
#
# Author: J. L. Hay


include ./make/common.mk


REPORT_NAME = report
TIKZ_FIGURES = $(addsuffix .pdf, $(addprefix $(FIGURES_DIR)/, $(notdir $(basename $(wildcard figures/*.tex)))))


report: $(REPORT_NAME).pdf


$(REPORT_NAME).pdf: $(REPORT_NAME).tex sections/*.tex figures/* references.bib $(TIKZ_FIGURES) | $(BUILD_DIR) $(FIGURES_DIR)
	latexmk -pdf -jobname=$(REPORT_NAME) -shell-escape -output-directory=$(BUILD_DIR) $<
	cp -f $(BUILD_DIR)/$@ $@

$(FIGURES_DIR)/%.pdf: figures/%.tex | $(FIGURES_DIR)
	latexmk -pdf -jobname=$(basename $@) -shell-escape $<