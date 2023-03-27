require "./node"

RSpec.describe Node do
  it "initializes" do
    node = Node.new("plop")
    expect(node).to be_an_instance_of(Node)
  end

  it "accepts data" do
    node = Node.new("plop")
    expect(node.data).to eq("plop")
  end

  it "initializes with next node defaulting to nil" do
    node = Node.new("plop")
    expect(node.next_node).to eq(nil)
end