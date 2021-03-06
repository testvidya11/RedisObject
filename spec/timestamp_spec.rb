require File.dirname(__FILE__) + '/spec_helper'

module TriggerSpec
	
	class TimestampedObject < RedisObject;end
	
	describe Seabright::Triggers do
		before do
			SpecHelper.flushdb
		end
		
		it "should get recently created object" do
			
			(1..5).each do |n|
				TimestampedObject.create(n.to_s)
			end
			
			TimestampedObject.recently_created.first.id.should eq("5")
			TimestampedObject.recently_updated.first.id.should eq("5")
						
		end
						
	end
end
