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
    expect(jb.list.count).to eq(6)
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

  
end