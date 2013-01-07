require 'yaml'

module ChemistryKit
  CHEMISTRY_CONFIG = YAML.load(ERB.new(File.read(File.join(Dir.getwd, 'config', 'chemistrykit.yaml'))).result)
end