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

  describe "#sort" do
    it "sorts a list of 1" do
      numbers = LinkedList.new(3)
      numbers.sort

      expect(numbers.to_s).to eq("3")
    end

    it "sorts a list of 2" do
      numbers = LinkedList.new(3)
      numbers.append(2)
      numbers.sort

      expect(numbers.to_s).to eq("2 > 3")
    end

    it "sorts a list of 3" do
      numbers = LinkedList.new(3)
      numbers.append(7)
      numbers.append(2)
      numbers.sort

      expect(numbers.to_s).to eq("2 > 3 > 7")
    end

    it "sorts a list of many" do
      numbers = LinkedList.new(3)
      numbers.append(7)
      numbers.append(2)
      numbers.append(5)
      numbers.append(0)
      numbers.sort

      expect(numbers.to_s).to eq("0 > 2 > 3 > 5 > 7")
    end
  end
end
