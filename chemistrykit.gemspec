Gem::Specification.new do |s|
  s.name           = "chemistrykit"
  s.version        = "0.0.1"
  s.author         = ["Dave Haeffner", "Jason Wieringa"]
  s.email          = ["dave@arrgyle.com", "jason@arrgyle.com"]
  s.homepage       = "https://github.com/arrgyle/chemistrykit"
  s.summary        = "Automation framework for Selenium in Ruby"
  s.description    = File.read(File.join(File.dirname(__FILE__), 'README'))

  s.files          = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.executables    = [ 'ckit' ]

  s.required_ruby_version = '>=1.9'

  s.add_dependency "thor", "~> 0.16.0"
  s.add_dependency "rspec", "~> 2.12.0"
  s.add_dependency "selenium-webdriver", "~> 2.27.2"
end
