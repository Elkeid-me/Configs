# Linux/macOS 配置
do --env {
    let kernel_name = uname | get kernel-name
    if $kernel_name != Windows_NT {
        load-env {LANG: zh_CN.UTF-8}
    }

    # WSL + Windows Terminal 下启用 truecolor
    if ($kernel_name == Linux and $env has WT_SESSION) {
        load-env {COLORTERM: truecolor}
    }
}
