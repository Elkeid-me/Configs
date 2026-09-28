if (which ^rustup | is-not-empty) {
    load-env {
        RUSTUP_DIST_SERVER: "https://mirrors.tuna.tsinghua.edu.cn/rustup"
    }
}

$env.config.show_banner = false
$env.config.completions.algorithm = "fuzzy"
$env.config.highlight_resolved_externals = true
$env.config.color_config = {shape_external: red_bold,
                            shape_external_resolved: green_bold,
                            shape_internalcall: green_bold,
                            shape_externalarg: white}
$env.config.cursor_shape = {emacs: line}
