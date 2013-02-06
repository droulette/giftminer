# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Gift::Application.initialize!

Time::DATE_FORMATS.merge!({:default => '%m/%d/%Y'})
Date::DATE_FORMATS.merge!({:default => '%m/%d/%Y'})
ActionView::Base.field_error_proc = Proc.new {|html, instance| html }
