---
name: update-completions
description: >-
  Update the Fish and Zsh completion implementations to match the current
  Copilot CLI interface. Use when asked to update, refresh, or sync completions,
  or when CLI options, commands, models, or help topics change.
compatibility: Requires copilot CLI, fish, and zsh
---

# Update Completions

Update `_copilot`, `completions/copilot.fish`, and any affected dynamic Fish
helpers from the same live CLI help capture.

## Gather the current CLI surface

Capture these commands:

```sh
copilot --help
copilot help
copilot help config
copilot help commands
copilot help environment
copilot help logging
copilot help monitoring
copilot help permissions
copilot help providers
copilot app --help
copilot completion --help
copilot init --help
copilot login --help
copilot mcp --help
copilot mcp add --help
copilot mcp get --help
copilot mcp list --help
copilot mcp remove --help
copilot plugin --help
copilot plugin install --help
copilot plugin list --help
copilot plugin marketplace --help
copilot plugin marketplace add --help
copilot plugin marketplace browse --help
copilot plugin marketplace list --help
copilot plugin marketplace remove --help
copilot plugin marketplace update --help
copilot plugin uninstall --help
copilot plugin update --help
copilot plugins --help
copilot skill --help
copilot update --help
copilot version --help
```

Run help for every subcommand advertised by `copilot plugins --help` and
`copilot skill --help`. Run `copilot help <topic>` for any help topics not
listed above. Treat the live output as authoritative.

## Update both implementations

Compare the captured interface against:

- `_copilot`
- `completions/copilot.fish`
- `functions/__fish_copilot_*.fish`

Keep options, aliases, commands, help topics, models, log levels, reasoning
efforts, stream modes, plugin commands, login modes, and dynamic argument
helpers aligned.

For Zsh:

- Use `_arguments` specifications.
- Prefix repeatable options with `*`.
- Use exclusion groups for aliases or mutually exclusive options.
- Preserve dynamic model, plugin, and marketplace helpers.
- Keep the completion-context guard at the bottom of `_copilot`.

For Fish:

- Use `-x` for exclusive arguments, `-r` for required arguments, and `-f` when
  file completion is inappropriate.
- Give every completion a `-d` description.
- Keep private dynamic helpers under `functions/__fish_copilot_*.fish`.
- Update fallback models in `functions/__fish_copilot_models.fish`.

Do not introduce a shared completion schema or generator. Each shell should
remain idiomatic.

## Verify

```sh
zsh -n _copilot copilot.plugin.zsh
fish -n completions/copilot.fish
fish -n functions/*.fish
fish -c 'source completions/copilot.fish
complete -C"copilot --mo"
complete -C"copilot help "
complete -C"copilot mcp "
complete -C"copilot plugin marketplace "'
```

Read back every modified file and confirm both shells represent the same live
CLI surface.
