require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
# require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:specs)

task default: :spec

task :spec do
  Rake::Task['specs'].invoke
  # Rake::Task['rubocop'].invoke
end

# desc 'Run RuboCop on the lib/specs directory'
# RuboCop::RakeTask.new(:rubocop) do |task|
#   task.patterns = ['lib/**/*.rb', 'spec/**/*.rb']
# end

task :readme do
  readme = File.open("README.md", 'rb') { |f| f.read }

  start_split = "## Usage"
  end_split = "## Development"

  start = readme.split(start_split)[0]
  rest = readme.split(start_split)[1]
  finale = rest.split(end_split)[1]

  require 'yard'
  files = ["lib/inspector.rb", "lib/sidekick.rb", "lib/evidence.rb"]
  docs = YARD::Registry.load(files, true)

  usage = "\n\n"
  usage << "#### The Inspector\n\n"
  usage << docs.at("Inspector::Inspector").docstring
  usage << "\n"

  usage << "#### Presenting Your Report \n\n"
  evidence = docs.at("Inspector::Evidence")
  usage << evidence.docstring

  usage << "\nProtocol for custom objects:\n\n"
  evidence.children.each do |method|
    next unless method.name.to_s.start_with? "inspector"
    params = method.parameters.flatten.compact
    usage << " - `#{method.name}(#{params.join ", "})` - #{method.docstring}\n"
  end
  usage << "\n\n"


  new_file = start + start_split + usage + end_split + finale
  File.open("README.md", 'w') { |f| f.write new_file }
end
