module completions {

    def "nu-complete pnpm" [token: record, place: record, buffer: string] {
        with-env {
            SHELL: pwsh
            COMP_LINE: $buffer
            COMP_POINT: $place.cursor
        } {
            pnpm completion-server -- ...$place.command | lines
        }
    }

    export extern pnpm [
        ...args: string@"nu-complete pnpm"
    ]

}

export use completions *
