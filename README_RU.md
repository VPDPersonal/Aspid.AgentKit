<div align="center">

# Aspid.AgentKit

[Agent Skills](https://agentskills.io), с которыми я разрабатываю свои проекты

<sub>Claude Code · Codex · Cursor · Gemini CLI · GitHub Copilot · другие агенты</sub>

[![Agent Skills](https://img.shields.io/badge/Agent_Skills-compatible-blue)](https://agentskills.io)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](LICENSE)

[English](README.md) · **Русский**

</div>

## Наборы

| Набор | Что делает |
|---|---|
| [asp-git](#asp-git) | Ветки, коммиты и pull request'ы в стиле моих репозиториев |

## Установка

Каждый набор ставится отдельно, через [`npx skills`](https://github.com/vercel-labs/skills).

### В репозиторий

```sh
npx skills add VPDPersonal/Aspid.AgentKit/asp-git --copy
```

Закоммитьте копии: тогда скилы есть в каждом клоне и в каждом worktree без установки. Для обновления запустите
команду ещё раз и закоммитьте результат. Добавьте `-a claude-code`, чтобы скопировать скилы только для Claude Code.

### Для всех своих проектов

```sh
npx skills add VPDPersonal/Aspid.AgentKit/asp-git -g
```

Обновление: `npx skills update`.

## asp-git

| Скил | Что делает |
|---|---|
| `asp-branch` | Имена веток: `<type>/<short-description>`. Его загружают два других скила |
| `asp-commit` | Коммитит только файлы текущей сессии и пушит их |
| `asp-pr` | Черновик PR с коротким описанием Why / What; обновление, ready и мерж |

Вызывайте скил по имени, `/asp-pr`, или словами: «закоммить», «запушь», «открой пр».

### Что нужно

- [GitHub CLI](https://cli.github.com) (`gh`) для `asp-pr`, версия 2.99 или новее для скриншотов в описании PR.
- [gh-stack](https://github.com/github/gh-stack) и его скил для стэков PR.

### Правила репозитория

Репозиторий может добавить свои правила для `asp-pr` в `.claude/asp-pr.md`: список scope и меток и раздел
`Review loop`, который включает цикл с ревью-ботом. В десктопном приложении Claude Code события PR сами будят сессию
во время цикла. В других средах `asp-pr` ждёт каждый вердикт бота до 20 минут.

## Лицензия

[MIT](LICENSE)
