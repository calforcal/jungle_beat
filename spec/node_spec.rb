require "./node"

RSpec.describe Node do
  it "initializes" do
    node = Node.new
    expect(node).to be_an_instance_of(Node)
  end
end