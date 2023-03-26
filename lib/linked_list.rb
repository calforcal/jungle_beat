class LinkedList
  attr_accessor :head, :counter, :string
  def initialize
    @head = nil
  end

  def append(data)
    node = Node.new(data)
    if @head == nil
      @head = node
    else
      current_node = @head
      while(current_node.next_node != nil)
        current_node = current_node.next_node
      end
      current_node.next_node = node
    end
  end

  def count
    counter = 1
    current_node = @head
    while current_node.next_node != nil
      counter += 1
      current_node = current_node.next_node
    end
    return counter
  end

  def to_string
    @string = ""
    current_node = @head
    while current_node.next_node != nil
      @string << " #{current_node.data}"
      current_node = current_node.next_node
    end
    @string << " #{current_node.data}"
    string.lstrip
  end

  def prepend(data)
    if @head == nil
      @head = Node.new(data)
    else
      placeholder = @head
      @head = Node.new(data)
      @head.next_node = placeholder
    end
  end

  def insert(num, data)
    counter = 1
    current_node = @head
    if num == 0
      placeholder = @head
      @head = Node.new(data)
      @head.next_node = placeholder
    else
      while counter != num
        current_node = current_node.next_node
        counter += 1
      end
      placeholder = current_node.next_node
      insert_node = Node.new(data)
      current_node.next_node = insert_node
      insert_node.next_node = placeholder
    end
  end

  def find(index, items)
    counter = 0
    item_counter = 0
    current_node = @head
    string = ""
    while item_counter != items
      while counter != index
        current_node = current_node.next_node
        counter +=1
      end
      string << " #{current_node.data}"
      item_counter += 1
      current_node = current_node.next_node
    end
    string.lstrip
  end

  def includes?(yooo)
    current_node = @head
    while current_node.data != yooo
      if current_node.next_node == nil
        return false
      else
        current_node = current_node.next_node
      end
    end
    return true
  end

  def pop
    current_node = @head
    while current_node.next_node != nil
      placeholder = current_node
      current_node = current_node.next_node
    end
    deleted = current_node.data
    placeholder.next_node = nil
    return deleted
  end
end