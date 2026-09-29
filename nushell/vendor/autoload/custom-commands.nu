# 删除 Nushell 历史记录
def rm-history [] {
    rm $nu.history-path
}

# 更新补全脚本
def update-completions [--force] {
    let programs = do {
        cd ($nu.data-dir | path join "vendor" "autoload")
        ls | get name | parse "{program}-completion.nu" | get program
    }
    $programs |
        par-each {|program|
            let completion_script_path = $nu.data-dir |
                path join "vendor" "autoload" $"($program)-completion.nu"
            let completion_script_url = $"https://cdn.jsdelivr.net/gh/Elkeid-me/Configs@main/nushell/vendor/autoload/($program)-completion.nu"
            let no_proxy = if $env has no_proxy {
                $"($env.no_proxy),cdn.jsdelivr.net"
            } else {
                "cdn.jsdelivr.net"
            }
            let path_exists = $completion_script_path | path exists
            let up_to_date = if $path_exists {
                (date now) - (ls $completion_script_path | get 0.modified) < 1day
            } else {
                false
            }
            if ($force or not $path_exists or not $up_to_date) {
                print $"Updating completions script for ($program)..."
                with-env { no_proxy: $no_proxy } {
                    http get $completion_script_url | save --force $completion_script_path
                }
            }
        } | ignore
}

# Elixir 生产环境编译
def mix-build-release [] {
    with-env { MIX_ENV: prod } {
        ^mix release
    }
}

#  自动安装 TeX Live 缺失宏包
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

# 自动编译 LaTeX 文件，缺失宏包自动安装
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
