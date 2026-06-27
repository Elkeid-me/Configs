load-env {LANG: zh_CN.UTF-8}

if ((uname | get kernel-name) == Linux and ($env.WT_SESSION | is-not-empty)) {
    load-env {COLORTERM: truecolor}
}

$env.config.show_banner = false
$env.config.completions.algorithm = "fuzzy"
$env.config.highlight_resolved_externals = true
$env.config.color_config = {shape_external: red_bold,
                            shape_external_resolved: green_bold,
                            shape_internalcall: green_bold,
                            shape_externalarg: white}
$env.config.cursor_shape = {emacs: line}

let pnpm_completer = if (uname | get kernel-name) == Windows_NT {
    let pnpm_path = which ^pnpm.ps1
    if ($pnpm_path | is-empty) {
        {|_|}
    } else {
        let pnpm_path = $pnpm_path | get 0.path
        {|commandline: string|
            pwsh -NoLogo -NoProfile -File $pnpm_path completion-server -- $commandline | lines
        }
    }
} else {
    {|commandline: string|
        pnpm completion-server -- $commandline | lines
    }
}

let external_completer = {|spans: list<string>|
    match $spans.0 {
        dotnet | dotnet.exe => {
            dotnet complete ($spans | str join " ") | lines
        }
        winget | winget.exe => {
            let commandline = $spans | str join " "
            winget complete --commandline (
                $commandline
            ) --word (
                $spans | last
            ) --position (
                $commandline | str length
            ) | lines
        }
        pnpm | pnpm.cmd => {
            let commandline = $spans | str join " "
            let cursor = $commandline | str length
            with-env {
                SHELL: bash
                COMP_CWORD: ($spans | length)
                COMP_LINE: $commandline
                COMP_POINT: $cursor
            } {
                do $pnpm_completer $commandline
            }
        }
    }
}
$env.config.completions.external.completer = $external_completer

unlet $pnpm_completer
unlet $external_completer

source ./starship-init.nu
source ./completions/cargo-completion.nu
source ./completions/docker-completion.nu
source ./completions/git-completion.nu
source ./completions/make-completion.nu
source ./completions/mix-completion.nu
source ./completions/npm-completion.nu
source ./completions/rustup-completion.nu
source ./completions/ssh-completion.nu
source ./completions/starship-completion.nu
source ./completions/tar-completion.nu
source ./completions/uv-completion.nu
source ./completions/ya-completion.nu
source ./completions/yazi-completion.nu

def rm-history [] {
    rm $nu.history-path
}

def update-completions [] {
    [cargo docker git make mix npm rustup ssh starship tar uv ya yazi] |
        each {|program|
            print $"Updating completions script for ($program)..."
            let completion_script_path = $nu.default-config-dir |
                path join completions $"($program)-completion.nu"
            let completion_script_url = $"https://cdn.jsdelivr.net/gh/Elkeid-me/Configs@main/Nushell/completions/($program)-completion.nu"
            http get $completion_script_url | save --force $completion_script_path
        } | ignore
}

def mix-build-release [] {
    with-env { MIX_ENV: prod } {
        ^mix release
    }
}

def --wrapped opencode [...rest] {
    with-env {
        OPENCODE_ENABLE_EXA: true
        OPENCODE_EXPERIMENTAL_LSP_TOOL: true
        OPENCODE_DISABLE_LSP_DOWNLOAD: false
    } {
        ^opencode ...$rest
    }
}

def tlmgr-install [filename: string] {
    let query = ^tlmgr search --json --global --file $filename | lines |
        where {|item| $item !~ 'tlmgr\.pl: package repository .*' } |
        get 0 | from json | get files
    let package_name = $query | items {|package, files| [$package $files] } |
        where {|item|
            $item.1 | any {|item|
                let p = $item | path parse
                $filename == $"($p.stem).($p.extension)"
            }
        } | get 0 | get 0
    print $"Install Package: ($package_name)"
    ^tlmgr install $package_name | ignore
}

def compile-latex [path: string] {
    loop {
        let output_ = ^lualatex -halt-on-error -interaction=nonstopmode $path |
            lines | where {|item| $item | str starts-with "! LaTeX Error: File" }
        if ($output_ | is-empty) {
            break
        }
        let file_name = $output_ |
            parse "! LaTeX Error: File `{file_name}' not found." | get 0.file_name
        tlmgr-install $file_name
    }
}
