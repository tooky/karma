require 'fileutils'
 
Merb::BootLoader.before_app_loads do
  config_path = Merb.root / 'config' / 'users.yml'
  
  if File.exists?(config_path)
    Users = YAML.load_file(config_path)
  end
  
end