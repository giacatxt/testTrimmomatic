import streamlit as st
import subprocess

def run_trimmomatic(input_file):
    output_file = f"output/trimmed_{input_file.name}"
    cmd = f"trimmomatic SE -phred33 {input_file.name} {output_file} ILLUMINACLIP:adapters.fa:2:30:10"
    subprocess.run(cmd, shell=True)

def main():
    st.title("Trimmomatic Workflow")
    st.write("Upload a FASTQ file to perform trimming using Trimmomatic.")

    uploaded_file = st.file_uploader("Upload a FASTQ file", type="fastq")

    if uploaded_file is not None:
        st.write("File uploaded successfully.")
        st.write(f"File name: {uploaded_file.name}")

        if st.button("Run Trimmomatic"):
            st.write("Running Trimmomatic...")
            run_trimmomatic(uploaded_file)
            st.write("Trimmomatic completed.")

if __name__ == "__main__":
    main()
