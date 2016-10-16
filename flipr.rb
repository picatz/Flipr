require 'yaml'
require 'colorize'
require 'trollop'

class Flipr
  attr_accessor :opts, :flips, :puts

  def initialize(opts=false)
    if opts
      @opts = opts
    else
      @opts = {}
    end
    if @opts[:configs]
      @opts[:configs].each do |config|
        valid_config?(config)
      end
    end
    @flips = Flip_Tables.new(@opts)
    @puts = Put_Tables.new(@opts)
  end

  def valid_config?(config)
    unless File.file?(config)
      puts "[error]".red + " File #{config} doesn't exist."
      exit 1
    end

    unless File.extname("flip_tables.yaml") == ".yaml"
      puts "[error]".red + " File #{config} doesn't seem to be a yaml file."
      exit 1
    end
  end

  def flip_table
    @flips.tables.sample
  end

  def put_table
    @puts.tables.sample
  end

  def good_exit?
    if `echo $?`.strip == "0"
      true
    else
      false
    end
  end

  def respond
    unless good_exit?
      flip_table
    end
  end
end

class Flip_Tables
  attr_accessor :opts, :tables

  def initialize(opts)
    @opts = opts
    if @opts[:Flip_config]
      @tables = YAML.load_file(@opts[:Flip_config]) || @flips = default_tables
    else
      @tables = default_tables
    end
  end

  def default_tables
    ["[ ╯ '□']╯︵┻━┻)",
      "[ ╯ಠ益ಠ]╯彡┻━┻)",
      "[ ╯´･ω･]╯︵┸━┸)",
      "[ ╯ `^´]╯︵┻━┻)",
      "[ ╯ ﾟOﾟ]╯︵┻━┻)",
      "[ ╯ >_<]╯︵┻━┻)",
      "[ ╯ ಥ ⌒ಥ]╯︵┻━┻)",
      "[ ╯ ﾟ⊿ﾟ]╯︵┻━┻)",
      "[ ╯ `-`]╯︵┻━┻)",
      "[ ╯ ﾟ▽ﾟ]╯︵┻━┻)",
      "[ ╯ ຈل͜ຈ]╯︵┻━┻)"]
  end
end

class Put_Tables
  attr_accessor :opts, :tables

  def initialize(opts)
    @opts = opts
    if @opts[:Put_config]
      @tables = YAML.load_file(@opts[:Put_config]) || @tables = default_tables
    else
      @tables = default_tables
    end
  end

  def default_tables
    [ "┬──┬ノ['-' ノ ]",
      "┬──┬ノ[･ω･ ノ ]",
      "┬──┬ノ[ﾟ~ﾟ ノ ]",
      "┬──┬ノ[ﾟO ﾟノ ]",
      "┬──┬ノ[`-` ノ ]",
      "┬──┬ノ[ﾟ▽ ﾟノ ]"]
  end
end

foo = ARGV[0] || ARGV[0] = '-h'

opts = Trollop::options do
  banner "FLIPR".blue.bold + " [ ╯ ".green.bold + "'".red.bold + " □".green.bold + "'".red.bold + "]╯︵┻━┻)".green.bold
  opt :flip, "Flip a table"
  opt :put, "Put a table"
  opt :Flip_config, "Flip table configuration", :type => :string
  opt :Put_config, "Put table configuration", :type => :string
  opt :lol, "Rainbow support, because we need it"
end

if opts[:lol]
  require 'lolize'
  class Lolize::Colorizer
    def change_freq
      @freq = "0.#{rand(1..9)}".to_f
    end
    def change_spread
      @spread = "#{rand(1..9)}.0".to_f
    end
  end
  colorizer = Lolize::Colorizer.new
  colorizer.change_freq
  colorizer.change_spread
end

opts[:configs] = []
opts[:configs] << opts[:Flip_config] if opts[:Flip_config]
opts[:configs] << opts[:Put_config] if opts[:Put_config]

flipr = Flipr.new(opts)

if opts[:flip]
  if opts[:lol]
    colorizer.write flipr.flip_table + "\n"
  else
    puts flipr.flip_table
  end
end

if opts[:put]
  if opts[:lol]
    colorizer.write flipr.put_table + "\n"
  else
    puts flipr.put_table
  end
end
