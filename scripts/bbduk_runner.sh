bbduk.sh -Xmx40g \
                    t=32 \
                    in=${reads[0]} \
                    in2=${reads[1]} \
                    out=${prefix_pe}_1.trim.fastq.gz \
                    out2=${prefix_pe}_2.trim.fastq.gz \
                    ref=${bbmap_adapters} \
                    ktrim=r qtrim=rl trimq=10 k=23 mink=11 hdist=1 \
                    maq=10 minlen=25 \
                    tpe tbo \
                    literal=AAAAAAAAAAAAAAAAAAAAAAA \
                    stats=${prefix_pe}.trimstats.txt \
                    refstats=${prefix_pe}.refstats.txt

 reformat.sh -Xmx40g \
                    t=32 \
                    in=${prefix_pe}_1.trim.fastq.gz \
                    in2=${prefix_pe}_2.trim.fastq.gz \
                    out=${prefix_pe}_1.flip.trim.fastq.gz \
                    out2=${prefix_pe}_2.flip.trim.fastq.gz \
                    rcomp=t

