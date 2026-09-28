module completions {

    def dotnet-complete [buffer: string] {
        ^dotnet complete $buffer | lines
    }

    export extern dotnet [
        ...args: string@dotnet-complete
    ]

}

export use completions *
