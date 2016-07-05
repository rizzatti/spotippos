require 'rake'
require 'hanami/rake_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
  t.warning = false
end

task default: :test
task spec: :test

namespace :seed do
  task provinces: :environment do |t|
    filename = __dir__ + '/modules/code-challenge/provinces.json'
    content = JSON.load(File.read(filename))
    provinces = Province.create content
    provinces.each { |p| ProvinceRepository.persist p }
  end

  task properties: :environment do |t|
    filename = __dir__ + '/modules/code-challenge/properties.json'
    content = JSON.load(File.read(filename))
    properties = Property.create content
    properties.each { |p| PropertyRepository.persist p }
  end
end

task :seed => ['seed:provinces', 'seed:properties']
