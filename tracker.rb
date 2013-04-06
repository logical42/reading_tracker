class Tracker
  attr_accessor :url, :average_prose, :average_screen, :user_wpm

  ### CLASS METHODS 
  def initialize(options={})
    self.url = options[:url] || "http://classics.mit.edu/Tzu/artwar.1b.txt"

    self.average_prose = 300
    self.average_screen = 180
  end

  def self.rspec_works
    true
  end 

  ### END CLASS METHODS



  ### INSTANCE METHODS



  ### END INSTANCE METHODS
end