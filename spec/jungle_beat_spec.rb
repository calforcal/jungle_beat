require "./node"
require "./linked_list"
require "./jungle_beat"

RSpec.describe JungleBeat do
  it "intitializes" do
    jb = JungleBeat.new
    expect(jb).to be_an_instance_of(JungleBeat)
  end

  it "initializes with a Linked List" do
    jb = JungleBeat.new
    expect(jb.list.head).to eq(nil)
  end

  it "can take in a multivalue string and separate by value" do
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
    jb.append("This one is for you Mr. Krabs Bee boo boo bop Bee boo boo bee bop Bop bee boo boo bee bop boo bop Bee boo boo bee boo bop")
    expect(jb.list.count).to eq(30)
  end
end