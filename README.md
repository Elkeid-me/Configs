- **这是什么？**

  这是我自用的一些命令行工具的配置文件。

- **有哪些工具？**

  目前，有 Nushell、Starship、Helix、Zellij、Lazygit 和 PowerShell（7.x）。

  对于 Nushell 和 PowerShell，配置了一些工具的自动补全。

- **开箱即用吗？**

  是。

  ~~Nushell 配置了 Gemini CLI 的 Wrapper 脚本，用以加载 `http_proxy` 和 `https_proxy` 环境变量。但相关地址需要手动配置。当然，如果 WSL 的网络设置为 Mirrored，且启用 Localhost Loopback，则这两个环境变量会自动设置。~~ Gemini CLI 已经死了。

  配置了 `mix` 的 Wrapper 脚本，简化 Elixir 程序的 Release 编译。

Feel free to use.
