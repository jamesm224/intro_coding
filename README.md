# Introduction to Coding!!
Here is a tutorial on how to login, use, and access engaging for MIT.
Here is the official wiki page for additional question: https://engaging-web.mit.edu/eofe-wiki/

# 1. Login to engaging:

Engaging website: https://engaging-ood.mit.edu/pun/sys/dashboard

Ensure your directory is your username. Run these commands:
```
cd $HOME
pwd
```

# 2. Install Conda/Mamba - here is the link for more information: 
https://mamba.readthedocs.io/en/latest/installation/mamba-installation.html
```
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh
```
Alternatively Try this:
```
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh
```

To Test the pipeline installation has worked please try typing this command:
```
mamba -h
```
# 3. Create a mamba environment for your project
```
mamba create -c bioconda -c conda-forge -n fun_bioinfo kaiju bbmap bowtie2

mamba activate fun_bioinfo
```

# 4. Git clone this repository:

```
git clone https://github.com/jamesm224/intro_coding/
```

# 5. Attempt to run the bash script on the test data

```
sbatch run_test_script.sh
```






