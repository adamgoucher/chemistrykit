require "thor"

module ChemistryKit
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      File.join(File.dirname(__FILE__), '..')
    end

    desc "new [PROJECT_NAME]", "Creates a new ChemistryKit project"
      # method_options :force => :boolean
      long_desc <<-LONGDESC
        'ckit new' will generate the a new ChemistryKit project.

        You must specifiy the location and name of the new project.

        Examples:
          ckit new cool-beans
          ckit new .
      LONGDESC
    def new(name)
      if name == "."
        destination_root = Dir.getwd
      else
        Dir.mkdir(name)
        destination_root = File.join(Dir.getwd, name)
      end

      Dir.glob(File.join(File.join(CLI.source_root, "templates", "chemistrykit"), "**/*")).each do |file|
        path_length = File.join(CLI.source_root, "templates", "chemistrykit").length + 1
        destination = File.join(destination_root, file[path_length .. -1])
        if not File.exists?(destination)
          if File.directory?(file)
            Dir.mkdir(destination)
          else
            FileUtils.cp(file, destination)
          end
        end
      end
    end

    desc "generate GENERATOR [ARGS]", "Generates boiler plate files"
    long_desc <<-LONGDESC
      Please choose a generator below.

      ckit:
        page
        script
    LONGDESC
    def generate(name)
      puts "generating stuff"
    end

  end
end
