import streamlit as st
import subprocess

# Upload FASTQ file
fastq_file = st.file_uploader("Upload FASTQ file")

# Check if a file was uploaded
if fastq_file is not None:
    # Save uploaded file
    with open("input.fastq", "wb") as f:
        f.write(fastq_file.read())

    # Run Snakemake command to trim the reads
    subprocess.run(["snakemake", "--cores", "1"])

    # Check if the trimmed FASTQ file exists
    if st.button("Download Trimmed FASTQ"):
        st.download_button(label="Download", data="output/trimmed.fastq", file_name="trimmed.fastq")
