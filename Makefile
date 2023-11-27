outputs/result.txt: outputs/isles.dat outputs/abyss.dat outputs/last.dat
	python testzipf.py outputs/abyss.dat outputs/isles.dat outputs/last.dat > outputs/results.txt

.PHONY: .dats
dats: outputs/isles.dat outputs/abyss.dat outputs/last.dat

# Count words.
outputs/isles.dat: books/isles.txt
	python countwords.py books/isles.txt outputs/isles.dat

outputs/abyss.dat : books/abyss.txt
	python countwords.py books/abyss.txt outputs/abyss.dat

outputs/last.dat : books/last.txt
	python countwords.py books/last.txt outputs/last.dat

.PHONY: clean
clean:
	rm -f outputs/*.dat outputs/result.txt