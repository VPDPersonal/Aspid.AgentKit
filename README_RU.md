# Aspid.AgentKit

[English version](README.md)

Плагины и [Agent Skills](https://agentskills.io), с которыми я разрабатываю свои проекты. В Claude Code они работают как
плагины, а в Codex, Cursor, Gemini CLI, GitHub Copilot и других агентах — как обычные скилы.

| Плагин | Скилы | Что делает |
|---|---|---|
| [asp-git](#asp-git) | `asp-branch`, `asp-commit`, `asp-pr` | Имена веток, коммиты и pull request'ы в стиле моих репозиториев |

## Установка

### Claude Code: для одного репозитория

Добавьте в `.claude/settings.json` репозитория:

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

Контрибьютор один раз доверяет папке, и Claude Code сам добавляет маркетплейс и загружает плагин. Команда установки не
нужна. Если в первой сессии скилов нет, выполните `/reload-plugins`.

### Claude Code: для всех своих проектов

```
/plugin marketplace add VPDPersonal/Aspid.AgentKit
/plugin install asp-git@aspid
```

### Другие агенты

```sh
npx skills add VPDPersonal/Aspid.AgentKit
```

Флаг `-g` ставит скилы для пользователя, а не для проекта, `--skill asp-commit` выбирает скилы.
Обновление: `npx skills update`.

## asp-git

| Скил | Как вызвать | Что делает |
|---|---|---|
| `asp-branch` | его загружают два других | Имена веток: `<type>/<short-description>` с типами Conventional Commits |
| `asp-commit` | `/asp-commit`, «закоммить», «запушь» | Коммитит только файлы текущей сессии и пушит одним вызовом shell |
| `asp-pr` | `/asp-pr`, «открой пр» | Черновик PR с заголовком по Conventional Commits и коротким описанием; обновление, ready и мерж |

В Claude Code полные имена — `/asp-git:asp-commit` и так далее. Короткое `/asp-commit` работает, пока нет другого скила
с таким именем.

Репозиторий может добавить свои правила для `asp-pr` в `.claude/asp-pr.md`: список scope и меток и раздел
`Review loop`, который включает цикл с ревью-ботом.

Для `asp-pr` нужен [GitHub CLI](https://cli.github.com) (`gh`). Для стэков PR — ещё расширение
[gh-stack](https://github.com/github/gh-stack) и его скил. Для скриншотов в описании PR нужен `gh` 2.99 или новее:
он загружает их через `--attach`.

В десктопном приложении Claude Code события PR сами будят сессию во время цикла ревью. В других средах `asp-pr` ждёт
вердикт бота до 20 минут после каждого запроса на ревью.

## Лицензия

MIT — см. [LICENSE](LICENSE).
