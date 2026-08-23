export extern "rustup" [
    --verbose(-v)    # Set log level to 'DEBUG' if 'RUSTUP_LOG' is unset
    --quiet(-q)      # Disable progress output, set log level to 'WARN' if 'RUSTUP_LOG' is unset
    --help(-h)       # Print help
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
    --help(-h)        # Print help
]

# Uninstall the given toolchains
export extern "rustup uninstall" [
    --help(-h) # Print help
]

# Dump information about the build
export extern "rustup dump-testament" [
    --help(-h) # Print help
]

# Install, uninstall, or list toolchains
export extern "rustup toolchain" [
    --help(-h) # Print help
]

# List installed toolchains
export extern "rustup toolchain list" [
    --verbose(-v) # Enable verbose output with toolchain information
    --quiet(-q)   # Force the output to be a single column
    --help(-h)    # Print help
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
    --help(-h)        # Print help
]

# Install or update the given toolchains, or by default the active toolchain
export extern "rustup toolchain uninstall" [
    --help(-h) # Print help
]

# Create a custom toolchain by symlinking to a directory
export extern "rustup toolchain link" [
    --help(-h) # Print help
]

# Print this message or the help of the given subcommand(s)
export extern "rustup toolchain help" []

# Set the default toolchain
export extern "rustup default" [
    --force-non-host # Install toolchains that require an emulator. See https://github.com/rust-lang/rustup/wiki/Non-host-toolchains
    --help(-h)       # Print help
]

# Show the active and installed toolchains or profiles
export extern "rustup show" [
    --verbose(-v) # Enable verbose output with rustc information for all installed toolchains
    --help(-h)    # Print help
]
# Show the active toolchain
export extern "rustup show active-toolchain" [
    --verbose(-v) # Enable verbose output with rustc information
    --help(-h)    # Print help
]

# Display the computed value of RUSTUP_HOME
export extern "rustup show home" [
    --help(-h) # Print help
]

# Show the default profile used for the `rustup install` command
export extern "rustup show profile" [
    --help(-h) # Print help
]

# Print this message or the help of the given subcommand(s)
export extern "rustup show help" []

# Update Rust toolchains and rustup
export extern "rustup update" [
    --no-self-update # Don't perform self update when running the `rustup update` command
    --force          # Force an update, even if some components are missing
    --force-non-host # Install toolchains that require an emulator. See https://github.com/rust-lang/rustup/wiki/Non-host-toolchains
    --help(-h)       # Print help
]

# Check for updates to Rust toolchains and rustup
export extern "rustup check" [
    --no-self-update # Don't check for self update when running the `rustup check` command
    --help(-h)       # Print help
]

# Modify a toolchain's supported targets
export extern "rustup target" [
    --help(-h) # Print help
]

# List installed and available targets
export extern "rustup target list" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
    --installed # List only installed targets
    --quiet(-q) # Force the output to be a single column
    --help(-h)  # Print help
]

# Add a target to a Rust toolchain
export extern "rustup target add" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
    --help(-h)  # Print help
]

# Remove a target from a Rust toolchain
export extern "rustup target remove" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
    --help(-h)  # Print help
]

# Print this message or the help of the given subcommand(s)
export extern "rustup target help" []

# Modify a toolchain's installed components
export extern "rustup component" [
    --help(-h) # Print help
]

# List installed and available components
export extern "rustup component list" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
    --installed # List only installed components
    --quiet(-q) # Force the output to be a single column
    --help(-h)  # Print help
]

# Add a component to a Rust toolchain
export extern "rustup component add" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
    --target    # target
    --help(-h)  # Print help
]

# Remove a component from a Rust toolchain
export extern "rustup component remove" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
    --target    # target
    --help(-h)  # Print help
]

# Print this message or the help of the given subcommand(s)
export extern "rustup component help" []

# Modify toolchain overrides for directories
export extern "rustup override" [
    --help(-h) # Print help
]

# List directory toolchain overrides
export extern "rustup override list" [
    --help(-h) # Print help
]

# Set the override toolchain for a directory
export extern "rustup override set" [
    --path     # Path to the directory
    --help(-h) # Print help
]

# Remove the override toolchain for a directory
export extern "rustup override unset" [
    --path        # Path to the directory
    --nonexistent # Remove override toolchain for all nonexistent directories
    --help(-h)    # Print help
]

# Print this message or the help of the given subcommand(s)
export extern "rustup override help" []

# Run a command with an environment configured for a given toolchain
export extern "rustup run" [
    --install  # Install the requested toolchain if needed
    --help(-h) # Print help
]

# Display which binary will be run for a given command
export extern "rustup which" [
    --toolchain # Toolchain name, such as 'stable', 'nightly', '1.8.0', or a custom toolchain name. For more information see `rustup help toolchain`
    --help(-h)  # Print help
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
    --help(-h)        # Print help
]

# Modify the rustup installation
export extern "rustup self" [
    --help(-h) # Print help
]

# Download and install updates to rustup
export extern "rustup self update" [
    --help(-h) # Print help
]

# Uninstall rustup
export extern "rustup self uninstall" [
    -y               # Disable confirmation prompt
    --no-modify-path # Do not clean up the `PATH` environment variable
    --help(-h)       # Print help
]

# Upgrade the internal data format
export extern "rustup self upgrade-data" [
    --help(-h) # Print help
]

# Print this message or the help of the given subcommand(s)
export extern "rustup self help" []

# Alter rustup settings
export extern "rustup set" [
    --help(-h) # Print help
]

# The triple used to identify toolchains when not specified
export extern "rustup set default-host" [
    --help(-h) # Print help
]

# The default components installed with a toolchain
export extern "rustup set profile" [
    --help(-h) # Print help
]

# The rustup auto self update mode
export extern "rustup set auto-self-update" [
    --help(-h) # Print help
]

# The auto toolchain install mode
export extern "rustup set auto-install" [
    --help(-h) # Print help
]

# Print this message or the help of the given subcommand(s)
export extern "rustup set help" []

# Generate tab-completion scripts for your shell
export extern "rustup completions" [
    --help(-h) # Print help
]

# Print this message or the help of the given subcommand(s)
export extern "rustup help" []

export use completions *
