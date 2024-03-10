set -ex

/Repeat/RepeatModeler-open-1.0.11/BuildDatabase -name rsy -engine wublast rsy.fasta.masked
/Repeat/RepeatModeler-open-1.0.11/RepeatModeler -pa 30 -database rsy -engine wublast
