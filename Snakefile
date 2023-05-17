rule all:
    input:
        "output/trimmed_{sample}.fastq"

rule trimmomatic:
    input:
        "input/{sample}.fastq"
    output:
        "output/trimmed_{sample}.fastq"
    shell:
        "trimmomatic SE -phred33 {input} {output} ILLUMINACLIP:adapters.fa:2:30:10"
