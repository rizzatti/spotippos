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

task seed: :environment do |t|
  filename = __dir__ + '/modules/code-challenge/provinces.json'
  content = JSON.load(File.read(filename))
  provinces = Province.create content
  provinces.each { |p| ProvinceRepository.persist p }
end
