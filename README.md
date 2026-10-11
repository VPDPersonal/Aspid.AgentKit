# Aspid.AgentKit

[Русская версия](README_RU.md)

Plugins and [Agent Skills](https://agentskills.io) that I use to develop my projects. They work in Claude Code as
plugins and in Codex, Cursor, Gemini CLI, GitHub Copilot and other agents as plain skills.

| Plugin | Skills | What it does |
|---|---|---|
| [asp-git](#asp-git) | `asp-branch`, `asp-commit`, `asp-pr` | Branch names, commits and pull requests in the style of my repositories |

## Install

### Claude Code: for one repository

Add this to the repository's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "aspid": {
      "source": { "source": "github", "repo": "VPDPersonal/Aspid.AgentKit" },
      "autoUpdate": true
    }
  },
  "enabledPlugins": {
    "asp-git@aspid": true
  }
}
```

A contributor trusts the folder once, and Claude Code adds the marketplace and loads the plugin. No install command is
needed. If the skills do not appear in the first session, run `/reload-plugins`.

### Claude Code: for all your projects

```
/plugin marketplace add VPDPersonal/Aspid.AgentKit
/plugin install asp-git@aspid
```

### Other agents

```sh
npx skills add VPDPersonal/Aspid.AgentKit
```

Add `-g` to install for the user instead of the project, `--skill asp-commit` to pick skills.
Update with `npx skills update`.

## asp-git

| Skill | Call it | What it does |
|---|---|---|
| `asp-branch` | loaded by the other two | Branch names: `<type>/<short-description>` with Conventional Commits types |
| `asp-commit` | `/asp-commit`, "commit", "push" | Commits only the files of the current session and pushes them in one shell call |
| `asp-pr` | `/asp-pr`, "open a PR" | Draft PR with a Conventional Commits title and a short body; updates, ready and merge |

In Claude Code the full names are `/asp-git:asp-commit` and so on. The short `/asp-commit` works while no other skill
has that name.

A repository can add its own rules for `asp-pr` in `.claude/asp-pr.md`: the list of scopes and labels, and a
`Review loop` section that turns on the loop with a review bot.

`asp-pr` needs the [GitHub CLI](https://cli.github.com) (`gh`). Stacked pull requests also need the
[gh-stack](https://github.com/github/gh-stack) extension and its skill. Screenshots in the PR body need `gh` 2.99 or
newer: it uploads them with `--attach`.

In the Claude Code desktop app, PR events wake the session during the review loop. In other places, `asp-pr` waits
for the bot verdict for up to 20 minutes after each review request.

## License

MIT — see [LICENSE](LICENSE).
