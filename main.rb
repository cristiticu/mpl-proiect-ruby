require './oo'
require './functional'

include ObjectOriented
include Functional

def timer(identifier)
    start_time = Time.now
    yield
    end_time = Time.now - start_time
    puts "#{identifier}: #{end_time}"
end

graph_with_cycle = generate_cyclic_graph(1000000, 10000)
graph_without_cycle = generate_acyclic_graph(1000000, 10000)

timer("Object Oriented") do
        ObjectOriented::run(graph_with_cycle) 
        ObjectOriented::run(graph_without_cycle) 
    end
timer("Functional") do 
        Functional::run(graph_with_cycle) 
        Functional::run(graph_without_cycle) 
    end