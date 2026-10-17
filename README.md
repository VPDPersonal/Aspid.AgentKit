<div align="center">

# Aspid.AgentKit

The [Agent Skills](https://agentskills.io) I use to develop my projects

<sub>Claude Code · Codex · Cursor · Gemini CLI · GitHub Copilot · other agents</sub>

[![Agent Skills](https://img.shields.io/badge/Agent_Skills-compatible-blue)](https://agentskills.io)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](LICENSE)

</div>

## Sets

| Set | What it does |
|---|---|
| [asp-git](#asp-git) | Branches, commits and pull requests in the style of my repositories |

## Install

Each set installs on its own, with [`npx skills`](https://github.com/vercel-labs/skills).

### Into a repository

```sh
npx skills add VPDPersonal/Aspid.AgentKit/asp-git --copy
```

Commit the copies: every clone and every worktree then has the skills, with no install step. To update, run the
command again and commit the result. Add `-a claude-code` to copy the skills only for Claude Code.

### For all your projects

```sh
npx skills add VPDPersonal/Aspid.AgentKit/asp-git -g
```

To update, run `npx skills update`.

## asp-git

| Skill | What it does |
|---|---|
| `asp-branch` | Branch names: `<type>/<short-description>`. The other two skills load it |
| `asp-commit` | Commits only the files of the current session and pushes them |
| `asp-pr` | Draft PR with a short Why / What body; update, ready and merge |

Call a skill by name, `/asp-pr`, or in plain words: "commit", "push", "open a PR".

### Requirements

- [GitHub CLI](https://cli.github.com) (`gh`) for `asp-pr`, version 2.99 or newer for screenshots in the PR body.
- [gh-stack](https://github.com/github/gh-stack) and its skill for stacked pull requests.

### Repository rules

A repository can add its own rules for `asp-pr` in `.claude/asp-pr.md`: the scopes, the labels and a `Review loop`
section that turns on the loop with a review bot. In the Claude Code desktop app, PR events wake the session during
the loop. In other places, `asp-pr` waits up to 20 minutes for each bot verdict.

## License

[MIT](LICENSE)
