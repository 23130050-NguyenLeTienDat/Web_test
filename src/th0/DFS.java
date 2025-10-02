package th0;

import java.util.HashSet;
import java.util.Set;
import java.util.Stack;

public class DFS {
	public void DFSUsingStack(Node initial, int goal) {
		if(initial == null) {
			System.out.println("Node is null");
		}
		Stack<Node> stack = new Stack<Node>();
		Set<Integer> visited = new HashSet<Integer>();
		stack.add(initial);
		visited.add(initial.state);
		while(!stack.isEmpty()) {
			Node node = stack.pop();
			if(node == null)continue;
			if(node.state == goal) {
				String s = "";
				while(node != null) {
					s= node.state + " " + s;
					node = node.parent;
				}
				System.out.println(initial.state + " " + s);
				return;
			}
			if(node.neighbours != null) {
				for(Node n : node.neighbours) {
					if(n != null && !visited.contains(n.state)) {
						visited.add(n.state);
						n.parent = node;
						stack.add(n);
					}
				}
			}
		}
		 System.out.println("Goal " + goal + " not found in the graph");
	}
}