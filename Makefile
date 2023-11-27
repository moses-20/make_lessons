outputs/results.txt: testzipf.py outputs/isles.dat outputs/abyss.dat outputs/last.dat
	python $^ > $@

.PHONY: .dats
dats: outputs/isles.dat outputs/abyss.dat outputs/last.dat

# Count words.
outputs/isles.dat: books/isles.txt countwords.py
	python countwords.py $< $@

outputs/abyss.dat : books/abyss.txt countwords.py
	python countwords.py $< $@

outputs/last.dat : books/last.txt countwords.py
	python countwords.py $< $@

.PHONY: clean
clean:
	rm -f outputs/*.dat outputs/result.txt