FROM openjdk:8

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    python3-pip

# Download and install Trimomatic
WORKDIR /opt
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip && \
    unzip Trimmomatic-0.39.zip && \
    rm Trimmomatic-0.39.zip

# Set environment variables
ENV TRIMMOMATIC_HOME /opt/Trimmomatic-0.39

# Add Trimommatic to the PATH
ENV PATH $TRIMMOMATIC_HOME:$PATH

# Install Snakemake and Streamlit
RUN pip3 install snakemake streamlit

# Set the entrypoint
ENTRYPOINT ["trimmomatic"]
