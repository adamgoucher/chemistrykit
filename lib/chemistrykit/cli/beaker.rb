require 'thor/group'

module ChemistryKit
  module CLI
    class BeakerGenerator < Thor::Group
      include Thor::Actions
      argument :name

      def self.source_root
        File.join(File.dirname(File.expand_path(__FILE__)), '../../templates/')
      end

      def create_lib_file
        template('beaker.tt', "./beakers/#{name}_beaker.rb")
      end

    end
  end
end
