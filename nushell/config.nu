# 缺失时，自动安装 Starship 补全脚本
if not ($nu.data-dir | path join "vendor" "autoload" "starship.nu" | path exists) {
    mkdir ($nu.data-dir | path join "vendor" "autoload")
    starship init nu | save -f ($nu.data-dir | path join "vendor" "autoload" "starship.nu")
}
