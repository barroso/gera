require "gera/version"
require "rails"

module Gera

  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/gera.rake"
    end
  end

  def self.run entity
    model_ruby entity
    controller_ruby entity
    factory_ruby entity
    
    model_flex entity
    models_flex entity
    views_creator_flex entity
    view_creator_flex entity
    models_view_flex entity
    model_view_flex entity
  end
  
  def self.model_ruby entity
      create_file_by_template entity, "model_ruby", "/app/models/#{entity}.rb"
      puts "Model \"#{entity}\" criado"
  end
  
  def self.controller_ruby entity
      create_file_by_template entity, "controller_ruby", "/app/controllers/#{entity}_controller.rb"
      puts "Controller \"#{entity}\" criado"
  end
  
  def self.factory_ruby entity
      create_file_by_template entity, "factory_ruby", "/spec/factories/#{entity}.rb"
      puts "Factory \"#{entity}\" criado"
  end
  
  def self.model_flex entity
      create_file_by_template entity, "model_flex", "/app/flex/models/#{entity.capitalize}.as"
      puts "Model flex \"#{entity}\" criado"
  end
  
  def self.models_flex entity
      create_file_by_template entity, "models_flex", "/app/flex/views/#{entity.capitalize.pluralize}.as"
      puts "Models flex \"#{entity}\" criado"
  end
  
  def self.views_creator_flex entity
      create_file_by_template entity, "views_creator_flex", "/app/flex/views/#{entity.capitalize.pluralize}ViewCreator.as"
      puts "Views Creators flex \"#{entity}\" criado"
  end
  
  def self.view_creator_flex entity
      create_file_by_template entity, "view_creator_flex", "/app/flex/views/#{entity.capitalize}ViewCreator.as"
      puts "View Creators flex \"#{entity}\" criado"
  end
  
  def self.models_view_flex entity
      create_file_by_template entity, "models_view_flex", "/app/flex/views/#{entity.capitalize.pluralize}View.mxml"
      puts "Models View flex \"#{entity}\" criado"
  end
  
  def self.model_view_flex entity
      create_file_by_template entity, "model_view_flex", "/app/flex/views/#{entity.capitalize}View.mxml"
      puts "Model View flex \"#{entity}\" criado"
  end
  
  def self.create_file_by_template entity, template, create_path
    template = ERB.new File.new(File.join(File.dirname(__FILE__), "tasks/templates/#{template}.erb")).read, nil, "%"
    content = template.result(self.send(:binding))

    File.open(Rails.root.to_s + create_path,'w') do |f|
      f.puts content
    end
  end
end
