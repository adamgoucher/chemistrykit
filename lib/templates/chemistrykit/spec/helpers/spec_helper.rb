require 'chemistrykit/hooks'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  config.before do
    ChemistryKit::Hooks::before
  end
 
  config.after do
    ChemistryKit::Hooks::after
  end
end