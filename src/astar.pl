% A* Search Algorithm in Prolog  
% Purpose: Optimal pathfinding for hierarchical knowledge bases  
% Usage: Run queries against example_kb.pl  
% Heuristic: Customizable for document retrieval/enterprise use cases  

% Main predicates:  
% - arc/4, heuristic/2, astar/4  
% - Sample query: astar([start], Path, Cost, kb_example).



arc([H|T], Node, Cost, KB) :-
    member([H|B], KB),
    append(B, T, Node),
    length(B, L),
    Cost is 1 + L / (L + 1).

heuristic(Node, H) :-
    length(Node, H).

goal([]).

add2frontier(Children, Frontier, NewFrontier) :-
    append(Children, Frontier, Temp),
    predsort(compare_paths, Temp, NewFrontier).

sort_paths(Paths, Sorted) :-
    predsort(compare_paths, Paths, Sorted).

compare_paths(Delta, [Node1, Cost1, _], [Node2, Cost2, _]) :-
    heuristic(Node1, H1), heuristic(Node2, H2),
    F1 is Cost1 + H1, F2 is Cost2 + H2,
	compare(Delta, F1, F2).

astar(Node, Path, Cost, KB) :-
    search([[Node, 0, [Node]]], Path, Cost, KB).

search([[Node, Cost, Path]|_], Path, Cost, _) :-
    goal(Node).

search([[Node, Cost, Path]|More], FinalPath, FinalCost, KB) :-
    findall([Child, NewCost, PathExtended], 
            (arc(Node, Child, StepCost, KB), NewCost is Cost + StepCost,
             append(Path, [Child], PathExtended)), 
            Children),
    add2frontier(Children, More, NewFrontier),
    search(NewFrontier, FinalPath, FinalCost, KB).