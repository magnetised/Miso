require File.expand_path('../../start', __FILE__)

Miso::Processor.processor_classes.each do |processor|
  if processor.available?
    describe "An instance of #{processor.name}" do
      before do
        @image_120_x_100 = Miso::Image.new(fixture_file('120x100.png'), processor)
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
  else
    warn "[!] Skipping #{processor.name} api spec."
  end
end