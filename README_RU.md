# Aspid.AgentKit

[English version](README.md)

[Agent Skills](https://agentskills.io), с которыми я разрабатываю свои проекты. Они работают в Claude Code, Codex,
Cursor, Gemini CLI, GitHub Copilot и других агентах.

| Набор | Скилы | Что делает |
|---|---|---|
| [asp-git](#asp-git) | `asp-branch`, `asp-commit`, `asp-pr` | Имена веток, коммиты и pull request'ы в стиле моих репозиториев |

## Установка

Каждый набор ставится отдельно, через [`npx skills`](https://github.com/vercel-labs/skills).

### В репозиторий

```sh
npx skills add VPDPersonal/Aspid.AgentKit/asp-git --copy
```

Закоммитьте копии. Тогда скилы есть в каждом клоне и в каждом worktree без установки. Добавьте `-a claude-code`,
чтобы скопировать их только для Claude Code. Для обновления запустите команду ещё раз и закоммитьте результат.

### Для всех своих проектов

```sh
npx skills add VPDPersonal/Aspid.AgentKit/asp-git -g
```

Обновление: `npx skills update`.

## asp-git

| Скил | Как вызвать | Что делает |
|---|---|---|
| `asp-branch` | его загружают два других | Имена веток: `<type>/<short-description>` с типами Conventional Commits |
| `asp-commit` | `/asp-commit`, «закоммить», «запушь» | Коммитит только файлы текущей сессии и пушит одним вызовом shell |
| `asp-pr` | `/asp-pr`, «открой пр» | Черновик PR с заголовком по Conventional Commits и коротким описанием; обновление, ready и мерж |

Репозиторий может добавить свои правила для `asp-pr` в `.claude/asp-pr.md`: список scope и меток и раздел
`Review loop`, который включает цикл с ревью-ботом.

Для `asp-pr` нужен [GitHub CLI](https://cli.github.com) (`gh`). Для стэков PR — ещё расширение
[gh-stack](https://github.com/github/gh-stack) и его скил. Для скриншотов в описании PR нужен `gh` 2.99 или новее:
он загружает их через `--attach`.

В десктопном приложении Claude Code события PR сами будят сессию во время цикла ревью. В других средах `asp-pr` ждёт
вердикт бота до 20 минут после каждого запроса на ревью.

## Лицензия

MIT — см. [LICENSE](LICENSE).
