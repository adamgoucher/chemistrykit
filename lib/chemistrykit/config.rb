require 'yaml'

module ChemistryKit
  CHEMISTRY_CONFIG = YAML.load(ERB.new(File.read(File.join(Dir.getwd, 'config', 'chemistrykit.yaml'))).result)

  if CHEMISTRY_CONFIG['saucelabs']['ondemand']
    begin
      SAUCE_CONFIG = YAML.load(File.read(File.join(Dir.getwd, 'config', 'saucelabs.yaml')))
    rescue Errno::ENOENT
      abort('To use Sauce Labs OnDemand you need a config/saucelabs.yaml with your username and key')
    end
  end
end