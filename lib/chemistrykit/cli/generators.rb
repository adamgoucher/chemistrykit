require 'thor'
require 'chemistrykit/cli/page_object'
require 'chemistrykit/cli/beaker'

module ChemistryKit
  module CLI
    class Generate < Thor
      register(ChemistryKit::CLI::PageObjectGenerator, 'object', 'object [NAME]', 'generates a page object')
      register(ChemistryKit::CLI::BeakerGenerator, 'beaker', 'beaker [NAME]', 'generates a beaker')
    end
  end
end
