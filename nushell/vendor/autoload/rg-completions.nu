module completions {
  def "nu-complete rg color" [] { ["never", "auto", "always", "ansi"] }
  def "nu-complete rg engine" [] { ["default", "pcre2", "auto"] }
  def "nu-complete rg generate" [] { ["man", "complete-bash", "complete-zsh", "complete-fish", "complete-powershell", "complete-nushell"] }
  def "nu-complete rg hyperlink-format" [] { ["default", "none", "cursor", "file", "grep+", "kitty", "macvim", "textmate", "vscode", "vscode-insiders", "vscodium", "zed"] }
  def "nu-complete rg sort" [] { ["none", "path", "modified", "accessed", "created"] }
  def "nu-complete rg sortr" [] { ["none", "path", "modified", "accessed", "created"] }
  def "nu-complete rg types" [] {
    ^rg --type-list
    | lines
    | split column ": "
    | rename value description
    | update value { str trim }
  }

  export extern "rg" [
    pattern?: string # The pattern to search for
    ...paths: path # The paths to search
    --regexp(-e): string # A pattern to search for.
    --file(-f): path # Search for patterns from the given file.
    --after-context(-A): string # Show NUM lines after each match.
    --before-context(-B): string # Show NUM lines before each match.
    --binary # Search binary files.
    --no-binary # Search binary files.
    --block-buffered # Force block buffering.
    --no-block-buffered # Force block buffering.
    --byte-offset(-b) # Print the byte offset for each matching line.
    --no-byte-offset # Print the byte offset for each matching line.
    --case-sensitive(-s) # Search case sensitively (default).
    --color: string@"nu-complete rg color" # When to use color.
    --colors: string # Configure color settings and styles.
    --column # Show column numbers.
    --no-column # Show column numbers.
    --context(-C): string # Show NUM lines before and after each match.
    --context-separator: string # Set the separator for contextual chunks.
    --no-context-separator # Set the separator for contextual chunks.
    --count(-c) # Show count of matching lines for each file.
    --count-matches # Show count of every match for each file.
    --crlf # Use CRLF line terminators (nice for Windows).
    --no-crlf # Use CRLF line terminators (nice for Windows).
    --debug # Show debug messages.
    --dfa-size-limit: string # The upper size limit of the regex DFA.
    --encoding(-E): string # Specify the text encoding of files to search.
    --no-encoding # Specify the text encoding of files to search.
    --engine: string@"nu-complete rg engine" # Specify which regex engine to use.
    --field-context-separator: string # Set the field context separator.
    --field-match-separator: string # Set the field match separator.
    --files # Print each file that would be searched.
    --files-with-matches(-l) # Print the paths with at least one match.
    --files-without-match # Print the paths that contain zero matches.
    --fixed-strings(-F) # Treat all patterns as literals.
    --no-fixed-strings # Treat all patterns as literals.
    --follow(-L) # Follow symbolic links.
    --no-follow # Follow symbolic links.
    --generate: string@"nu-complete rg generate" # Generate man pages and completion scripts.
    --glob(-g): string # Include or exclude file paths.
    --glob-case-insensitive # Process all glob patterns case insensitively.
    --no-glob-case-insensitive # Process all glob patterns case insensitively.
    --glob-not(-G): string # Exclude files and directories matching GLOB.
    --heading # Print matches grouped by each file.
    --no-heading # Print matches grouped by each file.
    --help(-h) # Show help output.
    --hidden(-.) # Search hidden files and directories.
    --no-hidden # Search hidden files and directories.
    --hostname-bin: string # Run a program to get this system's hostname.
    --hyperlink-format: string@"nu-complete rg hyperlink-format" # Set the format of hyperlinks.
    --iglob: string # Include/exclude paths case insensitively.
    --ignore-case(-i) # Case insensitive search.
    --ignore-file: path # Specify additional ignore files.
    --ignore-file-case-insensitive # Process ignore files case insensitively.
    --no-ignore-file-case-insensitive # Process ignore files case insensitively.
    --in: path # Read paths to search from the given text file.
    --in0: path # Read paths to search from the given binary file.
    --include-zero # Include zero matches in summary output.
    --no-include-zero # Include zero matches in summary output.
    --invert-match(-v) # Invert matching.
    --no-invert-match # Invert matching.
    --json # Show search results in a JSON Lines format.
    --no-json # Show search results in a JSON Lines format.
    --line-buffered # Force line buffering.
    --no-line-buffered # Force line buffering.
    --line-number(-n) # Show line numbers.
    --no-line-number(-N) # Suppress line numbers.
    --line-regexp(-x) # Show matches surrounded by line boundaries.
    --max-bytes: string # Limit the number of bytes examined.
    --max-columns(-M): string # Omit lines longer than this limit.
    --max-columns-preview # Show preview for lines exceeding the limit.
    --no-max-columns-preview # Show preview for lines exceeding the limit.
    --max-count(-m): string # Limit the number of matching lines.
    --max-depth(-d): string # Descend at most NUM directories.
    --max-filesize: string # Ignore files larger than NUM in size.
    --mmap # Search with memory maps when possible.
    --no-mmap # Search with memory maps when possible.
    --multiline(-U) # Enable searching across multiple lines.
    --no-multiline # Enable searching across multiple lines.
    --multiline-dotall # Make '.' match line terminators.
    --no-multiline-dotall # Make '.' match line terminators.
    --no-config # Never read configuration files.
    --no-ignore # Don't use ignore files.
    --ignore # Don't use ignore files.
    --no-ignore-dot # Don't use .ignore or .rgignore files.
    --ignore-dot # Don't use .ignore or .rgignore files.
    --no-ignore-exclude # Don't use local exclusion files.
    --ignore-exclude # Don't use local exclusion files.
    --no-ignore-files # Don't use --ignore-file arguments.
    --ignore-files # Don't use --ignore-file arguments.
    --no-ignore-global # Don't use global ignore files.
    --ignore-global # Don't use global ignore files.
    --no-ignore-messages # Suppress gitignore parse error messages.
    --ignore-messages # Suppress gitignore parse error messages.
    --no-ignore-parent # Don't use ignore files in parent directories.
    --ignore-parent # Don't use ignore files in parent directories.
    --no-ignore-vcs # Don't use ignore files from source control.
    --ignore-vcs # Don't use ignore files from source control.
    --no-messages # Suppress some error messages.
    --messages # Suppress some error messages.
    --no-require-git # Use .gitignore outside of git repositories.
    --require-git # Use .gitignore outside of git repositories.
    --no-unicode # Disable Unicode mode.
    --unicode # Disable Unicode mode.
    --null(-0) # Print a NUL byte after file paths.
    --null-data # Use NUL as a line terminator.
    --one-file-system # Skip directories on other file systems.
    --no-one-file-system # Skip directories on other file systems.
    --only-matching(-o) # Print only matched parts of a line.
    --path-separator: string # Set the path separator for printing paths.
    --passthru # Print both matching and non-matching lines.
    --pcre2(-P) # Enable PCRE2 matching.
    --no-pcre2 # Enable PCRE2 matching.
    --pcre2-version # Print the version of PCRE2 that ripgrep uses.
    --pre: string # Search output of COMMAND for each PATH.
    --no-pre # Search output of COMMAND for each PATH.
    --pre-glob: string # Include or exclude files from a preprocessor.
    --pretty(-p) # Alias for colors, headings and line numbers.
    --quiet(-q) # Do not print anything to stdout.
    --regex-size-limit: string # The size limit of the compiled regex.
    --replace(-r): string # Replace matches with the given text.
    --search-zip(-z) # Search in compressed files.
    --no-search-zip # Search in compressed files.
    --smart-case(-S) # Smart case search.
    --sort: string@"nu-complete rg sort" # Sort results in ascending order.
    --sortr: string@"nu-complete rg sortr" # Sort results in descending order.
    --stats # Print statistics about the search.
    --no-stats # Print statistics about the search.
    --stop-on-nonmatch # Stop searching after a non-match.
    --text(-a) # Search binary files as if they were text.
    --no-text # Search binary files as if they were text.
    --threads(-j): string # Set the approximate number of threads to use.
    --trace # Show trace messages.
    --trim # Trim prefix whitespace from matches.
    --no-trim # Trim prefix whitespace from matches.
    --type(-t): string@"nu-complete rg types" # Only search files matching TYPE.
    --type-not(-T): string@"nu-complete rg types" # Do not search files matching TYPE.
    --type-add: string # Add a new glob for a file type.
    --type-clear: string # Clear globs for a file type.
    --type-list # Show all supported file types.
    --unrestricted(-u) # Reduce the level of "smart" filtering.
    --version(-V) # Print ripgrep's version.
    --vimgrep # Print results in a vim compatible format.
    --with-filename(-H) # Print the file path with each matching line.
    --no-filename(-I) # Never print the path with each matching line.
    --word-regexp(-w) # Show matches surrounded by word boundaries.
    --auto-hybrid-regex # (DEPRECATED) Use PCRE2 if appropriate.
    --no-auto-hybrid-regex # (DEPRECATED) Use PCRE2 if appropriate.
    --no-pcre2-unicode # (DEPRECATED) Disable Unicode mode for PCRE2.
    --pcre2-unicode # (DEPRECATED) Disable Unicode mode for PCRE2.
    --sort-files # (DEPRECATED) Sort results by file path.
    --no-sort-files # (DEPRECATED) Sort results by file path.
  ]
}

export use completions *
