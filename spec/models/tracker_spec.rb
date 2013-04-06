require File.expand_path("../../../tracker", __FILE__)
describe "Tracker" do
  context "making sure rspec works" do
    it "should return true when the method rspec_works is called" do
      Tracker.rspec_works.should eq(true)
    end
  end
end