RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller

  config.include Devise::TestHelpers, :type => :view
  config.extend ControllerMacros, :type => :view
end
