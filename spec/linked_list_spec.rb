require "./node"
require "./linked_list"

RSpec.describe LinkedList do
  it "initializes" do
    list = LinkedList.new
    expect(list).to be_an_instance_of(LinkedList)
  end

  it "initializes with variable head as nil" do
    list = LinkedList.new
    expect(list.head).to eq(nil)
  end

  it "adds data to a new node" do
    list = LinkedList.new
    list.append("doop")
    expect(list.head).to be_an_instance_of(Node)
  end

  it "can determine the next node" do
    list = LinkedList.new
    list.append("doop")
    expect(list.head.next_node).to eq(nil)
  end

  it "can count the number of nodes" do
    list = LinkedList.new
    list.append("doop")
    expect(list.count).to eq(1)
  end

  it "can return the nodes as a string" do
    list = LinkedList.new
    list.append("doop")
    expect(list.to_string).to eq("doop")
  end

  it "can add multiple Nodes" do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    expect(list.head.next_node).to be_an_instance_of(Node)
  end

  it "can count multiple nodes" do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    expect(list.count).to eq(2)
  end

  it "can string together multiple nodes values" do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("beep")
    expect(list.to_string).to eq("doop deep beep")
  end
end