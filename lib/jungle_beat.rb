class JungleBeat
  attr_accessor :list, :valid_beats

  def initialize(value = nil)
    @list = LinkedList.new
    @valid_beats = ["tee", "dee", "deep", "bop", "boop", "la", "na", "beep", "shoo", "shi", "shu", "plop", "suu", "woo", "hoo", "doo", "ditt"]
    if value != nil
      @list.append(value)
    end
  end

  def append(string)
    data_array = string.split(" ")
    valid_array = data_array.select {|data| @valid_beats.include?(data)}
    valid_array.each do |data|
      insert_node = Node.new(data)
      if @list.head == nil
        @list.head = insert_node
      else
        current_node = @list.head
        while(current_node.next_node != nil)
          current_node = current_node.next_node
        end
        current_node.next_node = insert_node
      end
    end
    valid_array.join(" ")
  end

  def play
    beat = @list.to_string
    `say -r 200 -v Alex #{beat}`
  end
end