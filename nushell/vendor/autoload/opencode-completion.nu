module completions {

    def "sessions in pwd" [] {
        ^opencode session list --format json | from json | get id
    }

    export extern "opencode" [
        --standalone                            # Run with a private server instead of the background service
        --server                                # Connect to a server URL instead of the background service
        --auto                                  # Auto-approve permissions that are not explicitly denied
        --continue(-c)                          # Continue the last session
        --session(-s): string@"sessions in pwd" # Session ID to continue, or to create if it does not exist
        --prompt: string                        # Prompt to use
        --help(-h)                              # Show help information
        --version(-v)                           # Show version information
        --wizard                                # Start wizard mode for a command
        --completions: string@[
            "bash" "zsh" "fish" "sh"
        ] # Print shell completion script (choices: bash, zsh, fish, sh)
        --log-level: string@[
            "all" "trace" "debug" "info" "warn" "warning" "error" "fatal" "none"
        ] # Sets the minimum log level (choices: all, trace, debug, info, warn, warning, error, fatal, none)
        --print-logs # Print logs to stderr (server logs require --standalone)
    ]

    # Upgrade OpenCode to the latest or a specific version
    export extern "opencode upgrade" [
        --method(-m): string@[
            "curl" "npm" "pnpm" "bun" "yarn" "vp" "brew"
        ] # Installation method to use (choices: curl, npm, pnpm, bun, yarn, vp, brew)
        target?: string # Version to upgrade to (with or without a leading v) `(optional)`
    ]

    # Upgrade OpenCode to the latest or a specific version
    export extern "opencode update" [
        --method(-m): string@[
            "curl" "npm" "pnpm" "bun" "yarn" "vp" "brew"
        ] # Installation method to use (choices: curl, npm, pnpm, bun, yarn, vp, brew)
        target?: string # Version to upgrade to (with or without a leading v) `(optional)`
    ]

    # Start an Agent Client Protocol server
    export extern "opencode acp" []

    # Make a request to the running server
    export extern "opencode api" [
        operation: string    # OpenAPI operation ID, or an HTTP method followed by a path
        --standalone         # Run with a private server instead of the background service
        --server: string     # Connect to a server URL instead of the background service
        --data(-d): string   # Request body
        --header(-H): string # Request header in name:value form
        --param: string      # OpenAPI path or query parameter
    ]

    # Debugging and troubleshooting tools
    export extern "opencode debug" []

    # List all agents
    export extern "opencode debug agents" []

    # List configuration sources
    export extern "opencode debug config" []

    # Show global paths (data, config, cache, state)
    export extern "opencode debug paths" [
        name?: string@[
            "db" "home" "data" "config" "cache" "state" "tmp" "bin" "log" "repos"
        ] # Print only one path: db, home, data, config, cache, state, tmp, bin, log, repos `(optional)`
    ]

    # Manage integrations and credentials
    export extern "opencode auth" []

    # list integrations and credentials
    export extern "opencode auth list" [
        --standalone                        # Run with a private server instead of the background service
        --server: string                    # Connect to a server URL instead of the background service
        --format: string@["default" "json"] # Output format (choices: default, json)
    ]

    # connect an integration
    export extern "opencode auth login" [
        target?: string  # Integration ID, name, or well-known provider URL `(optional)`
        --standalone     # Run with a private server instead of the background service
        --server: string # Connect to a server URL instead of the background service
        --method: string # Authentication method ID
        --answer: string # Provider form answer (key=value; repeat for multiple fields)
    ]

    # log out of a saved account
    export extern "opencode auth logout" [
        target?: string     # Integration ID or name (optional)
        credential?: string # Credential ID or label (opens an account picker when omitted) (optional)
        --standalone        # Run with a private server instead of the background service
        --server: string    # Connect to a server URL instead of the background service
    ]

    # print stored credentials, including secrets, as JSON
    export extern "opencode auth export" [
        target?: string  # Integration ID or name (optional)
        --standalone     # Run with a private server instead of the background service
        --server: string # Connect to a server URL instead of the background service
    ]

    def "json files" [token: record] {
        $token.text | commandline complete --type path | where {|item|
            (($item | str ends-with "\\") or
             ($item | str ends-with "/") or
             ($item | str ends-with ".json") or
             ($item | str ends-with ".jsonc"))
        }
    }

    # import credentials exported by auth export
    export extern "opencode auth import" [
        file?: string@"json files" # JSON file to import (reads stdin when omitted) (optional)
        --standalone               # Run with a private server instead of the background service
        --server: string           # Connect to a server URL instead of the background service
    ]

    # switch the active account for an integration
    export extern "opencode auth switch" [
        target?: string     # Integration ID or name (optional)
        credential?: string # Credential ID or label (opens an account picker when omitted) (optional)
        --standalone        # Run with a private server instead of the background service
        --server: string    # Connect to a server URL instead of the background service
    ]

    # Manage MCP (Model Context Protocol) servers
    export extern "opencode mcp" []

    # List configured MCP servers and their status
    export extern "opencode mcp list" []

    # Add an MCP server to your configuration
    export extern "opencode mcp add" [
        name: string       # Name of the MCP server
        ...command: string # Command and arguments for a local server, passed after -- (optional)
        --url: string      # URL for a remote MCP server
        --header: string   # HTTP header for a remote server, as name=value
        --env: string      # Environment variable for a local server, as name=value
        --global           # Write to the global config instead of the project config
    ]

    # Authenticate with an OAuth-capable remote MCP server
    export extern "opencode mcp auth" [
        name?: string # Name of the MCP server (optional)
    ]

    # Remove stored OAuth credentials for an MCP server
    export extern "opencode mcp logout" [
        name: string # Name of the MCP server
    ]

    # Manage plugins
    export extern "opencode plugin" []

    # List plugins
    export extern "opencode plugin list" [
        --builtin # Include built-in server plugins
    ]

    # Install a plugin and add it to the global configuration
    export extern "opencode plugin add" [
        package: string # npm registry or Git package specifier
    ]

    # Check package plugins for updates
    export extern "opencode plugin check" [
        target?: string # Configured package target (optional)
    ]

    # Update package plugins
    export extern "opencode plugin update" [
        target?: string # Configured package target; omit to update all outdated plugins (optional)
    ]

    # Remove a plugin from global configuration
    export extern "opencode plugin remove" [
        package: string # configured package specifier
    ]

    # List all available models
    export extern "opencode models" [
        --standalone     # Run with a private server instead of the background service
        --server: string # Connect to a server URL instead of the background service
    ]

    # Show shareable usage statistics
    export extern "opencode stats" [
        --standalone      # Run with a private server instead of the background service
        --server: string  # Connect to a server URL instead of the background service
        --days: int       # Show the last N days; 0 means today
        --year: int       # Show a calendar year
        --all             # Show lifetime statistics
        --project: string # Filter by project ID, or use "." for the current project
        --models          # Show model usage
        --tools           # Show tool reliability
        --cost            # Show cost and token details
        --full            # Show every detailed section
        --limit: int      # Number of rows in detailed sections
        --json            # Output statistics as JSON
    ]

    # Start the minimal interactive interface
    export extern "opencode mini" [
        --standalone          # Run with a private server instead of the background service
        --server: string      # Connect to a server URL instead of the background service
        --continue(-c)        # Continue the last session
        --session(-s): string # Session ID to continue, or to create if it does not exist
        --fork                # Fork the session when continuing
        --replay              # Restore session history on resume and resize (disable with --no-replay)
        --replay-limit: int   # Limit replay to the newest N messages (default: 200)
        --model(-m): string   # Model to use in the format provider/model
        --agent: string       # Agent to use
        --prompt: string      # Prompt to use
    ]

    export extern "opencode session" []

    # List top-level sessions in the current project, newest first
    export extern "opencode session list" [
        --standalone                      # Run with a private server instead of the background service
        --server: string                  # Connect to a server URL instead of the background service
        --max-count(-n): int              # Limit to N most recent sessions (default: 100)
        --format: string@["table" "json"] # Output format (choices: table, json)
    ]

    # Delete a session and its child sessions
    export extern "opencode session delete" [
        session: string@"sessions in pwd" # Session ID to delete
        --standalone                      # Run with a private server instead of the background service
        --server: string                  # Connect to a server URL instead of the background service
    ]

    # Export session data as JSON
    export extern "opencode session export" [
        session?: string@"sessions in pwd" # Session ID to export `(optional)`
        --standalone                       # Run with a private server instead of the background service
        --server: string                   # Connect to a server URL instead of the background service
        --sanitize                         # Redact sensitive transcript and file data
    ]

    # Import session data from a JSON file or URL
    export extern "opencode session import" [
        file: string@"json files" # JSON file or URL to import
        --standalone              # Run with a private server instead of the background service
        --server: string          # Connect to a server URL instead of the background service
        --directory: string       # Directory in which to import the session
    ]

    # Manage the background server
    export extern "opencode service" []

    # Start the background server
    export extern "opencode service start" []

    # Restart the background server
    export extern "opencode service restart" []

    # Show background server status
    export extern "opencode service status" []

    # Stop the background server
    export extern "opencode service stop" []

    # Get service configuration
    export extern "opencode service get" [
        key?: string  # Service setting or env `(optional)`
        name?: string # Environment variable name `(optional)`
    ]

    # Set service configuration
    export extern "opencode service set" [
        key: string        # Service setting or env
        value: string      # Setting value or environment variable name
        env_value?: string # Environment variable value `(optional)`
    ]

    # Unset service configuration
    export extern "opencode service unset" [
        key: string   # Service setting or env
        name?: string # Environment variable name `(optional)`
    ]

    # Reload configuration
    export extern "opencode reload" [
        --standalone     # Run with a private server instead of the background service
        --server: string # Connect to a server URL instead of the background service
    ]

    # Print one-time links to connect a browser or app
    export extern "opencode pair" [
        --url: string # Use an external HTTP(S) server URL in pairing links
    ]

    # Start the v2 API and web server
    export extern "opencode serve" [
        --hostname: string
        --port: int
        --cors: string # Additional allowed CORS origin (repeat for multiple origins)
        --service
        --stdio
    ]
}

export use completions *
