# A* Search in Prolog for Document Retrieval  

A demo of heuristic-driven search optimized for **hierarchical knowledge bases**  

## Features  
- **Customizable heuristic** for domain-specific prioritization  
- **Efficient frontier management** with predicate sorting  
- **Works with any Prolog KB** (see `example_kb.pl`)  

## Quick Start  
1. Install [SWI-Prolog](https://www.swi-prolog.org/).  
2. Clone this repo.  
3. Run queries:  
```prolog  
?- [src/astar].  
?- astar([home], Path, Cost, kb_example).  % Try your own start/goal  
```  

## Use Cases  
- **Fraud detection**: Map relationships between suspicious entities  
- **Doc retrieval**: Navigate enterprise knowledge graphs  

*Academic project @ Trinity College. Heuristic tunable for specific domains.*  
