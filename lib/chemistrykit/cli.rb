require "thor"

class MyCLI < Thor
  desc "ckit new <project_name>", "Creates a new ChemistryKit project"
  def new(project)
    puts "Yeah, your ready to rock out #{project}!"
  end
end

MyCLI.start(ARGV)
