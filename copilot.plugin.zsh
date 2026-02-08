# copilot.zsh - Zsh plugin for GitHub Copilot CLI

# Add completions directory to fpath
0=${(%):-%x}
fpath=(${0:A:h} $fpath)

# YOLO mode function
yopilot() {
    copilot --yolo "$@"
}

copilot() {
    command copilot --disable-mcp-server github-mcp-server "$@"
}
