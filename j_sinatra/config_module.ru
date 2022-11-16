root = File.expand_path File.dirname(__FILE__)
require File.join( root , 'j_sinatra_module.rb' )

app = Rack::Builder.app do
  run MyAppModule::App
end

run app
