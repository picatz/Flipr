# Put_Tables class contains the main
# logic for the putting of tables
# for this application.
class Put_Tables
  attr_accessor :opts, :tables

  # initialize() helps create a new 
  # Put_Tables object taking in a required
  # options hash called opts containing 
  # a hash with a key of :Put_config
  #
  # == Examples
  #  
  #  # Typical use case for a new Flip_Tables object
  #	 puts = Put_Tables.new(@opts)
  #
  def initialize(opts)
    @opts = opts
    @tables = []
    if @opts[:put_configs]
      # If there are flip configs provided
      @opts[:put_configs].each do |config|
        @tables << YAML.load_file(@opts[:put_config])
      end
    end
    # Ensure there are some tables if the configs are bogus
    if @tables.empty?
      default_tables.each { |table| @tables << table }
    end
  end

  # default_tables() contains the default 
  # put tables for this application
  #
  def default_tables
    [ "┬──┬ノ['-' ノ ]",
      "┬──┬ノ[･ω･ ノ ]",
      "┬──┬ノ['~' ノ ]",
      "┬──┬ノ[`-` ノ ]" ]
  end
end
