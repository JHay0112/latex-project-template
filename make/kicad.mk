# Builds KiCAD BOM and schematic


ifndef KICAD_MK
KICAD_MK = 1


include make/common.mk


KICAD_DIR = ./hardware
KICAD_PROJ = supervisor

FRONT_LAYERS = F.Cu,F.Silkscreen,Edge.Cuts,User.Drawings,User.Comments
BACK_LAYERS = B.Cu,B.Silkscreen,Edge.Cuts,User.Drawings,User.Comments


all: schematic pcb bom bom_summary

schematic: $(BUILD_DIR)/schematic.pdf
pcb: $(BUILD_DIR)/pcb_front.pdf $(BUILD_DIR)/pcb_back.pdf
bom: $(BUILD_DIR)/bom.csv 
bom_summary: $(BUILD_DIR)/bom_summary.txt


$(BUILD_DIR)/schematic.pdf: $(KICAD_DIR)/$(KICAD_PROJ).kicad_sch $(KICAD_DIR)/*.kicad_sch | $(BUILD_DIR)
	kicad-cli sch export pdf --no-background-color --output	$@ $<

$(BUILD_DIR)/pcb_front.pdf: $(KICAD_DIR)/$(KICAD_PROJ).kicad_pcb | $(BUILD_DIR)
	kicad-cli pcb export pdf $< --output $@ --layers $(FRONT_LAYERS) --include-border-title

$(BUILD_DIR)/pcb_back.pdf: $(KICAD_DIR)/$(KICAD_PROJ).kicad_pcb | $(BUILD_DIR)
	kicad-cli pcb export pdf $< --output $@ --layers $(BACK_LAYERS) --include-border-title --mirror


endif