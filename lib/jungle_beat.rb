class JungleBeat
  attr_accessor :list, :valid_beats

  def initialize(value = nil)
    @list = LinkedList.new
    @valid_beats = ["tee", "dee", "deep", "bop", "boop", "la", "na", "beep", "shoo", "shi", "shu", "plop", "suu", "woo", "hoo", "doo", "ditt"]
    @rate = 200
    @voice = "Alex"
    if value != nil
      @list.append(value)
    end
  end

  def append(data)
    valid_beats = validate_beats(data)
    valid_beats.each {|data| list.append(data)}
    valid_beats.join(" ")
  end

  def all
    list.to_string
  end

  def prepend(data)
    valid_beats = validate_beats(data)
    valid_beats.each {|data| list.prepend(data)}
    valid_beats.join(" ")
  end

  def validate_beats(beats)
    data_array = beats.split(" ")
    valid_array = data_array.select {|data| @valid_beats.include?(data.downcase)}
  end

  def play
    beat = list.to_string
    `say -r #{@rate} -v #{@voice} #{beat}`
    return list.count
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end
end