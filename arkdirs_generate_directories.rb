#!/usr/bin/ruby

require 'logger'
require 'todo_runner'
require 'yaml'

require_relative 'lib/naming'

def invalid_args?
  return true if ARGV[0].nil?
  return true unless File.exist?(ARGV[0])
  return false
end

abort('Please supply a YML ark manifest.') if invalid_args?

manifest = ARGV[0]

logger = Logger.new(STDOUT)
logger.level = Logger::INFO

TodoRunner.define do
  start :create_directory

  task :create_directory, on_fail: :FAIL, next_step: :log do |todo_file|
    begin
      data = YAML.load todo_file
      FileUtils.mkdir_p("#{data[:destination]}/#{Naming.directorify(data[:ark_id])}")
      true
    rescue Exception => ex
      logger.fatal("ERROR: #{ex.message}")
      false
    end
  end

  task :log, on_fail: :FAIL, next_step: :SUCCESS do |todo_file|
    data = YAML.load todo_file
    logger.info("Directory created at #{data[:destination]}/#{Naming.directorify(data[:ark_id])}")
  end
end

logger.info('Todo Runner initialized, starting run...')

TodoRunner.run(*ARGV)

logger.info('Run complete.')
