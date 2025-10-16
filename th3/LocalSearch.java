package th3;

import java.util.ArrayList;
import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;

public class LocalSearch {
	//dem tong xung dot ngang
	public int checkHorizontal(Node node) {
		int conflicts = 0; // khoi tao xung dot
		for (int i = 0; i < node.n; i++) {
			for (int j = 0; j < node.n; j++) {
				if(node.state.get(i).equals(node.state.get(j))) { // 
					conflicts++;
				}
			}
		}
		return conflicts;
	}
	//dem tong xung dot cheo
	public int checkDiagonal(Node node) {
		int conflicts =0;
		for (int i = 0; i < node.n; i++) {
			for (int j = 0; j < node.n; j++) {
				   if (Math.abs(node.state.get(i) - node.state.get(j)) == Math.abs(i-j)) {
					   conflicts++;
				   }
			}
		}
		return conflicts;
	}
	// tong xung dot
	public int heuristic(Node node) {
		return checkHorizontal(node) + checkDiagonal(node);
	}
	//thu doi quan hoi tu vi tri y toi vi tri x
	public int tryMovingOneQueen(Node node, int x, int y) {
		List<Integer> newState = new ArrayList<Integer>(node.state);
		newState.set(y,x);
		Node newNode = new Node(node.n, newState);
		return heuristic(newNode);
		}
//sorted map
	public SortedMap<Integer,Node> generateNeighbours(Node node){
		SortedMap<Integer, Node> sMap   = new TreeMap<>();
		for (int i = 0; i < node.n; i++) {
			for(int j =0; j< node.n; j++) {
				if(i != node.state.get(j)) {
					List<Integer> newState = new ArrayList<Integer>(node.state);
					newState.set(i,j);
					Node newNode = new Node(node.n, newState);
					int h =  heuristic(newNode);
					sMap.put(h, newNode);
				}
			}
		}
		return sMap;
	}
	public void run()
	{
		Node initial = new Node(4); //hoặc 4,5,6,7
	if (heuristic(initial)==0) //goal
			{
				System.out.println(initial.state);
				return;
			}
			System.out.println("Initial state is: "+initial.state);
			Node node=initial;
			SortedMap<Integer,Node> neighbours= generateNeighbours(node);
			Integer bestHeuristic = neighbours.firstKey();
			while (bestHeuristic<heuristic(node))
			{
				node = neighbours.get(bestHeuristic);
				neighbours= generateNeighbours(node);
				bestHeuristic=neighbours.firstKey();
			}
			if (heuristic(node)==0)
			{
				System.out.println("Goal is: "+node.state);
			}
			else
	System.out.println("Cannot find goal state! Best state is: "+ node.state);
	}

}
