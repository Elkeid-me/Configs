module completions {

    def winget-complete [token: record, place: record, buffer: string] {
        ^winget complete --commandline $buffer --word $token.text --position $place.cursor | lines
    }

    export extern winget [
        ...args: string@winget-complete
    ]

}

export use completions *
