outputs/results.txt: outputs/isles.dat outputs/abyss.dat outputs/last.dat
	python testzipf.py $^ > $@

.PHONY: .dats
dats: outputs/isles.dat outputs/abyss.dat outputs/last.dat

# Count words.
outputs/isles.dat: books/isles.txt
	python countwords.py $< $@

outputs/abyss.dat : books/abyss.txt
	python countwords.py $< $@

outputs/last.dat : books/last.txt
	python countwords.py $< $@

.PHONY: clean
clean:
	rm -f outputs/*.dat outputs/result.txt