outputs/results.txt: testzipf.py outputs/isles.dat outputs/abyss.dat outputs/last.dat
	python $^ > $@

.PHONY: dats
dats: outputs/isles.dat outputs/abyss.dat outputs/last.dat

outputs/%.dat : countwords.py books/%.txt 
	python $^ $@

.PHONY: clean
clean:
	rm -f outputs/*.dat outputs/results.txt