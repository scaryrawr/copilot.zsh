# Copilot Instructions

This is a Zsh plugin for GitHub Copilot CLI that provides shell completions and convenience functions.

## Architecture

The plugin consists of two files:
- `copilot.plugin.zsh` - Main plugin entry point that sets up fpath and defines shell functions (`copilot`, `yopilot`)
- `_copilot` - Zsh completion function that provides tab completion for all copilot CLI options

## Key Conventions

### Completion Function Structure
The `_copilot` completion function uses Zsh's `_arguments` completion system with state machines for dynamic completions (models, log levels, stream modes). Model names are dynamically extracted from `copilot --help` output at completion time, with a fallback static list.

### Plugin Loading
The plugin uses `0=${(%):-%x}` to get the script's path regardless of how it's sourced, then adds its directory to fpath for completion autoloading.

### Function Wrappers
Shell functions wrap the `copilot` command to provide default arguments (e.g., `yopilot` enables YOLO mode with `--allow-all-tools --allow-all-paths`).
