# encoding: utf-8
require File.expand_path('spec_helper', File.dirname(__FILE__))

describe "Pres" do

  before :each do
    browser.goto(WatirSpec.files + "/non_control_elements.html")
  end

  describe "#length" do
    it "returns the number of pres" do
      browser.pres.length.should == 7
    end
  end

  describe "#[]" do
    it "returns the pre at the given index" do
      browser.pres[1].id.should == "rspec"
    end
  end

  describe "#each" do
    it "iterates through pres correctly" do
      count = 0

      browser.pres.each_with_index do |p, index|
        p.id.should == browser.pre(:index, index).id
        p.value.should == browser.pre(:index, index).value

		count += 1
      end

      count.should > 0
    end
  end

end
