# USAGE: bash run_pipeline.sh
# to produce plots for isles and abyss
# and the summary table for the Zipf's law tests

python countwords.py books/isles.txt outputs/isles.dat
python countwords.py books/abyss.txt outputs/abyss.dat

python plotcounts.py outputs/isles.dat outputs/isles.png
python plotcounts.py outputs/abyss.dat outputs/abyss.png

# Generate summary table
python testzipf.py outputs/abyss.dat outputs/isles.dat > outputs/results.txt