ENV['GEM_PATH'] = '/home/yourusername/.gems:/usr/lib/ruby/gems/1.8'
require 'rubygems'
require 'merb-core'

Merb::Config.setup(:merb_root   => ".",
                   :environment => ENV['RACK_ENV'])
Merb.environment = Merb::Config[:environment]
Merb.root = Merb::Config[:merb_root]
Merb::BootLoader.run

run Merb::Rack::Application.new