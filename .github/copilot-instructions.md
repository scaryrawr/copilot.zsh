# Copilot Instructions

This repository provides Fish and Zsh integrations for GitHub Copilot CLI.

## Architecture

- `copilot-completions.plugin.zsh` is the repository-name entry point used by
  Zsh plugin managers.
- `copilot.plugin.zsh` sets up the Zsh plugin, remains compatible with existing
  manual and Oh My Zsh installs, and adds the repository root to `fpath`.
- `_copilot` implements Zsh completion with `_arguments` state machines.
- `completions/copilot.fish` contains Fish completion definitions.
- `functions/copilot.fish` and `functions/yopilot.fish` are the public Fish
  wrappers.
- `functions/__fish_copilot_*.fish` dynamically complete models, agents,
  plugins, marketplaces, MCP servers, skills, and help topics.

The Fish and Zsh completion implementations are handwritten and shell-specific.
The live `copilot` help output is their shared source of truth.

## Conventions

### Zsh

- Use `_arguments` specifications and state machines.
- Keep `_copilot` at the repository root so it remains autoloadable through
  `fpath`.
- Use `0=${(%):-%x}` when resolving the sourced plugin path.

### Fish

- Keep Fisher-discovered files under `completions/` and `functions/`.
- Use one function per file and match the filename to the function name.
- Prefix private helpers with `__fish_copilot_`.
- Give every completion a description and disable file completion when paths
  are not valid arguments.

## Validation

```sh
zsh -n _copilot copilot.plugin.zsh copilot-completions.plugin.zsh
fish -n completions/copilot.fish
fish -n functions/*.fish
```
