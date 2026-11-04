# SmartFarm — Project Report

Source repository for the SmartFarm / ICHU project report for the IoT Solutions Development course.

## Repository structure

```text
report/
├── front-matter/       # Cover, version history, collaboration, contents, and Student Outcome
├── 10-...md            # Chapters in reading order
├── 88-conclusions-and-recommendations.md
├── 99-bibliography.md
├── annexes/            # Appendices A–I organized by topic
└── assets/
    ├── images/         # Rendered images and diagrams
    └── diagram-sources/ # PlantUML and Structurizr DSL sources
```

## Report reading order

1. [Cover page](report/front-matter/01-cover.md)
2. [Version history](report/front-matter/02-version-history.md)
3. [Project Report Collaboration Insights](report/front-matter/03-collaboration-insights.md)
4. [Table of contents](report/front-matter/04-table-of-contents.md)
5. [Student Outcome](report/front-matter/05-student-outcome.md)
6. [Chapter I — Introduction](report/10-introduction.md)
7. [Chapter II — Requirements Elicitation & Analysis](report/20-requirements-elicitation-and-analysis.md)
8. [Chapter III — Requirements Specification](report/30-requirements-specification.md)
9. [Chapter IV — Solution Software Design](report/40-solution-software-design.md)
10. [Chapter V — Solution UI/UX Design](report/50-solution-ui-ux-design.md)
11. [Chapter VI — Product Implementation, Validation & Deployment](report/60-product-implementation-validation-and-deployment.md)
12. [Conclusions and recommendations](report/88-conclusions-and-recommendations.md)
13. [Bibliography](report/99-bibliography.md)
14. [Appendices](report/annexes/00-index.md)

## Workflow

- `main` contains the published version for each submission.
- `develop` integrates approved changes before publication.
- Work on each change in a short-lived branch (`feature/<scope>` or `fix/<scope>`) created from `develop`.
- Submit changes to `develop` through a Pull Request. Delete the working branch after it is merged.
- For each submission, merge `develop` into `main` through a Pull Request. Do not commit directly to `main` or `develop`.

See [CONTRIBUTING.md](CONTRIBUTING.md) for branch, commit, and review conventions.

## Generated resources

Diagram sources are stored alongside their exported images in `report/assets/`. Locally generated PDFs and temporary files are kept outside version control in `output/` and `tmp/`.
