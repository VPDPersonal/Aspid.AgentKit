# Aspid.AgentKit

[Русская версия](README_RU.md)

[Agent Skills](https://agentskills.io) that I use to develop my projects. They work in Claude Code, Codex, Cursor,
Gemini CLI, GitHub Copilot and other agents.

| Set | Skills | What it does |
|---|---|---|
| [asp-git](#asp-git) | `asp-branch`, `asp-commit`, `asp-pr` | Branch names, commits and pull requests in the style of my repositories |

## Install

Each set installs on its own, with [`npx skills`](https://github.com/vercel-labs/skills).

### Into a repository

```sh
npx skills add VPDPersonal/Aspid.AgentKit/asp-git --copy
```

Commit the copies. Every clone and every worktree then has the skills, with no install step. Add `-a claude-code`
to copy them only for Claude Code. To update, run the command again and commit the result.

### For all your projects

```sh
npx skills add VPDPersonal/Aspid.AgentKit/asp-git -g
```

Update with `npx skills update`.

## asp-git

| Skill | Call it | What it does |
|---|---|---|
| `asp-branch` | loaded by the other two | Branch names: `<type>/<short-description>` with Conventional Commits types |
| `asp-commit` | `/asp-commit`, "commit", "push" | Commits only the files of the current session and pushes them in one shell call |
| `asp-pr` | `/asp-pr`, "open a PR" | Draft PR with a Conventional Commits title and a short body; updates, ready and merge |

A repository can add its own rules for `asp-pr` in `.claude/asp-pr.md`: the list of scopes and labels, and a
`Review loop` section that turns on the loop with a review bot.

`asp-pr` needs the [GitHub CLI](https://cli.github.com) (`gh`). Stacked pull requests also need the
[gh-stack](https://github.com/github/gh-stack) extension and its skill. Screenshots in the PR body need `gh` 2.99 or
newer: it uploads them with `--attach`.

In the Claude Code desktop app, PR events wake the session during the review loop. In other places, `asp-pr` waits
for the bot verdict for up to 20 minutes after each review request.

## License

MIT — see [LICENSE](LICENSE).
