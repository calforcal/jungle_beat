require "./node"
require "./linked_list"
require "./jungle_beat"

RSpec.describe JungleBeat do
  it "intitializes" do
    jb = JungleBeat.new()
    expect(jb).to be_an_instance_of(JungleBeat)
  end

  it "initializes with a Linked List" do
    jb = JungleBeat.new
    expect(jb.list).to be_an_instance_of(LinkedList)
    expect(jb.list.head).to eq(nil)
  end

  it "can take in a multivalue string and separate into nodes by value" do
    jb = JungleBeat.new
    jb.append("deep doo ditt")
    expect(jb.list.head.data).to eq("deep")
    expect(jb.list.head.next_node.data).to eq("doo")
  end

  it "can add more values" do
    jb = JungleBeat.new
    jb.append("deep doo ditt")
    jb.append("woo hoo shu")
    expect(jb.list.to_string).to eq("deep doo ditt woo hoo shu")
  end

  it "can count all the values" do
    jb = JungleBeat.new
    jb.append("deep doo ditt woo hoo shu")
    expect(jb.count).to eq(6)
  end

  it "only appends valid beats" do
    jb = JungleBeat.new("deep")
    expect(jb.list.head.data).to eq("deep")
    expect(jb.append("Mississippi")).to eq("")
  end

  it "prepends and returns all beats" do
    jb = JungleBeat.new("deep")
    jb.append("Mississippi")
    expect(jb.all).to eq("deep")
    jb.prepend("tee tee tee Mississippi")
    expect(jb.all).to eq("tee tee tee deep")
  end

  it "can change and reset voices, and rate" do
    jb = JungleBeat.new("deep dop dop deep")
    expect(jb.play).to eq(4)
    jb.rate = 100
    expect(jb.rate).to eq(100)
    jb.voice = "Daniel"
    expect(jb.voice).to eq("Daniel")
    jb.reset_rate
    jb.reset_voice
    expect(jb.voice).to eq("Victoria")
    expect(jb.rate).to eq(500)
  end

  it "plays sounds!" do
    jb = JungleBeat.new("deep dop dop deep")
    expect(jb).to respond_to(:play)
  end

  it "can handle larger beats" do
    jb = JungleBeat.new("deep dop dee beep bee boo shu woo shi shoo tee na shu bop beep boo dop la la la bop bop bop ditt dop ditt dop hoo woo plop shu shi tee dee tee dee deep dop bop boop la na boop bop boop boop beep tee dee")
    expect(jb.count).to eq(49)
    expect(jb.list.find(3, 10)).to eq("beep bee boo shu woo shi shoo tee na shu")
    48.times {jb.list.pop}
    expect(jb.all).to eq("deep")
    jb.append("deep dop dee beep bee boo shu woo shi shoo tee na shu bop beep boo dop la la la bop bop bop ditt dop ditt dop hoo woo plop shu shi tee dee tee dee deep dop bop boop la na boop bop boop boop beep tee dee deep dop dee beep bee boo shu woo shi shoo tee na shu bop beep boo dop la la la bop bop bop ditt dop ditt dop hoo woo plop shu shi tee dee tee dee deep dop bop boop la na boop bop boop boop beep tee dee")
    expect(jb.count).to eq(99)
    expect(jb.all).to eq("deep deep dop dee beep bee boo shu woo shi shoo tee na shu bop beep boo dop la la la bop bop bop ditt dop ditt dop hoo woo plop shu shi tee dee tee dee deep dop bop boop la na boop bop boop boop beep tee dee deep dop dee beep bee boo shu woo shi shoo tee na shu bop beep boo dop la la la bop bop bop ditt dop ditt dop hoo woo plop shu shi tee dee tee dee deep dop bop boop la na boop bop boop boop beep tee dee")
  end
end