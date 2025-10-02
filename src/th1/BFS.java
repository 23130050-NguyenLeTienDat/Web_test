package th1;

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
		Set<List<Integer>> visited = new HashSet<List<Integer>>();
		queue.add(initial);
		visited.add(initial.state);
		while(!queue.isEmpty()){
			Node node = queue.poll();
			if(node.state.equals(goal)){
			String s ="";
			while(node != null){
				s = node.state + " " + s;
				node = node.parent;
			}	
			System.out.println(initial.state + " " + s);
			return node;
			}
			if (node.neighbours != null) {
				for (Node n : node.neighbours) {
					if (n == null) continue;
					if(!visited.contains(n.state)) {
						visited.add(n.state);
						n.parent = node;
						queue.add(n);
					}
				}
			}
		}
		System.out.println("Goal not found");
		return null;
	}
}