# Common definitions for report template makefiles


ifndef REPORT_COMMON_MK
REPORT_COMMON_MK = 1


BUILD_DIR = ./build 


$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)


.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)


endif