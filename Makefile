include config.mk

TXT_FILES=$(wildcard books/*.txt)
DAT_FILES=$(patsubst books/%.txt, outputs/%.dat, $(TXT_FILES))
PNG_FILES=$(patsubst books/%.txt, outputs/%.png, $(TXT_FILES))

## variables: Print variables.
.PHONY: variables
variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
	@echo PNG_FILES: $(PNG_FILES)

## all: Generate Zipf summary table with PNG plot.
.PHONY: all
all: outputs/results.txt $(PNG_FILES)

## plot: Generate Zipf plot.
pngs: $(PNG_FILES)

outputs/%.png: $(PLOT_SRC) outputs/%.dat
	$(LANGUAGE) $^ $@

## outputs/results.txt: Generate Zipf summary table.
outputs/results.txt: $(ZIPF_SRC) $(DAT_FILES)
	$(LANGUAGE) $^ > $@

## dats: Count words in text files.
.PHONY: dats
dats: $(DAT_FILES)

outputs/%.dat : $(COUNT_SRC) books/%.txt 
	$(LANGUAGE) $^ $@

## clean: Remove auto-generated files.
.PHONY: clean
clean:
	rm -f $(DAT_FILES) 
	rm -f $(PNG_FILES)
	rm -f outputs/results.txt

.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<