# Step01: download cDNA sequences

```bash
# download Rattus_norvegicus cDNA fasta
$ cd ~/project/RnoPANDORA/ld_analysis/database/ #cd to the diretory where you want to store the cDNA sequences.
$ wget http://ftp.ensembl.org/pub/release-105/fasta/rattus_norvegicus/cdna/Rattus_norvegicus.mRatBN7.2.cdna.all.fa.gz
$gunzip Rattus_norvegicus.mRatBN7.2.cdna.all.fa.gz

# list all transcript id into a file
cat Rattus_norvegicus.mRatBN7.2.cdna.all.fa | grep '^>' | cut -d '.' -f 1| sed 's/>//' > ENSRNOT
```