require "bundler/gem_tasks"
 $:.unshift File.dirname(__FILE__) + 'lib'
 require 'rspec/core/rake_task'
 RSpec::Core::RakeTask.new
 
task :default => :tu

desc "Pruebas unitarias de la clase Matriz"
task :tu do
        sh "rspec -I. spec/matriz_spec.rb"
end

desc "Ejecutar con documentacion"
task :doc do
        sh "rspec -I. spec/matriz_spec.rb --format documentation"
end

desc "Test class MatrizDensa"
task :test do
  sh "ruby -I. test/tc_matrizDensa.rb"
end
