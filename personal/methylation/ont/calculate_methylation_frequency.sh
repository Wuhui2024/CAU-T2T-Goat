set -ex

/software/nanopolish_v0.14.0/nanopolish-0.14.0/scripts/calculate_methylation_frequency.py  20220809-UNL315-P7-PAK44866-sup.methylation_calls.tsv 20220809-UNL315-P7-PAK46016-sup.methylation_calls.tsv 20220811-UNL315-P7-PAK46778-sup.methylation_calls.tsv 20220818-UNL315-P6-PAK46683-sup.methylation_calls.tsv 20220818-UNL315-P6-PAK47570-sup.methylation_calls.tsv > methylation_frequency.tsv
