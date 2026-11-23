module completions {

    def "nu-complete winget" [token: record, place: record, buffer: string] {
        ^winget complete --commandline $buffer --word $token.text --position $place.cursor | lines
    }

    export extern winget [
        ...args: string@"nu-complete winget"
    ]

}

export use completions *
