desc "Compiles all .less files in the stylesheets directory of a Rails application"
task :less do
  require 'less'

  directory = 'public/stylesheets/'
  stylesheets = Dir.entries(directory)

  stylesheets.select{|s| File.extname(s) == ".less"}.each do |sheet|
    f = File.new("#{directory}#{File.basename(sheet, ".less")}.css", File::CREAT|File::TRUNC|File::RDWR, 0644)
    f.write Less::Engine.new(File.new(directory + sheet)).to_css
  end
end
