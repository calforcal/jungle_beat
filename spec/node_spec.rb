require "./node"

RSpec.describe Node do
  it "initializes" do
    node = Node.new("plop")
    expect(node).to be_an_instance_of(Node)
  end

  it "accepts data" do
    node = Node.new("plop")
    expect(node.value).to eq("plop")
  end
end