require 'set'
require './utils/generate_graph.rb'

module ObjectOriented
  class Graph
    def initialize(adj_list)
      @graph = adj_list
      @visited = Set.new
      @stack = Set.new
    end
  
    def has_cycle?
      @graph.keys.each do |node|
        return true if visit(node)
      end
  
      false
    end
  
    private
  
    def visit(node)
      return true if @stack.include?(node)
      return false if @visited.include?(node)
  
      @visited.add(node)
      @stack.add(node)
  
      neighbors = @graph[node] || []
      for neighbor in neighbors
        return true if visit(neighbor)
      end
  
      @stack.delete(node)
  
      false
    end
  end
  
  def run(graph)
    Graph.new(graph).has_cycle?
  end  
end


