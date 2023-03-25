class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(string)
    data_array = string.split(" ")
    data_array.each do |data|
      node = Node.new(data)
      if @list.head == nil
        @list.head = node
      else
        last_node = @list.head
        while(last_node.next_node != nil)
          last_node = last_node.next_node
        end
        last_node.next_node = node
      end
    end
  end

  def play
    beat = @list.to_string
    `say -r 200 -v Alex #{beat}`
  end
end