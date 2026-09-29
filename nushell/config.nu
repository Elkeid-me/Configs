if ((which ^starship | is-not-empty) and
    not ($nu.data-dir | path join "vendor" "autoload" "starship-init.nu" | path exists)) {
    mkdir ($nu.data-dir | path join "vendor" "autoload")
    starship init nu | save -f ($nu.data-dir | path join "vendor" "autoload" "starship-init.nu")
}
