
// include { RENDER_ANNOTATION_REPORT        } from '../../modules/local/helper/validate/main.nf'

// Importing Quarto notebooks

workflow SKYGENIC_REPORTS {

    take:
        ch_annotated_vcf // channel: [ val(sample), [ fastq ] ]

    main:

        // Channel definitions
        ch_versions  = Channel.empty()

        // Quarto settings
        ch_template    = Channel.fromPath(params.template, checkIfExists: true)
            .collect()

        ch_page_config = Channel.fromPath(params.page_config, checkIfExists: true)
            .collect()

        ch_page_config = ch_template
            .map{ file -> file.find { it.toString().endsWith('.png') } }
            .combine(ch_page_config)
            .collect()

    emit:
        ch_cellrange_outs

}