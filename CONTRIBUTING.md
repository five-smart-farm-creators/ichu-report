# Contributing to the ICHU Project Report

## Branching

| Branch | Branch from | Merge into |
| --- | --- | --- |
| `feature/<short-description>` | `develop` | `develop` (pull request) |
| `bugfix/<short-description>` | `develop` | `develop` (pull request) |
| `release/vX.Y.Z` | `develop` | `main` and back into `develop`; tag `vX.Y.Z` on `main` |
| `hotfix/vX.Y.Z` | `main` | `main` and back into `develop`; tag `vX.Y.Z` on `main` |

- Use lowercase kebab-case for branch descriptions.
- Keep working branches focused and short-lived.
- Never commit directly to `main` or `develop`.
- Never open a pull request from `develop` to `main`; releases always go through `release/vX.Y.Z`.
- Do not use other branch prefixes such as `fix/`, `docs/`, `refactor/`, `chore/`, or `audit/`.
- Delete branches after merging.

## Commit messages

Write commit messages in English using [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/):

```text
<type>(<scope>): <summary>
```

- Use one of these types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, or `revert`.
- Use `feat` only for new functionality. Use `docs` for documentation and diagram changes, and `chore` for changelog, version, or maintenance changes.
- Write the summary in the imperative mood, starting with a lowercase letter and without a trailing period. The header must not exceed 72 characters.
- Use a scope in lowercase kebab-case that names the affected section or area. Allowed scopes: `front-matter`, `chapter-i`, `chapter-ii`, `chapter-iii`, `chapter-iv`, `chapter-v`, `chapter-vi`, `conclusions`, `bibliography`, `annexes`, `assets`.
- Do not use the default message of the GitHub web editor, such as `Update file.md`.
- Mark breaking changes with `!` after the type or scope, or with a `BREAKING CHANGE:` footer.

Valid examples:

```text
docs(chapter-iv): update architecture diagrams
fix(assets): repair relative image links
```

Invalid examples:

```text
(Docs): Add user personas
Update chapter02.md
feat: add controllers.
faet: add planning service
```

## Report changes

- Keep chapters and sections in separate Markdown files under `report/`.
- Use numeric prefixes and `kebab-case` file names to keep the reading order.
- Store exported images in `report/assets/images/` and diagram sources in `report/assets/diagram-sources/`.
- Update relative links when you move or rename files.

## Pull requests

- Open the pull request against the target branch from the [Branching](#branching) table.
- State the purpose of the change and the checks performed in the pull request description.
- Request review from another team member.

## Commit granularity

A commit is one complete logical change that can be described in a single sentence and leaves the project working.

| Too fine | Balanced | Too coarse |
| --- | --- | --- |
| One commit per folder or file (`feat: add commands models`, `feat: add events models`, ...) | `feat(iot-assets): add device aggregate with commands and events` | `feat: implement iot assets` (a whole bounded context) |
| Several consecutive typo commits | `docs(chapter-ii): add segment 1 interview analysis` | `docs: update report` |

- Code: a feature branch usually has 3 to 8 commits of roughly 3 to 10 files each, split by layer or use case (for example domain model, persistence, REST endpoints, tests).
- Documentation: one commit per complete artifact or section, not per paragraph and not per whole chapter.
- Group typo fixes with the section they belong to; a later round of fixes goes in a single `docs(<scope>): fix typos in <section>` commit.
- Before pushing a branch that only you use, squash local work-in-progress commits into logical commits. Never rewrite commits that are already published.
- The convention is enforced for commits created from 2026-11-07, when it was adopted; older history is kept unchanged.

## Enforcement

- After cloning, run once: `git config core.hooksPath .githooks`. The `commit-msg` hook rejects invalid messages locally.
- The `Git Flow checks` GitHub Actions workflow validates the branch name, the pull request target, and every commit message on pull requests to `main` and `develop`.
- Configure Git with your real name and the email linked to your GitHub account (`git config user.name` and `git config user.email`). `.mailmap` maps previously used alternative identities.

## Versioning

Report releases are tagged on `main` per deliverable, following [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html):

- `v0.1.0`: AV1
- `v0.2.0`: TB1
- `v0.3.0`: AV2
- `v1.0.0`: TB2
