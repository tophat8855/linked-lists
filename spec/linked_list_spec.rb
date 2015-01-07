require 'spec_helper'
require 'linked_list'

describe LinkedList do
  describe "#reverse" do
    it "reverses two nodes" do
      list = LinkedList.new(1)
      list.append(2)
      list.reverse

      expect(list.to_s).to eq("2 > 1")
    end

    it "reverses three nodes" do
      list = LinkedList.new(1)
      list.append(2)
      list.append(3)
      list.reverse

      expect(list.to_s).to eq("3 > 2 > 1")
    end

    it "reverses a lot of nodes" do
      list = LinkedList.new(1)
      list.append(2)
      list.append(3)
      list.append(4)
      list.append(5)
      list.reverse

      expect(list.to_s).to eq("5 > 4 > 3 > 2 > 1")
    end
  end
end
