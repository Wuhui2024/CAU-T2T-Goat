#ls 01_Data/05_Pacbio/*.fa > input.fofn
export DRMAA_LIBRARY_PATH=/opt/sge/lib/lx-amd64/libdrmaa.so.1.0 
/software/NextDenovo/lastest/nextDenovo run.cfg
