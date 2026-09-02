module completions {
    def "elan-complete toolchain" [] {
        ["stable" "beta" "nightly"]
    }

    def "elan-complete toolchain installed" [] {
        elan toolchain list | lines | where $in != "no installed toolchains"
    }

    export extern "elan" [
        --verbose(-v) # Enable verbose output
        --help(-h)    # Prints help information
        --version(-V) # Prints version information
    ]

    # Show the active and installed toolchains
    export extern "elan show" [
        --help(-h)    # Prints help information
    ]

    # Install Lean toolchain
    export extern "elan install" [
        --help(-h)    # Prints help information
        toolchain: string@"elan-complete toolchain"
    ]

    # Uninstall Lean toolchains
    export extern "elan uninstall" [
        --help(-h)    # Prints help information
        toolchain: string@"elan-complete toolchain installed"
    ]

    # Set the default toolchain
    export extern "elan default" [
        --help(-h)    # Prints help information
        toolchain: string@"elan-complete toolchain installed"
    ]

    # Modify or query the installed toolchains
    export extern "elan toolchain" [
        --help(-h)    # Prints help information
    ]

    # List installed toolchains
    export extern "elan toolchain list" [
        --help(-h)    # Prints help information
    ]

    # Install a given toolchain
    export extern "elan toolchain install" [
        --help(-h)    # Prints help information
        toolchain: string@"elan-complete toolchain"
    ]

    # Uninstall a toolchain
    export extern "elan toolchain uninstall" [
        --help(-h)    # Prints help information
        toolchain: string@"elan-complete toolchain installed"
    ]

    # Create a custom toolchain by symlinking to a directory
    export extern "elan toolchain link" [
        --help(-h)    # Prints help information
        toolchain: string@"elan-complete toolchain"
    ]

    # Garbage-collect toolchains not used by any known project
    export extern "elan toolchain gc" [
        --delete      # Delete collected toolchains instead of only reporting them
        --json        # Format output as JSON
        --help(-h)    # Prints help information
    ]

    # Prints this message or the help of the given subcommand(s)
    export extern "elan toolchain help" [
        subcommand: string@["list" "install" "uninstall" "link" "gc"]
    ]

    # Modify directory toolchain overrides
    export extern "elan override" [
        --help(-h)    # Prints help information
    ]

    # List directory toolchain overrides
    export extern "elan override list" [
        --help(-h)    # Prints help information
    ]

    # Set the override toolchain for a directory
    export extern "elan override set" [
        --help(-h)    # Prints help information
        toolchain: string@"elan-complete toolchain"
    ]

    # Remove the override toolchain for a directory
    export extern "elan override unset" [
        --nonexistent # Remove override toolchain for all nonexistent directories
        --help(-h)    # Prints help information
        --path        # Path to the directory
    ]

    # Prints version information
    export extern "elan override help" [
        subcommand: string@["list" "set" "unset"]
    ]

    # Run a command with an environment configured for a given toolchain
    export extern "elan run" [
        --install     # Install the requested toolchain if needed
        --help(-h)    # Prints help information
        toolchain: string@"elan-complete toolchain"
    ]

    # Display which binary will be run for a given command
    export extern "elan which" [
        --help(-h)    # Prints help information
        toolchain: string@"elan-complete toolchain"
    ]

    # Display which binary will be run for a given command
    export extern "elan self" [
        --help(-h)    # Prints help information
    ]

    # Download and install updates to elan
    export extern "elan self update" [
        --help(-h)    # Prints help information
    ]

    # Uninstall elan
    export extern "elan self uninstall" [
        -y
        --help(-h)    # Prints help information
    ]

    # Prints this message or the help of the given subcommand(s)
    export extern "elan self help" [
        subcommand: string@["update" "uninstall"]
    ]

    # Generate completion scripts for your shell
    export extern "elan completions" [
        --help(-h)
        shell: string@["zsh" "bash" "fish" "powershell" "elvish"]
    ]

    # Prints this message or the help of the given subcommand(s)
    export extern "elan help" [
        subcommand: string@[
            "show" "install" "uninstall" "default" "toolchain" "override"
            "run" "which" "self" "completions"
        ]
    ]
}

export use completions *
