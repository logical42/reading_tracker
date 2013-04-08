require File.expand_path("../../../tracker", __FILE__)

describe "WPMCalculator" do
	context "words per minute calculation" do
    before(:each) do
      tracker = Tracker.new
      @default_url = "http://classics.mit.edu/Confucius/doctmean.1b.txt"
    end
    it "should count the words in a passage" do
      tracker = Tracker.new
      tracker.book.parse_passages.last.size.should == 462 
    end
  end
end