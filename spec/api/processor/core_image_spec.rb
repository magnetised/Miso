require File.expand_path('../../../start', __FILE__)

describe "Miso::Processor::CoreImage" do
  it "should check the load paths to see if RubyCocoa is available" do
    Miso::Processor::CoreImage.should.be.available
    with_load_path '/tmp', '~/' do
      Miso::Processor::CoreImage.should.not.be.available
    end
  end
  
  it "should require osx/cocoa on initialization" do
    Miso::Processor::CoreImage.any_instance.expects(:require).with('osx/cocoa')
    Miso::Processor::CoreImage.new(fixture_file('120x100.png'))
  end
end

describe "An instance of Miso::Processor::CoreImage" do
  before do
    @image_120_x_100 = Miso::Image.new(fixture_file('120x100.png'), Miso::Processor::CoreImage)
    @output_file = temp_file('temp.png')
  end
  
  it "should crop to specified dimensions" do
    @image_120_x_100.crop(40, 30).write(@output_file).dimensions.should == [40, 30]
    @image_120_x_100.crop(40, 33).write(@output_file).dimensions.should == [40, 33]
  end
  
  it "should fit to specified dimensions, conserving the original aspect ratio" do
    @image_120_x_100.fit(40, 30).write(@output_file).dimensions.should == [36, 30]
    @image_120_x_100.fit(40, 34).write(@output_file).dimensions.should == [40, 33]
  end
  
  it "should return its dimensions" do
    @image_120_x_100.dimensions.should == [120, 100]
  end
end