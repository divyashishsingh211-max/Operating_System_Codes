SHELL := /bin/bash

EXP1_DIR := experiments/01-linux-system-administration

.PHONY: help exp1 output1 clean

help:
	@echo "Operating System Codes - available targets"
	@echo ""
	@echo "  make exp1     Run the Experiment 1 demo"
	@echo "  make output1  Regenerate Experiment 1 sample output"
	@echo "  make clean    Remove build artifacts"
	@echo ""

exp1:
	@bash $(EXP1_DIR)/demo.sh

output1:
	@bash $(EXP1_DIR)/demo.sh > $(EXP1_DIR)/output.txt 2>&1
	@echo "Saved $(EXP1_DIR)/output.txt"

clean:
	@find . -type f \( -name '*.o' -o -name '*.obj' -o -name 'a.out' \) -delete
	@echo "Cleaned build artifacts."
