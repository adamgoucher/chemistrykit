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
  s.add_dependency "ci_reporter", "~> 1.8.3"

  s.add_development_dependency "rspec", "~> 2.12.0"
  s.add_development_dependency "cucumber", "~> 1.2.1"
  s.add_development_dependency "aruba", "~> 0.5.1"
  s.add_development_dependency "rake", "~> 10.0.3"

  # TODO: Really need a solution for this. Notify a Window's user to install these gems manually
  # platforms :mswin do
  #   "win32-file" # , "~> 0.6.8"
  # end

end
