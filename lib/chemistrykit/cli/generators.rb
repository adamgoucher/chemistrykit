require 'thor/group'

module ChemistryKit
  module CLI
    class Generate < Thor
      include Thor::Actions

      attr_accessor :name

      def self.source_root
        File.join(File.dirname(__FILE__), '..')
      end

      desc "spec name [ARGS]", "Generate a Chemistry Kit spec"
      long_desc <<-LONGDESC
        Generates a Chemistry Kit Spec
      LONGDESC
      option :project, :type => :string, :default => ''
      def spec(name)
        require 'chemistrykit/config'
        
        self.name = name
        template('templates/spec.rb.tt', "tests/#{name}_beaker.rb")
      end
    end
  end
end
