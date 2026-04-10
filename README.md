- **这是什么？**

  这是我自用的一些命令行工具的配置文件。

- **有哪些工具？**

  目前，有 Nushell、Starship、Helix 和 PowerShell（7.x）。

  对于 Nushell 和 PowerShell，配置了一些工具的自动补全。目前启用`dotnet`、`winget`、`git` `starship` 和 `uv` 的自动补全。

- **开箱即用吗？**

  不是。对于 Nushell，如果想要和 `starship` 配合使用，需要手动生成 `starship.init`。否则，请注释 `Nushell/config.nu` 的 `source ./starship-init.nu` 一行。

  Nushell 配置了 Gemini CLI 的 Wrapper 脚本，用以加载 `http_proxy` 和 `https_proxy` 环境变量。但相关地址需要手动配置。配置了 `icx` 和 `icpx` 的 Wrapper 脚本，用以简化编译 OpenCL 程序。配置了 `tlmgr-install` 脚本，在使用 TinyTeX 时可以简化安装缺失的宏包。

`Nushell/completions` 下除 `uv` 和 `starship` 的补全外，均来自 [nushell/nu_scripts](https://github.com/nushell/nu_scripts)

Feel free to use.
