require File.expand_path("../../../tracker", __FILE__)
describe "Tracker" do
  context "making sure rspec works" do
    it "should return true when the method rspec_works is called" do
      Tracker.rspec_works.should eq(true)
    end
  end
  context "initialization" do
    it "should take an optional hash when initializing" do 
      expect { Tracker.new(url: "http://classics.mit.edu/Confucius/learning.1b.txt") }.to_not raise_error
    end
    it "should not raise an error when initializing without any options" do 
      expect { Tracker.new }.to_not raise_error
    end

    it "should set the default prose to 300 wpm at initialization" do
      Tracker.new.average_prose.should eq(300)
    end

    it "should set the default screen to 180 wpm at initialization" do
      Tracker.new.average_screen.should eq(180)
    end
    it "should parse the book from the url" do
      Tracker.new.book.should_not eq("")
    end
  end
  context "connect to web" do
    before(:each) do 
      @tracker = Tracker.new
      @default_url = "http://classics.mit.edu/Confucius/doctmean.1b.txt"
    end
    it "should have a default url" do
      @tracker.url.should_not eq("")
    end

    it "should default the url to art of war.1b" do
      @tracker.url.should eq(@default_url)
    end
  end
  context "parsing" do
    it "should be able to choose a random passage and it should be greater than the min word length" do
      tracker = Tracker.new(min_word_count: 100)
      tracker.book.pick_random_passage.split(" ").count.should > tracker.min_word_count
    end
  end
  context "words per minute calculation" do
    before(:each) do
      tracker = Tracker.new
      @default_url = "http://classics.mit.edu/Confucius/doctmean.1b.txt"
    end
    it "should accuratly calculate the words per minute of a passage" do
      tracker = Tracker.new
      tracker.book.parse_passages.last.size.should == 462 
    end
  end
end