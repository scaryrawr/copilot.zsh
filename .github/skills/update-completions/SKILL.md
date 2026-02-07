---
name: update-completions
description: >-
  Update the Zsh completion function (_copilot) to match the current copilot CLI
  interface. Use this skill when the user asks to update, refresh, or sync
  completions, or when new copilot CLI options, commands, or models need to be
  added to the completion file.
compatibility: Requires copilot CLI installed and available in PATH
---

# Update Completions

This skill updates the `_copilot` Zsh completion file to reflect the current
`copilot` CLI interface.

## Steps

1. **Gather current CLI help output.** Run these commands and capture the output:

   ```sh
   copilot --help
   copilot help config
   copilot help commands
   copilot help environment
   copilot help logging
   copilot help permissions
   copilot plugin --help
   copilot plugin marketplace --help
   copilot login --help
   copilot init --help
   ```

2. **Compare with `_copilot`.** Read the `_copilot` completion file and compare
   it against the help output. Identify:
   - New, removed, or renamed **flags/options** (the `options` array)
   - New, removed, or renamed **subcommands** (the `commands` array and
     subcommand dispatch in the `args` case)
   - New, removed, or renamed **help topics** (the `help_topics` array)
   - New or removed **models** (the fallback `models` array)
   - Changes to **log levels** or **stream modes**
   - New or changed **plugin subcommands**
   - New or changed **login options**

3. **Update `_copilot`.** Apply minimal, surgical edits to bring the completion
   file in sync. Preserve the existing code style:
   - Options use Zsh `_arguments` spec format:
     `'--flag-name[Description]:arg-name:completer'`
   - Repeatable options are prefixed with `'*'`
   - Short/long pairs use `'(-s --long)'{-s,--long}'[Desc]'` syntax
   - Subcommand arrays use `'name:Description'` format
   - Model entries use `'model-id:Display Name'` format

4. **Update `copilot.plugin.zsh` if needed.** If new wrapper functions or fpath
   changes are warranted by CLI changes, update the plugin file too.

5. **Verify.** After editing, read back the modified file(s) to confirm the
   changes are syntactically correct and consistent with the surrounding code.

## Important Notes

- The `_copilot__models_from_help` function dynamically extracts models from
  `copilot --help` at completion time. The static `models` array is only a
  **fallback** — update it to stay reasonably current but do not remove the
  dynamic extraction logic.
- Do **not** remove or alter the `_copilot__installed_plugins`,
  `_copilot__marketplaces`, `_copilot__browsable_plugins`, or
  `_copilot__installable_plugins` helper functions unless the CLI changes
  require it. These provide live dynamic completions.
- Keep the guard at the bottom: `if (( $+compstate )); then _copilot "$@"; fi`
