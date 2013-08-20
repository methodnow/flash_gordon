$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "flash_gordon/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "flash_gordon"
  s.version     = FlashGordon::VERSION
  s.authors     = ["Ernest Sim"]
  s.email       = ["ernest@methodnow.com"]
  s.homepage    = "https://github.com/methodnow/flash_gordon"
  s.summary     = "Flash Gordon aims to simplify managing complex flash messages"
  s.description = "Flash Gordon is a gem written to simplify flash notification calls from anywhere in your application, need a flash message appended during a controller action? model method? or view? The syntax and usage is consistent and simple. Take a spin :)"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
