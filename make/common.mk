# Common definitions for report template
#
# Author: J. L. Hay

ifndef REPORT_COMMON_MK
REPORT_COMMON_MK = 1


BUILD_DIR = build
FIGURES_DIR = figures


$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)/$(FIGURES_DIR)


.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)


vpath $(BUILD_DIR)
endif