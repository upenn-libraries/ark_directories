#!/usr/bin/ruby

require 'smarter_csv'
require 'yaml'

def validate_args!
  raise ArgumentError.new('Please supply a CSV file') if ARGV[0].nil?
  raise ArgumentError.new('Please supply a destination directory') if ARGV[1].nil?
end

def directorify(ark)
  return ark.to_s.gsub(/[:\/]/, ':' => '+', '/' => '=') unless ark.nil?
end

HEADERS = %i{ ark_id file_path }

def create_todo_file(args = {}, dest_dir)
  directory_name = directorify(args[:ark_id])
  todo_base = directory_name
  todo_path = File.join dest_dir, "#{directory_name}.todo"
  data = HEADERS.inject({}) { |h,header| h.merge(header => args[header]) }
  File.open(todo_path, 'w+') { |f| f.puts YAML::dump data }
end

validate_args!

file = ARGV[0]
dest_dir = ARGV[1]

SmarterCSV.process(file).each do |row|
  create_todo_file(row, dest_dir)
end