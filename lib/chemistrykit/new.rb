require 'thor/group'

module ChemistryKit
  module CLI
    class New < Thor::Group
      include Thor::Actions

      argument :name

      def self.source_root
        File.join(File.dirname(__FILE__), '..')
      end

      def set_destination_root
        if name == "."
          @destination_root = Dir.getwd
        else
          Dir.mkdir(name)
          @destination_root = File.join(Dir.getwd, name)
        end
      end

      def copy_templates
        Dir.glob(File.join(File.join(New.source_root, "templates", "chemistrykit"), "**/*")).each do |file|
          path_length = File.join(New.source_root, "templates", "chemistrykit").length + 1
          destination = File.join(@destination_root, file[path_length .. -1])
          if not File.exists?(destination)
            if File.directory?(file)
              Dir.mkdir(destination)
            else
              FileUtils.cp(file, destination)
            end
          end
        end
        Dir.mkdir(File.join(@destination_root, 'logs'))
        FileUtils.makedirs(File.join(destination_root, 'lib', 'pages'))
      end
    end
  end
end
