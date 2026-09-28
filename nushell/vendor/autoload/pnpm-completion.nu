module completions {

    def pnpm-complete [|token: record, place: record, buffer: string] {
        with-env {
            SHELL: pwsh
            COMP_LINE: $buffer
            COMP_POINT: ($buffer | str length)
        } {
            pnpm completion-server -- ...$place.command | lines
        }
    }

    export extern pnpm [
        ...args: string@pnpm-complete
    ]

}

export use completions *
