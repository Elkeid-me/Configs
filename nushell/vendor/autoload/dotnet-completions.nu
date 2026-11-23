module completions {

    def "nu-complete dotnet" [buffer: string] {
        ^dotnet complete $buffer | lines
    }

    export extern dotnet [
        ...args: string@"nu-complete dotnet"
    ]

}

export use completions *
