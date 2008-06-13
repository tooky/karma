ENV['GEM_PATH'] = '/home/stevetooke/.gems:/usr/lib/ruby/gems/1.8'
require 'framework/merb-core/merb-core'

Merb::Config.setup(:merb_root   => ".",
                   :environment => ENV['RACK_ENV'])
Merb.environment = Merb::Config[:environment]
Merb.root = Merb::Config[:merb_root]
Merb::BootLoader.run

run Merb::Rack::Application.new