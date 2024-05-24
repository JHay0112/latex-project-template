# Report Makefile
# Builds the latex report contained in the directory. 
#
# Author: J. L. Hay


include ./make/common.mk


REPORT_NAME = report

CC_LATEX = latexmk
CP = cp

SECTIONS = $(wildcard sections/*.text)
FIGURES = $(wildcard figures/*)
TIKZ_FIGURES = $(addsuffix .pdf, $(basename $(wildcard figures/*.tex)))


report: $(REPORT_NAME).pdf


$(REPORT_NAME).pdf: $(REPORT_NAME).tex $(SECTIONS) $(FIGURES) $(TIKZ_FIGURES) report.bib | $(BUILD_DIR) $(FIGURES_DIR)
	$(CC_LATEX) -pdf -jobname=$(REPORT_NAME) -shell-escape -output-directory=$(BUILD_DIR) $<
	$(CC_LATEX) -f $(BUILD_DIR)/$@ $@

$(FIGURES_DIR)/%.pdf: figures/%.tex | $(FIGURES_DIR)
	$(LATEX_CC) -pdf -jobname=$(basename $@) -shell-escape $<