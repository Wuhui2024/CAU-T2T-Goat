set -ex


for i in `ls rsy.finally.centormere.fasta.split/*.fasta|cut -d/ -f2`
do
    mkdir -p /identity/${i}/ 
    echo "
sample: ${i%:*}
fasta: /identity/rsy.finally.centormere.fasta.split/$i
window: 10000
nbatch: 4
alnthreads: 20
mm_f: 10000
tempdir: temp
" > /identity/${i%:*}/conf.yaml
done
