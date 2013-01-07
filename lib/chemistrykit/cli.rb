require "thor"
# require 'chemistrykit/generators'
require 'chemistrykit/new'

module ChemistryKit
  module CLI
    class CKitCLI < Thor

      # default_task :brew

     # register(ChemistryKit::CLI::Generate, 'generate', 'generate [GENERATOR] [NAME]', 'generates something')
      register(ChemistryKit::CLI::New, 'new', 'new [NAME]', 'Creates a new ChemistryKit project')
    end
  end
end
