# The Tree class was interesting, but it did not allow you to specify
# a new tree with a clean user interface. Let the initializer accept a
# nested structure with hashes and arrays. You should be able to
# specify a tree like this: {'grandpa' => { 'dad' => {'child 1' => {}, 'child
# 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }.

class Tree
    attr_accessor :children, :node_name

    def initialize(init_hash)
        key, value = init_hash.first
        @node_name = key
        @children = []
        unless value.empty?
            value.each do |child_pair|
                @children << Tree.new({child_pair[0] => child_pair[1]})
            end
        end
    end


    def visit_all(&block)
        visit &block
        children.each { |child| child.visit_all &block }
    end


    def visit(&block)
        block.call self
    end
end


init_hash = {'grandpa' => \
                {'dad' => \
                    {'child 1' => {}, \
                     'child 2' => {}}, \
                 'uncle' => \
                    {'child 3' => {}, \
                     'child 4' => {}}}}

tree = Tree.new(init_hash)
tree.visit_all {|node| puts node.node_name}
