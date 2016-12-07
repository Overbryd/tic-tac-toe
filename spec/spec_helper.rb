require 'rspec'
Dir.glob(File.expand_path("#{File.dirname(__FILE__)}/../lib/*.rb")) { |path| require path  }

RSpec.configure { |c| c.color = true }

