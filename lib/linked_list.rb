class Node
  attr_accessor :value, :next_node
  def initialize(value)
    @value = value
  end
end

first = Node.new(37)
first.next_node = Node.new(50)
first.next_node.next_node = Node.new(99)
first.next_node.next_node.next_node = Node.new(3)

class LinkedList
  def initialize(value)
    node = Node.new(value)
    @head = node
    @tail = node
  end

  def append(value)
    @tail.next_node = Node.new(value)
    @tail = @tail.next_node
  end

  def prepend(value)
    new_head = Node.new(value)
    new_head.next_node = @head
    @head = new_head
  end

  def to_s(node=@head)
    return node.value if node.next_node.nil?
    return "#{node.value} > #{to_s(node.next_node)}"
  end

  def length(node=@head)
    return 1 if node.next_node.nil?
    return 1 + length(node.next_node)
  end

  def find(value,node=@head)
    return node if node.value == value
    return nil if node.next_node.nil?
    find(value, node.next_node)
  end

  def insert_after(before_value, new_value)
    if @tail.value == before_value
      append(new_value)
    else
      before_node = find(before_value)
      hold_this = before_node.next_node
      new_node = Node.new(new_value)
      before_node.next_node = new_node
      new_node.next_node = hold_this
    end
  end

  def delete(value)
    before_node = find_previous_node(value)
    if before_node.nil?
      swap = @head.next_node
      @head.next_node = nil
      @head = swap
    else
      before_node.next_node = before_node.next_node.next_node
    end
  end

  def find_previous_node(value,node=@head)
    return nil if @head.value == value
    return node if node.next_node.value == value
    find_previous_node(value, node.next_node)
  end

  def reverse
    node = @head
    array_of_nodes = [node]
    while !node.next_node.nil?
      array_of_nodes << node.next_node
      node = node.next_node
    end

    @head = array_of_nodes.pop

    current_node = @head

    while !array_of_nodes.empty?
      current_node.next_node = array_of_nodes.pop
      current_node = current_node.next_node
    end

    @tail = current_node
    @tail.next_node = nil
  end
end

list = LinkedList.new("I")

list.append("Love")
list.append("Momo")
p list.to_s
list.prepend("Hi")
p list.to_s
list.insert_after("I", "Really")
p list.to_s
list.insert_after("Momo", "Choi")
p list.to_s
list.delete("Hi")
p list.to_s
list.reverse
p list.to_s

list = LinkedList.new("Alone")
p list.to_s
list.reverse
p list.to_s
