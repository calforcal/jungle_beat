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
    expect(list.append("doop")).to eq("doop")
    expect(list.head.data).to eq("doop")
  end

  it "creates a Node within the LinkedList" do
    list = LinkedList.new
    list.append("doop")
    expect(list.head).to be_an_instance_of(Node)
  end

  it "can determine the next node" do
    list = LinkedList.new
    list.append("doop")
    expect(list.head.next_node).to eq(nil)
  end

  it "can count the number of Nodes in the LinkedList" do
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
    expect(list).to be_an_instance_of(LinkedList)
    expect(list.head).to eq(nil)
    list.append("doop")
    expect(list.head).to be_an_instance_of(Node)
    expect(list.head.next_node).to eq(nil)
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

  it "can prepend values to the front of the LinkedList" do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    expect(list.to_string).to eq("dop plop suu")
  end

  it "can count even MORE values" do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    expect(list.count).to eq(3)
  end

  it "can insert values at specific indexes" do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    expect(list.insert(1, "woo")).to eq("woo")
    expect(list.to_string).to eq("dop woo plop suu")
  end

  it "can find ONE element" do
    list = LinkedList.new
    list.append("shi")
    list.append("shu")
    list.append("blop")
    list.prepend("deep")
    list.insert(1, "woo")
    expect(list.to_string).to eq("deep woo shi shu blop")
    expect(list.find(2, 1)).to eq("shi")
  end

  it "can find MULTIPLE elements" do
    list = LinkedList.new
    list.append("shi")
    list.append("shu")
    list.append("blop")
    list.prepend("deep")
    list.insert(1, "woo")
    expect(list.to_string).to eq("deep woo shi shu blop")
    expect(list.find(1, 3)).to eq("woo shi shu")
  end

  it "can determine if the LinkedList has specific values" do
    list = LinkedList.new
    list.append("shi")
    list.append("shu")
    list.append("blop")
    list.prepend("deep")
    list.insert(1, "woo")
    expect(list.includes?("shu")).to be true
    expect(list.includes?("dep")).to be false
  end

  it "can remove the last Node from the LinkedList" do
    list = LinkedList.new
    list.append("shi")
    list.append("shu")
    list.append("blop")
    list.prepend("deep")
    list.insert(1, "woo")
    expect(list.pop).to eq("blop")
    expect(list.pop).to eq("shu")
    expect(list.to_string).to eq("deep woo shi")
  end
end