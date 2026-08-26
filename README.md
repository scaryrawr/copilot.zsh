# Copilot shell plugins

Fish and Zsh completions and convenience functions for
[GitHub Copilot CLI](https://github.com/features/copilot/cli/).

## Zsh installation

### Oh My Zsh

Clone this repository into `~/.oh-my-zsh/custom/plugins/copilot`:

```zsh
git clone https://github.com/scaryrawr/copilot-completions ~/.oh-my-zsh/custom/plugins/copilot
```

Then add `copilot` to your plugins in `~/.zshrc`:

```zsh
plugins=(... copilot)
```

### Manual

Clone this repository and source the plugin file:

```zsh
git clone https://github.com/scaryrawr/copilot-completions ~/.zsh/copilot.zsh
echo 'source ~/.zsh/copilot.zsh/copilot.plugin.zsh' >> ~/.zshrc
```

### antidote

```zsh
antidote install scaryrawr/copilot-completions
```

## Fish installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install scaryrawr/copilot-completions
```

Existing `scaryrawr/copilot.fish` users can migrate with:

```fish
fisher remove scaryrawr/copilot.fish
fisher install scaryrawr/copilot-completions
```

## Features

### Completions

Full command-line completions for `copilot`, including:

- Command-line options, commands, and aliases
- Dynamic model, plugin, marketplace, MCP server, skill, and agent values
- Log levels, reasoning effort levels, and streaming modes
- File and directory arguments

### YOLO mode

The `yopilot` function runs Copilot with all permissions enabled:

```sh
yopilot
```

This is equivalent to:

```sh
copilot --yolo
```

Additional arguments are forwarded to Copilot:

```sh
yopilot -p "fix all the bugs"
yopilot --model gpt-5.6-sol
```

## Development

Validate both shell integrations after making changes:

```sh
zsh -n _copilot copilot.plugin.zsh copilot-completions.plugin.zsh
fish -n completions/copilot.fish
fish -n functions/*.fish
```

## License

MIT
