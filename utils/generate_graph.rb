def generate_acyclic_graph(total_nodes, max_depth)
    return {} if total_nodes == 0
  
    graph = {}
    current_id = 1
    queue = [[current_id, 0]]
    current_id += 1
  
    while !queue.empty? && current_id <= total_nodes
      parent, depth = queue.shift
      graph[parent] ||= []
  
      if depth < max_depth
        2.times do
          break if current_id > total_nodes
          graph[parent] << current_id
          queue << [current_id, depth + 1]
          current_id += 1
        end
      end
    end
  
    graph
  end



  def generate_cyclic_graph(total_nodes, max_depth)
    graph = generate_acyclic_graph(total_nodes, max_depth)
  
    leaf = (1..total_nodes).find { |n| !graph.key?(n) }
  
    graph[leaf] = [1] if leaf
  
    graph
  end
  








