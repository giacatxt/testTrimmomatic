rule all:
    input:
        "output/trimmed.fastq"

rule trim_reads:
    input:
        "input.fastq"
    output:
        "output/trimmed.fastq"
    shell:
        "java -jar Trimmomatic-0.39/trimmomatic-0.39.jar SE -phred33 {input} {output} LEADING:3 TRAILING:3"
