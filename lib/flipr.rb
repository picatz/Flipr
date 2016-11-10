# Require Gems
require 'colorize'
require 'yaml'

# Require Relative Files
require_relative "flipr/put_tables"
require_relative "flipr/flip_tables"

# The Flipr class contains the main logic for this 
# application which include flipping tables, 
# putting tables.
class Flipr
  attr_accessor :flips, :puts
  
  VERSION = "1.0.0"

  # initialize() takes in an optional
  # opts hash containing the relevant 
  # options for a new Flipr object
  #
  # == Examples
  #
  #  # Typical use case to create a new
  #  # Flipr object
  #  flipr = Flipr.new
  #
  def initialize(opts=false)
    # If that opts hash is provided, then set
    # that, otherwise, set an empty hash.
    opts ? @opts = opts : @opts = {}
    # If configuration files are provided, then
    # check that each of them are valid configuration
    # files.
    if @opts[:configs]
      @opts[:configs].each do |config|
        unless valid_config?(config)
          puts "[ error ]".red + " #{config.white} is not a valid configuraiton file."
        end
      end
    end
    @flips = Flip_Tables.new(@opts)
    @puts = Put_Tables.new(@opts)
  end

  # valid_config?() checks if a config
  # file is a valid configuration file 
  # which check if the file exists and if
  # the file extension is a '.yaml' file
  #
  # == Examples
  #  
  #  # Typical use case to validate a config 
  #  valid_config?(config)
  #  => true
  #
  def valid_config?(config)
    # check if a file exist
    unless File.file?(config)
      return false
      # puts "[error]".red + " File #{config} doesn't exist."
      # exit 1
    end
    # check if the file extension is .yaml
    unless File.extname(config) == ".yaml"
      return false
      # puts "[error]".red + " File #{config} doesn't seem to be a yaml file."
      # exit 1
    end
    true
  end

  # flip_table() simply flips a random table
  # from the available tables it can flip from
  # the configuration files or the defaults
  # 
  # == Examples
  #  
  #  # Typical use case
  #  flipr = Flipr.new
  #  flipr.flip_table
  #  => [ ╯ಠ益ಠ]╯彡┻━┻)
  # 
  def flip_table
    @flips.tables.sample
  end

  # put_table() simple puts a random table
  # from the available tables it can put from
  # the configuration files or the defaults
  #
  # == Examples
  #
  #  # Typical use case
  #  flipr = Flipr.new
  #  flipr.put_table
  #  => ┬──┬ノ['~' ノ ]
  #
  def put_table
    @puts.tables.sample
  end
end

