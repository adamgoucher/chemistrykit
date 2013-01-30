require 'thor/group'

module ChemistryKit
  module CLI
    class New < Thor::Group
      include Thor::Actions

      argument :name

      def self.source_root
        File.join(File.dirname(__FILE__), '..', '..')
      end

      def create_project
        if name == "."
          # An attempt to change the :name before it's pass to 'directory'. Causes an error on destination
          # name = File.basename(Dir.getwd)
          directory "templates/chemistrykit", File.join(Dir.getwd)
        else
          directory "templates/chemistrykit", File.join(Dir.getwd, name)
        end
      end

      def notify
        say "Your project name has been added to _config/chemistrykit.yaml"
      end

    end
  end
end
