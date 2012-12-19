require "thor"

module ChemistryKit
  class CLI < Thor
    desc "ckit new <project_name>", "Creates a new ChemistryKit project"
    def new
      puts "new"
    end
  end
end
