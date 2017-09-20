#!/bin/bash
if [[ $# -eq 0 ]]; then
    echo "USAGE: runall 1|2|..|7|all"
    exit 0
fi

if [ $1 == "1" ] || [ $1 == "all" ]; then
    echo "running q1 - DFS"
    python pacman.py -l tinyMaze -p SearchAgent
    python pacman.py -l mediumMaze -p SearchAgent
    python pacman.py -l bigMaze -z .5 -p SearchAgent
fi

if [ $1 == "2" ] || [ $1 == "all" ]; then
    echo "running q2-BFS"
    python pacman.py -l mediumMaze -p SearchAgent -a fn=bfs
    python pacman.py -l bigMaze -p SearchAgent -a fn=bfs -z .5
fi

if [ $1 == "3" ] || [ $1 == "all" ]; then
    echo "running q3-UCS"
    python pacman.py -l mediumMaze -p SearchAgent -a fn=ucs
    python pacman.py -l mediumDottedMaze -p StayEastSearchAgent
    python pacman.py -l mediumScaryMaze -p StayWestSearchAgent
fi

if [ $1 == "4" ] || [ $1 == "all" ]; then
    echo "running q4-A*"
    python pacman.py -l bigMaze -z .5 -p SearchAgent -a fn=astar,heuristic=manhattanHeuristic 
fi

if [ $1 == "5" ] || [ $1 == "all" ]; then
    echo "running q5-All Corners"
    python pacman.py -l tinyCorners -p SearchAgent -a fn=bfs,prob=CornersProblem
    python pacman.py -l mediumCorners -p SearchAgent -a fn=bfs,prob=CornersProblem
fi

if [ $1 == "6" ] || [ $1 == "all" ]; then
    echo "running q6- corners problem"
    python pacman.py -l mediumCorners -p AStarCornersAgent -z 0.5
fi

if [ $1 == "7" ] || [ $1 == "all" ]; then
    echo "running q7- food heuristics"
    python pacman.py -l testSearch -p AStarFoodSearchAgent
fi

echo "done!!"
