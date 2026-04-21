# config.nu
#
# Installed by:
# version = "0.111.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

load-env {LANG: zh_CN.UTF-8}

# Enable Gemini CLI's true color in WSL when using Windows Terminal.
if ($env | get --optional wt_session | is-not-empty) and (uname).kernel-name == Linux {
    load-env {colorterm: truecolor}
}

$env.config.show_banner = false
$env.config.completions.algorithm = "fuzzy"
$env.config.highlight_resolved_externals = true
$env.config.color_config = {shape_external: red_bold,
                            shape_external_resolved: green_bold,
                            shape_internalcall: green_bold,
                            shape_externalarg: white}
$env.config.cursor_shape = {emacs: line}
let external_completer = { |spans: list<string>|
    match $spans.0 {
        dotnet | dotnet.exe => {
            dotnet complete (
                $spans | skip 1 | str join " "
            ) | lines
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
        # pnpm | pnpm.cmd => {
        #     let commandline = $spans | str join " "
        #     let cursor = $commandline | str length
        #     with-env {
        #         SHELL: bash
        #         COMP_CWORD: ($spans | length)
        #         COMP_LINE: $commandline
        #         COMP_POINT: $cursor
        #     } {
        #         let pnpm_path = # path to pnpm.cjs
        #         node $pnpm_path completion-server -- $commandline | lines
        #     }
        # }
    }
}
$env.config.completions.external.completer = $external_completer

source ./starship-init.nu
# source ./completions/as-completion.nu
# source ./completions/cargo-completion.nu
# source ./completions/curl-completion.nu
source ./completions/git-completion.nu
# source ./completions/make-completion.nu
# source ./completions/mix-completion.nu
# source ./completions/npm-completion.nu
# source ./completions/rustup-completion.nu
# source ./completions/ssh-completion.nu
# source ./completions/tar-completion.nu
source ./completions/uv-completion.nu
source ./completions/starship-completion.nu

# def mix-build-release [] {
#     with-env { MIX_ENV: prod } {
#         mix release
#     }
# }

def --wrapped gemini [...rest] {
    if ($env | get --optional http_proxy | is-not-empty) {
        with-env {
            NODE_NO_WARNINGS: 1,
        } {
            ^gemini.cmd ...$rest
        }
    } else {
        with-env {
            # http_proxy:  set your proxy here, e.g. http://127.0.0.1:7890
            # https_proxy: set your proxy here, e.g. http://127.0.0.1:7890
            NODE_NO_WARNINGS: 1,
        } {
            ^gemini.cmd ...$rest
        }
    }
}

# def --wrapped icx [...rest] {
#     let base_path = which ^icx | get 0.path | path dirname --num-levels 2
#     let include_path = $base_path | path join include
#     let lib_path = $base_path | path join lib
#     ^icx ...$rest /I $include_path /link $"/libpath:($lib_path)" OpenCL
# }

# def --wrapped icpx [...rest] {
#     let base_path = which ^icpx | get 0.path | path dirname --num-levels 2
#     let include_path = $base_path | path join include
#     let lib_path = $base_path | path join lib
#     ^icpx ...$rest -I $include_path -L $lib_path -l OpenCL
# }

# def tlmgr-install [filename: string] {
#     let query = tlmgr search --json --global --file $filename | lines |
#         where {|item| $item !~ 'tlmgr\.pl: package repository .*' } |
#         get 0 | from json | get files
#     let package_name = $query | items {|package, files| [$package $files] } |
#         where {|item|
#             $item.1 | any {|item|
#                 let p = $item | path parse
#                 $filename == $"($p.stem).($p.extension)"
#             }
#         } | get 0 | get 0
#     print $"安装 ($package_name)"
#     tlmgr install $package_name | ignore
# }
