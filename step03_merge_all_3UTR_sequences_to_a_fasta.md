# step03_merge_all_3UTR_sequences_to_a_fasta

After download 3'-UTR sequences using biomatRt R package, we need to merge all 3'-UTR sequences into a fasta files.

Let's upload all the 3'-UTR sequnences to a directory ./database/3UTR in linux server. Then

```bash
# cd to the database diretory
$ paste --delimiter=\\n --serial ./3UTR/* > Rno_3UTR.fasta #If use cat command, you cann't let each file to be on a separate line.
$ less Rno_3UTR.fasta
# Some 3'-UTRs are only "T", which recognized as "TRUE" by shell.
$ less Rno_3UTR.fasta | grep 'TRUE' -A 1
$ tac Rno_3UTR.fasta | sed '/TRUE/I,+1 d' | tac > Rno_3UTR.fasta1
$ mv Rno_3UTR.fasta1 Rno_3UTR.fasta
```

Now, We finish this work.
