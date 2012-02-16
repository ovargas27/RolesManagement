CanTango.config do |config|
  config.debug.set :off
  config.permits.disable :account, :special, :role_group
  config.engines.all :on
  config.ability.mode = :no_cache

  config.guest.user Proc.new { Guest.new }
  # more configuration here...
end
