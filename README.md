# Analytics Assignment : Deduplication of Data Set
###### R stringdist Package:
The stringdist package offers fast and platform-independent string metrics. Its main purpose is to compute various string distances and to do approximate text matching between character vectors. Implements an approximate string matching version of R's native 'match' function. Can calculate various string distances based on edits (Damerau-Levenshtein, Hamming, Levenshtein, optimal sting alignment), qgrams (q- gram, cosine, jaccard distance) or heuristic metrics (Jaro, Jaro-Winkler). An implementation of soundex is provided as well. Distances can be computed between character vectors while taking proper care of encoding or between integer vectors representing generic sequences.

###### Installation : install.packages("stringdist")

This project emphsizes on removing duplicates records of patients from data set. In the given data set a single patient record is present multiple times with slight variations. Exact matching of the strings will not remove all duplicates, so there is a need to perform fuzzy string matching which creates a Jaro Winkler distance matrix using uses jw method of stringdist package. Similar fields have lower value in matrix. Therefore, a threshold value is set to distinguish between the similar and dissimlar records. Ultimately leading to deduplicationof data.  
