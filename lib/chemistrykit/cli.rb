require "thor"

module ChemistryKit
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      File.dirname(__FILE__)
    end

    desc "new [PROJECT_NAME]", "Creates a new ChemistryKit project"
      # method_options :force => :boolean
      long_desc <<-LONGDESC
        'ckit new' will generate the a new ChemistryKit project.

        You must specifiy the location and mame of the new project.

        Examples:
          ckit new cool-beans
          ckit new .
      LONGDESC
    def new(name)
      puts "made it so far"
      Dir["templates/*"].each do |source|
        puts "about to copy the destination"
        destination = "templates/example/#{File.basename(source)}"
        puts "new #{name}"
        # FileUtils.rm(destination) if options[:force] && File.exist?(destination)
        if File.exist?(destination)
          puts "Skipping #{destination} because it already exists"
        else
          puts "Generating #{destination}"
          FileUtils.cp(source, destination)
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
