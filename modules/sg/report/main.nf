## adding a single line test
process RENDER_ANNOTATION_REPORT {

    input:
        path(annotated_vcf)
        path(page_config)

    output:
        path("report_skygenic.html")

    script:
    """
        quarto render report_skygenic.qmd -P input_annotation:${annotated_vcf}
    """

    stub:
    """
        echo input_annotation:${annotated_vcf} > report_skygenic.html
    """

}