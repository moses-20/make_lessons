include config.mk

TXT_FILES=$(wildcard books/*.txt)
DAT_FILES=$(patsubst books/%.txt, outputs/%.dat, $(TXT_FILES))

## outputs/results.txt: Generate Zipf summary table.
outputs/results.txt: $(ZIPF_SRC) $(DAT_FILES)
	$(LANGUAGE) $^ > $@

## variables: Print variables.
.PHONY: variables
variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)

## dats: Count words in text files.
.PHONY: dats
dats: $(DAT_FILES)

outputs/%.dat : $(COUNT_SRC) books/%.txt 
	$(LANGUAGE) $^ $@

## clean: Remove auto-generated files.
.PHONY: clean
clean:
	rm -f $(DAT_FILES) 
	rm -f outputs/results.txt

.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<