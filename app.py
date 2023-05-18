import streamlit as st
import subprocess

st.title("Trimming with Trimomatic")

# Define the form inputs
fastq_file = st.file_uploader("Upload FASTQ file")
output_file = st.text_input("Output file name")

# Run Trimomatic
if fastq_file and output_file:
    # Save the uploaded file to a temporary location
    temp_path = "/tmp/uploaded.fastq"
    with open(temp_path, "wb") as file:
        file.write(fastq_file.getvalue())

    # Run Trimomatic
    cmd = f"docker run -v {temp_path}:/data/input.fastq -v {output_file}:/data/output.fastq trimmomatic PE /data/input.fastq /data/output.fastq"
    subprocess.run(cmd, shell=True, check=True)

    # Show success message
    st.success("Trimming completed successfully.")
