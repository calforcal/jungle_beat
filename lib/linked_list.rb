class LinkedList
  attr_accessor :head, :counter, :string
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
      last_node.next_node = node
    end
  end

  def count
    counter = 1
    last_node = @head
    while last_node.next_node != nil
      counter += 1
      last_node = last_node.next_node
    end
    return counter
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

  def prepend(value)
    if @head == nil
      @head = Node.new(value)
    else
      placeholder = @head
      @head = Node.new(value)
      @head.next_node = placeholder
    end
  end

  def insert(num, value)
    counter = 1
    last_node = @head
    if num == 0
      placeholder = @head
      @head = Node.new(value)
      @head.next_node = placeholder
    else
      while counter != num
        last_node = last_node.next_node
        counter += 1
      end
      placeholder = last_node.next_node
      insert_node = Node.new(value)
      last_node.next_node = insert_node
      insert_node.next_node = placeholder
    end
  end

  def find(index, items)
    counter = 0
    item_counter = 0
    last_node = @head
    string = ""
    while item_counter != items
      while counter != index
        last_node = last_node.next_node
        counter +=1
      end
      string << " #{last_node.value}"
      item_counter += 1
      last_node = last_node.next_node
    end
    string.lstrip
  end

  def includes?(data)
    last_node = @head
    while last_node.value != data
      if last_node.next_node == nil
        return false
      else
        last_node = last_node.next_node
      end
    end
    return true
  end

  def pop
    last_node = @head
    while last_node.next_node != nil
      placeholder = last_node
      last_node = last_node.next_node
    end
    deleted = last_node.value
    placeholder.next_node = nil
    return deleted
  end
end