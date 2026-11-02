# SmartFarm — Project Report

Repositorio fuente del informe del proyecto SmartFarm / ICHU para el curso Desarrollo de Soluciones IoT.

## Estructura

```text
report/
├── front-matter/       # Carátula, versiones, colaboración, índice y Student Outcome
├── 10-...md            # Capítulos en orden de lectura
├── 88-conclusions-and-recommendations.md
├── 99-bibliography.md
├── annexes/            # Anexos A–I separados por tema
└── assets/
    ├── images/         # Imágenes y diagramas renderizados
    └── diagram-sources/ # Fuentes PlantUML y Structurizr DSL
```

## Orden de lectura del informe

1. [Carátula](report/front-matter/01-cover.md)
2. [Registro de versiones](report/front-matter/02-version-history.md)
3. [Project Report Collaboration Insights](report/front-matter/03-collaboration-insights.md)
4. [Tabla de contenidos](report/front-matter/04-table-of-contents.md)
5. [Student Outcome](report/front-matter/05-student-outcome.md)
6. [Capítulo I — Introducción](report/10-introduction.md)
7. [Capítulo II — Requirements Elicitation & Analysis](report/20-requirements-elicitation-and-analysis.md)
8. [Capítulo III — Requirements Specification](report/30-requirements-specification.md)
9. [Capítulo IV — Solution Software Design](report/40-solution-software-design.md)
10. [Capítulo V — Solution UI/UX Design](report/50-solution-ui-ux-design.md)
11. [Capítulo VI — Product Implementation, Validation & Deployment](report/60-product-implementation-validation-and-deployment.md)
12. [Conclusiones y recomendaciones](report/88-conclusions-and-recommendations.md)
13. [Bibliografía](report/99-bibliography.md)
14. [Anexos](report/annexes/00-index.md)

## Flujo de trabajo

- `main` contiene la versión publicada para cada entrega.
- `develop` integra los cambios aprobados antes de su publicación.
- Cada cambio se trabaja en una rama temporal (`feature/<alcance>` o `fix/<alcance>`) creada desde `develop`.
- Los cambios llegan a `develop` mediante Pull Request; después de integrarlos, se elimina la rama temporal.
- Para una entrega, se integra `develop` en `main` mediante Pull Request. No se realizan commits directos a `main` ni a `develop`.

Consulta [CONTRIBUTING.md](CONTRIBUTING.md) para la convención de ramas, commits y revisión.

## Recursos generados

Las fuentes de diagramas se conservan junto con sus imágenes exportadas dentro de `report/assets/`. Los PDF y archivos temporales generados localmente se mantienen fuera del control de versiones en `output/` y `tmp/`.
