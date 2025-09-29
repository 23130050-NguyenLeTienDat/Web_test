package tuan1;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;

import tuan1.Node;

public class BFS {
	public void bfsUsingQueue(Node initial, int goal) {
		if( initial == null) {
			System.out.println("Node is null");
			return;
		}
		Queue<Node> queue = new LinkedList<>();
		Set<Integer> visited = new HashSet<>();
		queue.add(initial);
		visited.add(initial.state);
		while(!queue.isEmpty()){
			Node node = queue.poll();
			if(node.state == goal){
			String s ="";
			while(node != null){
				s = node.state + " " + s;
				node = node.parent;
			}	
			System.out.println(initial.state + " " + s);
			return;
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
	}
}
