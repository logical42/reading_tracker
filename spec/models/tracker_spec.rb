require File.expand_path("../../../tracker", __FILE__)
describe "Tracker" do
  context "making sure rspec works" do
    it "should return true when the method rspec_works is called" do
      Tracker.rspec_works.should eq(true)
    end
  end
  context "connect to web" do
    before(:each) do 
      @tracker = Tracker.new
    end
    it "should have a default url" do
      @tracker.url.should_not eq("")
    end
  end
end