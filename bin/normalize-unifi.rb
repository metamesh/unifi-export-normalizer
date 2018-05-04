#!/usr/bin/env ruby

require 'csv'

ROOT_DIR = File.expand_path "#{File.dirname(__FILE__)}/.."
LIB_DIR = [ROOT_DIR, "lib"].join File::SEPARATOR

$LOAD_PATH.unshift(LIB_DIR)

require 'unifi-export-normalizer'

ROW_DATA = [:identifier, :type, :date, :duration, :rx, :tx, :ip, :ap]

INPUT_FILE = ARGV.shift

puts UnifiNormalizer::DurationNormalizer.normalize "1h 10m"

output = CSV.generate do |csv|
  CSV.foreach INPUT_FILE do |row|
    position = ROW_DATA.index(:duration)
    unnormalized = row[position]
    if unnormalized
      row[position] = UnifiNormalizer::DurationNormalizer.normalize unnormalized
    end

    #row[:rx] = TransferNormalizer::normalize_transfer row[:rx]
    #row[:tx] = TransferNormalizer::normalize_transfer row[:tx]
    csv << row
  end
end

puts output
