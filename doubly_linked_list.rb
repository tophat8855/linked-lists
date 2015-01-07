class Node
  attr_accessor :value, :next_node, :previous_node
  def initialize(value)
    @value = value
  end
end

first = Node.new(37)
first.next_node = Node.new(50)
first.next_node.previous_node = first

class DoublyLinkedList
  def initialize(value)
    node = Node.new(value)
    @head = node
    @tail = node
  end

  def append(value)
    @tail.next_node = Node.new(value)
    @tail.next_node.previous_node = @tail
    @tail = @tail.next_node
  end

  def prepend(value)
    new_head = Node.new(value)
    new_head.next_node = @head
    new_head.next_node.previous_node = new_head
    @head = new_head
  end

  def to_s(node=@head)
    return node.value if node.next_node.nil?
    return "#{node.value} <=> #{to_s(node.next_node)}"
  end

  def to_s_previously(node=@tail)
    return node.value if node.previous_node.nil?
    return "#{to_s_previously(node.previous_node)} <=> #{node.value}"
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
      new_node.previous_node = before_node
      new_node.next_node = hold_this
      hold_this.previous_node = new_node
    end
  end

  def delete(value)
    before_node = find(value).previous_node
    after_node = find(value).next_node
    if before_node.nil?
      place_holder = @head.next_node
      @head.next_node.previous_node = nil
      @head.next_node = nil
      @head = place_holder
    elsif after_node.nil?
      place_holder = @tail.previous_node
      @tail.previous_node.next_node = nil
      @tail.previous_node = nil
      @tail = place_holder
    else
      before_node.next_node = after_node
      after_node.previous_node = before_node
    end
  end

  def reverse
    @head, @tail = @tail, @head
    node = @head
    while !node.nil?
      node.next_node, node.previous_node = node.previous_node, node.next_node
      node = node.next_node
    end
  end
end

list = DoublyLinkedList.new("I")

list.append("Love")
list.append("McKay")
p list.to_s
p list.to_s_previously
list.prepend("<3")
p list.to_s
p list.to_s_previously
p list.length
list.insert_after("Love", "LOL!!1!!")
p list.to_s
p list.to_s_previously
list.delete("<3")
p list.to_s
p list.to_s_previously
list.reverse
p list.to_s_previously
