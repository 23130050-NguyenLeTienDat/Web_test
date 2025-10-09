package tuan1;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Stack;

public class DFS {
	public Node DFSUsingStack(Node initial, int goal) {
		if(initial == null) {
			System.out.println("Node is null");
			return null;
		}
		Stack<Node> stack = new Stack<Node>();
		stack.add(initial);
		while(!stack.isEmpty()) {
			Node node = stack.pop();
			if(node == null)continue;
			if(node.state.size()==goal) {
				String s = "";
				while(node != null) {
					s= node.state + " " + s;
					node = node.parent;
				}
				System.out.println(initial.state + " " + s);
				return node;
			}
			List<Node> neighbour = node.getNeighbours();
			if(neighbour != null) {
				for(Node n : neighbour) {
						n.parent = node;
						stack.add(n);
				}
			}
		}
		 System.out.println("Goal " + goal + " not found in the graph");
		 return null;
	}
}