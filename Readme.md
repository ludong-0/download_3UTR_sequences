# Readme

For predicted miRNA targets, we can use RNAhybrid and mianda. Before using them, a 3'-UTR fasta file is needed to be prepared. However, main databases, for example TargetScan and miRBase, for predicted miRNA targets don't support 3'-UTR sequences fasta file.

I record here how to download cDNA fasta for ensembl, then prepare 3'-UTR sequences fasta file using biomaRt R package, and finally merger all 3'-UTR sequence into a fasta file.