# Contributing to the SmartFarm Report

## Gitflow

- `main`: published submissions.
- `develop`: integration of approved changes.
- `feature/<scope>`: new sections or artifacts, created from `develop`.
- `fix/<scope>`: corrections, created from `develop`.
- `hotfix/<scope>`: urgent fixes to a published submission, created from `main` and also merged into `develop`.

Keep working branches focused and short-lived. Open a Pull Request to the appropriate target branch, request a review from another team member, and delete the branch after it is merged. Do not push directly to `main` or `develop`.

## Commits

Use Conventional Commits in English, following this format:

```text
type(optional-scope): short description
```

Keep the type, scope, and description in lowercase. Use a concise, specific description:

```text
docs: reorganize report sources
docs(chapter-iv): update architecture diagrams
fix: repair relative asset links
chore: update repository metadata
```

Common types include `feat`, `fix`, `docs`, `refactor`, `test`, `build`, `ci`, and `chore`. Mark breaking changes with `!` or a `BREAKING CHANGE:` footer.

## Report changes

- Keep chapters and sections in separate Markdown files under `report/`.
- Use numeric prefixes and `kebab-case` to preserve reading order.
- Store exported images in `report/assets/images/` and diagram sources in `report/assets/diagram-sources/`.
- Update relative links when moving or renaming files.
- Explain the purpose of the change and the checks performed in the Pull Request.
