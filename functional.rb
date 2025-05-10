require 'set'
require './utils/generate_graph.rb'

module Functional

def has_cycle?(graph)
  graph.keys.any? do |node|
    dfs(graph, node, Set.new, Set.new)
  end
end

def dfs(graph, node, visited, stack)
  return true if stack.include?(node)
  return false if visited.include?(node)

  new_visited = visited + [node]
  new_stack = stack + [node]
  neighbors = graph.fetch(node, [])

  neighbors.map do |neighbor|
    dfs(graph, neighbor, new_visited, new_stack)
  end.any? 
end

def run(graph)
  has_cycle?(graph)
end  

end

