export extern "rustup" [
    --verbose(-v)    # Set log level to 'DEBUG' if 'RUSTUP_LOG' is unset
    --quiet(-q)      # Disable progress output, set log level to 'WARN' if 'RUSTUP_LOG' is unset
    --version(-V)    # Print version
]

# Install or update the given toolchains, or by default the active toolchain
export extern "rustup install" [
    --profile         # profile
    --component(-c)   # Comma-separated list of components to be added on installation
    --target(-t)      # Comma-separated list of targets to be added on installation
    --no-self-update  # Don't perform self update when running the `rustup toolchain install` command
    --no-update       # Don't try to update the installed toolchain
    --force           # Force an update, even if some components are missing
    --allow-downgrade # Allow rustup to downgrade the toolchain to satisfy your component choice
    --force-non-host  # Install toolchains that require an emulator. See https://github.com/rust-lang/rustup/wiki/Non-host-toolchains
    --override        # Set the installed toolchain as the override for the current directory
]

# Uninstall the given toolchains
export extern "rustup uninstall" []

# Dump information about the build
export extern "rustup dump-testament" []

# Install, uninstall, or list toolchains
export extern "rustup toolchain" []

# List installed toolchains
export extern "rustup toolchain list" [
    --verbose(-v) # Enable verbose output with toolchain information
    --quiet(-q)   # Force the output to be a single column
]

# Install or update the given toolchains, or by default the active toolchain
export extern "rustup toolchain install" [
    --profile         # profile
    --component(-c)   # Comma-separated list of components to be added on installation
    --target(-t)      # Comma-separated list of targets to be added on installation
    --no-self-update  # Don't perform self update when running the `rustup toolchain install` command
    --no-update       # Don't try to update the installed toolchain
    --force           # Force an update, even if some components are missing
    --allow-downgrade # Allow rustup to downgrade the toolchain to satisfy your component choice
    --force-non-host  # Install toolchains that require an emulator. See https://github.com/rust-lang/rustup/wiki/Non-host-toolchains
    --override        # Set the installed toolchain as the override for the current directory
]

# Install or update the given toolchains, or by default the active toolchain
export extern "rustup toolchain uninstall" []

# Create a custom toolchain by symlinking to a directory
export extern "rustup toolchain link" []

# Print this message or the help of the given subcommand(s)
export extern "rustup toolchain help" [
    subcommand: string@["list" "install" "uninstall" "link"]
]

# Set the default toolchain
export extern "rustup default" [
    --force-non-host # Install toolchains that require an emulator. See https://github.com/rust-lang/rustup/wiki/Non-host-toolchains
]

# Show the active and installed toolchains or profiles
export extern "rustup show" [
    --verbose(-v) # Enable verbose output with rustc information for all installed toolchains
]
# Show the active toolchain
export extern "rustup show active-toolchain" [
    --verbose(-v) # Enable verbose output with rustc information
]

# Display the computed value of RUSTUP_HOME
export extern "rustup show home" []

# Show the default profile used for the `rustup install` command
export extern "rustup show profile" []

# Print this message or the help of the given subcommand(s)
export extern "rustup show help" []

# Update Rust toolchains and rustup
export extern "rustup update" [
    --no-self-update # Don't perform self update when running the `rustup update` command
    --force          # Force an update, even if some components are missing
    --force-non-host # Install toolchains that require an emulator. See https://github.com/rust-lang/rustup/wiki/Non-host-toolchains
]

# Check for updates to Rust toolchains and rustup
export extern "rustup check" [
    --no-self-update # Don't check for self update when running the `rustup check` command
]

# Modify a toolchain's supported targets
export extern "rustup target" []

# List installed and available targets
export extern "rustup target list" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
    --installed # List only installed targets
    --quiet(-q) # Force the output to be a single column
]

# Add a target to a Rust toolchain
export extern "rustup target add" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
]

# Remove a target from a Rust toolchain
export extern "rustup target remove" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
]

# Print this message or the help of the given subcommand(s)
export extern "rustup target help" [
    subcommand: string@["list" "add" "remove"]
]

# Modify a toolchain's installed components
export extern "rustup component" []

# List installed and available components
export extern "rustup component list" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
    --installed # List only installed components
    --quiet(-q) # Force the output to be a single column
]

# Add a component to a Rust toolchain
export extern "rustup component add" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
    --target    # target
]

# Remove a component from a Rust toolchain
export extern "rustup component remove" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
    --target    # target
]

# Print this message or the help of the given subcommand(s)
export extern "rustup component help" [
    subcommand: string@["list" "add" "remove"]
]

# Modify toolchain overrides for directories
export extern "rustup override" []

# List directory toolchain overrides
export extern "rustup override list" []

# Set the override toolchain for a directory
export extern "rustup override set" [
    --path     # Path to the directory
]

# Remove the override toolchain for a directory
export extern "rustup override unset" [
    --path        # Path to the directory
    --nonexistent # Remove override toolchain for all nonexistent directories
]

# Print this message or the help of the given subcommand(s)
export extern "rustup override help" [
    subcommand: string@["list" "set" "unset"]
]

# Run a command with an environment configured for a given toolchain
export extern "rustup run" [
    --install  # Install the requested toolchain if needed
]

# Display which binary will be run for a given command
export extern "rustup which" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', '1.8.0', or a custom toolchain name. For more information see `rustup help toolchain`
]

# Open the documentation for the current toolchain
export extern "rustup doc" [
    --toolchain       # Toolchain name, such as 'stable'nightly', or '1.8.0'. For more information see `rustup help toolchain`
    --path            # Only print the path to the documentation
    --alloc           # The Rust core allocation and collections library
    --book            # The Rust Programming Language book
    --cargo           # The Cargo Book
    --clippy          # The Clippy Documentation
    --core            # The Rust Core Library
    --edition-guide   # The Rust Edition Guide
    --embedded-book   # The Embedded Rust Book
    --error-codes     # The Rust Error Codes Index
    --nomicon         # The Dark Arts of Advanced and Unsafe Rust Programming
    --proc_macro      # A support library for macro authors when defining new macros
    --reference       # The Rust Reference
    --releases        # Rust Release Notes
    --rust-by-example # A collection of runnable examples that illustrate various Rust concepts and standard libraries
    --rustc           # The compiler for the Rust programming language
    --rustc-docs      # The API documentation for the Rust compiler and other toolchain components
    --rustdoc         # Documentation generator for Rust projects
    --std             # Standard library API documentation
    --style-guide     # The Rust Style Guide
    --test            # Support code for rustc's built in unit-test and micro-benchmarking framework
    --unstable-book   # The Unstable Book
]

# Modify the rustup installation
export extern "rustup self" []

# Download and install updates to rustup
export extern "rustup self update" []

# Uninstall rustup
export extern "rustup self uninstall" [
    -y               # Disable confirmation prompt
    --no-modify-path # Do not clean up the `PATH` environment variable
]

# Upgrade the internal data format
export extern "rustup self upgrade-data" []

# Print this message or the help of the given subcommand(s)
export extern "rustup self help" [
    subcommand: string@["update" "uninstall" "upgrade-data"]
]

# Alter rustup settings
export extern "rustup set" []

# The triple used to identify toolchains when not specified
export extern "rustup set default-host" []

# The default components installed with a toolchain
export extern "rustup set profile" []

# The rustup auto self update mode
export extern "rustup set auto-self-update" []

# The auto toolchain install mode
export extern "rustup set auto-install" []

# Print this message or the help of the given subcommand(s)
export extern "rustup set help" [
    subcommand: string@[
        "default-host" "profile" "auto-self-update" "auto-install"
    ]
]

# Generate tab-completion scripts for your shell
export extern "rustup completions" []

# Print this message or the help of the given subcommand(s)
export extern "rustup help" [
    subcommand: string@[
        "install" "uninstall" "dump-testament" "toolchain"
        "default" "show" "update" "check" "target" "component"
        "override" "run" "which" "doc" "self" "set" "completions"
    ]
]
