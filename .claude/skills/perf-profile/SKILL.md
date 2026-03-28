---
name: Perf Profile
description: Profile and optimize performance of pipelines, models, or queries
---

# /perf-profile

## Purpose
Identify bottlenecks and recommend optimizations.

## Workflow
1. Identify component to profile
2. Set up instrumentation (cProfile, torch.profiler, EXPLAIN)
3. Run profiling
4. Analyze bottlenecks (CPU, memory, I/O, GPU)
5. Recommend optimizations
6. Generate benchmark report

## Agents Involved
- performance-engineer, deep-learning-engineer, database-engineer

## Inputs
- Component to profile

## Outputs
- Performance benchmark report
- Optimization recommendations
