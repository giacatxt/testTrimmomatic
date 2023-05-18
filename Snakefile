rule trim_reads:
    input:
        fastq="input.fastq"
    output:
        trimmed="output.fastq"
    shell:
        "docker run -v {input.fastq}:/data/input.fastq -v {output.trimmed}:/data/output.fastq trimmomatic PE /data/input.fastq /data/output.fastq"
