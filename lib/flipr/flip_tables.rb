# Flip_Tables class contains the main
# logic for the flipping of tables
# for this application.
class Flip_Tables
  attr_accessor :opts, :tables

  # initialize() helps create a new 
  # Flip_Tables object taking in a required
  # options hash called opts containing 
  # a hash with a key of :Flip_config
  #
  # == Examples
  #  
  #  # Typical use case for a new Flip_Tables object
  #	 flips = Flip_Tables.new(@opts)
  #
  def initialize(opts)
    @opts = opts
    @tables = []
    if @opts[:flip_configs]
      # If there are flip configs provided
      @opts[:flip_configs].each do |config|
        @tables << YAML.load_file(@opts[:flip_config])
      end
    end
    # Ensure there are some tables if the configs are bogus
    if @tables.empty?
      default_tables.each { |table| @tables << table }
    end
  end
  
  # default_tables() contains the default 
  # flip tables for this application
  #
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
