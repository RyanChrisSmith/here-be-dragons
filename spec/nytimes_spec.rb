require 'rspec'
require 'pry'
require './lib/nytimes'

class Nytimes
  describe 'data' do 
    before :each do 
      @hash = Nytimes::DATA
    end 
  
    it 'can get status' do 
      #FINISHED EXAMPLE: Using @hash, define a variable called `result` that returns the status
      result = @hash[:status]
      
      expect(result).to eq("OK")
    end

    it 'can get copyright' do
      result = @hash[:copyright]
      #Using @hash, define a variable called `result` that returns the copyright

      expect(result).to eq("Copyright (c) 2018 The New York Times Company. All Rights Reserved.")
    end

    it 'can get array of stories' do
      result = @hash[:results]
      #Using @hash, define a variable called `result` that returns the array of stories
  
      expect(result).to be_an_instance_of(Array)
      expect(result.count).to eq(44)
    end

    it 'can get all stories with subsection of politics' do
      result = @hash[:results].find_all do |each_result|
        each_result[:subsection].include?("Politics")
      end
        #Using @hash, define a variable called `result` that returns all stories with subsection of politics.
      expect(result).to be_an_instance_of(Array)
      expect(result.count).to eq(6)
      expect(result.first[:title]).to eq("Congressional G.O.P. Agenda Quietly Falls Into Place Even as Trump Steals the Spotlight")
      expect(result.last[:title]).to eq("Conspiracy Theories Made Alex Jones Very Rich. They May Bring Him Down.")
    end
  end 

end
