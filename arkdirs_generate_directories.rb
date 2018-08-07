#!/usr/bin/ruby

def invalid_args?
  return true if ARGV[0].nil?
  return true unless File.exist?(ARGV[0])
  return false
end

def directorify(ark)
  return ark.to_s.gsub(/[:\/]/, ':' => '+', '/' => '=') unless ark.nil?
end

abort('Please supply a YML ark manifest.') if invalid_args?

manifest = ARGV[0]

