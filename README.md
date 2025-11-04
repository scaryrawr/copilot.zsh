# copilot.zsh

Zsh plugin for [GitHub Copilot CLI](https://github.com/features/copilot/cli/).

## Installation

### Oh My Zsh

Clone this repository into `~/.oh-my-zsh/custom/plugins/copilot`:

```zsh
git clone https://github.com/scaryrawr/copilot.zsh ~/.oh-my-zsh/custom/plugins/copilot
```

Then add `copilot` to your plugins in `~/.zshrc`:

```zsh
plugins=(... copilot)
```

### Manual

Clone this repository and source the plugin file:

```zsh
git clone https://github.com/scaryrawr/copilot.zsh ~/.zsh/copilot.zsh
echo 'source ~/.zsh/copilot.zsh/copilot.plugin.zsh' >> ~/.zshrc
```

### antidote

```zsh
antidote install scaryrawr/copilot.zsh
```

## Features

### Completions

Full command-line completions for the `copilot` command, including:

- All command-line options and flags
- Model selection (`--model`)
- Log levels (`--log-level`)
- Streaming options (`--stream`)
- Help topics
- Directory completions for `--add-dir` and `--log-dir`

### YOLO Mode

The `yopilot` function provides a convenient wrapper that runs Copilot in "YOLO mode" with all permissions enabled:

```zsh
yopilot
```

This is equivalent to:

```zsh
copilot --allow-all-tools --allow-all-paths
```

You can still pass additional arguments:

```zsh
yopilot -p "fix all the bugs"
yopilot --model gpt-5
```

## License

MIT
