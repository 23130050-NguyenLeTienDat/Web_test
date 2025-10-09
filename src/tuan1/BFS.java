package tuan1;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Set;

public class BFS {
	public Node bfsUsingQueue(Node initial, int goal) {
		if( initial == null) {
			System.out.println("Node is null");
			return null;
		}
		Queue<Node> queue = new LinkedList<>();
		queue.add(initial);
		while(!queue.isEmpty()){
			Node node = queue.poll();
			if(node.state.size() == goal){
			String s ="";
			while(node != null){
				s = node.state + " " + s;
				node = node.parent;
			}	
			System.out.println(initial.state + " " + s);
			return node;
			}
			List<Node> neighbour = node.getNeighbours();
			if (neighbour != null) {
				for (Node n : neighbour) {
						n.parent = node;
						queue.add(n);
				}
			}
		}
		System.out.println("Goal not found");
		return null;
	}
}