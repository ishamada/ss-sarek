sudo nextflow run main.nf \
    -profile docker \
    --outdir out-dir  \
    --snpeff_cache "s3://annotation-cache/snpeff_cache/"  \
    --tools strelka,snpeff \
    --input samplesheet.csv \
    -resume