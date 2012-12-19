require "thor"

module ChemistryKit
  class CLI < Thor
    include Thor:Actions

    def self.source_root
      File.dirname(__FILE__)
    end

    desc "ckit new <project_name>", "Creates a new ChemistryKit project"
    long_desc <<-LONGDESC
      'ckit new' will generate the a new ChemistryKit project.

      You must specifiy the location and mame of the new project.

      Examples:
        ckit new cool-beans
        ckit new .
    LONGDESC

    def new(name)
      puts "new project"
    end

    desc "ckit generate GENERATOR [ARGS]" "Generates boiler plate files"
    long_desc <<-LONGDESC
      Please choose a generator below.

      ckit:
        page
        script

    LONGDESC

    def genreate(name)
      puts "generate"
    end

  end
end
