class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
    else
      insert_recursive(@root, value)
    end
  end

  def insert_recursive(node, value)
    if value < node.value
      if node.left.nil?
        node.left = Node.new(value)
      else
        insert_recursive(node.left, value)
      end
    elsif value > node.value
      if node.right.nil?
        node.right = Node.new(value)
      else
        insert_recursive(node.right, value)
      end
    end
  end

  def inorder_traversal(node = @root)
    return if node.nil?

    inorder_traversal(node.left)
    print "#{node.value} "
    inorder_traversal(node.right)
  end

  def preorder_traversal(node = @root)
    return if node.nil?

    print "#{node.value} "
    preorder_traversal(node.left)
    preorder_traversal(node.right)
  end

  def postorder_traversal(node = @root)
    return if node.nil?

    postorder_traversal(node.left)
    postorder_traversal(node.right)
    print "#{node.value} "
  end
end

tree = BinaryTree.new
tree.insert(5)
tree.insert(3)
tree.insert(8)
tree.insert(1)
tree.insert(4)

puts "Inorder traversal:"
tree.inorder_traversal
puts "\nPreorder traversal:"
tree.preorder_traversal
puts "\nPostorder traversal:"
tree.postorder_traversal
