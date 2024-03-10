set -ex

/PASA/current/scripts/Launch_PASA_pipeline.pl -c PASA.alignAssembly.config \
        --PASACONF /PASA/current/pasa_conf/conf.txt \
         -C -R -g genome.fasta -T \
        -u /PASA/seqclean/transcript.rename.fasta \
        -t /PASA/seqclean/transcript.rename.fasta.clean  \
        -f /PASA/seqclean/tgs_seqclean/fl.acc  --CPU 5 --ALIGNERS gmap
 /Python-3.6.3/bin/python3 rename_pasa_gtf.py rsy_PASA.pasa_assemblies.gtf  > rsy_PASA.pasa_assemblies.rename.gtf
