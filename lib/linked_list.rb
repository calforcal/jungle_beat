class LinkedList
  attr_reader :head, :counter, :string
  def initialize
    @head = nil
  end

  def append(value)
    node = Node.new(value)
    if @head == nil
      @head = node
    else
      last_node = @head
      while(last_node.next_node != nil)
        last_node = last_node.next_node
      end
      last_node.next_node = Node.new(value)
    end
  end

  def count
    @counter = 1
    last_node = @head
    while last_node.next_node != nil
      @counter += 1
      last_node = last_node.next_node
    end
    return @counter
  end

  def to_string
    @string = ""
    last_node = @head
    while last_node.next_node != nil
      @string << " #{last_node.value}"
      last_node = last_node.next_node
    end
    @string << " #{last_node.value}"
    string.lstrip
  end
end