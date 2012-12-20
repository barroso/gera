require 'gera'
desc 'Generate CRUD'
task :gera => :environment do 
  puts ENV["model"]
  Gera.run ENV["model"]
end