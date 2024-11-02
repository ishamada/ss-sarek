include { HEYAMMAR } from './../../modules/local/heyammar.nf'

workflow AMMARSAYSHEYAMMAR {
    HEYAMMAR()
    println "you won't see the message for sure cuz it's an echo command in a script"
}

