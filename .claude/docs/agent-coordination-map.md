# Agent Coordination Map

## Hierarchy
```
User (Principal Data Scientist)
├── data-director
│   ├── data-engineering-lead
│   │   ├── pipeline-engineer
│   │   ├── streaming-engineer
│   │   ├── database-engineer
│   │   ├── data-integration-specialist
│   │   └── data-quality-engineer
│   ├── analytics-lead
│   │   ├── business-analyst
│   │   ├── data-analyst
│   │   ├── experiment-analyst
│   │   └── product-analyst
│   ├── data-governance-lead
│   │   ├── compliance-specialist
│   │   ├── security-engineer
│   │   └── testing-specialist
│   └── platform-lead
│       ├── cost-analyst
│       ├── performance-engineer
│       └── infrastructure-engineer (shared)
├── ml-director
│   ├── ml-engineering-lead
│   │   ├── model-developer
│   │   ├── nlp-specialist
│   │   ├── cv-specialist
│   │   ├── tabular-specialist
│   │   ├── timeseries-specialist
│   │   ├── recommender-specialist
│   │   └── deep-learning-engineer
│   ├── mlops-lead
│   │   ├── ml-deploy-engineer
│   │   ├── monitoring-engineer
│   │   ├── ml-pipeline-engineer
│   │   └── infrastructure-engineer (shared)
│   └── research-lead
│       ├── prompt-engineer
│       └── data-labeling-specialist
└── producer
    └── documentation-specialist
```

## Cross-Team Workflows
- **Schema change**: data-engineering-lead → ml-engineering-lead + analytics-lead
- **Model deployment**: ml-engineering-lead → mlops-lead → monitoring-engineer
- **Data incident**: monitoring-engineer → data-engineering-lead → data-quality-engineer
- **New data source**: data-director → data-governance-lead → data-engineering-lead
- **Experiment**: ml-engineering-lead → experiment-analyst → producer
