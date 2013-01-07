require "thor"
require 'chemistrykit/generators'
require 'chemistrykit/new'

module ChemistryKit
  module CLI
    class CKitCLI < Thor

      default_task :brew

      register(ChemistryKit::CLI::Generate, 'generate', 'generate [GENERATOR] [NAME]', 'generates something')
      register(ChemistryKit::CLI::New, 'new', 'new [NAME]', 'Creates a new ChemistryKit project')

      desc "brew [ARGS]", "Run the Chemistry kit"
      long_desc <<-LONGDESC
        Runs the Chemistry kit
      LONGDESC
      def brew
        require 'chemistrykit/config'
        
        puts CHEMISTRY_CONFIG['chemistrykit']['project']
      end

    end
  end
end
