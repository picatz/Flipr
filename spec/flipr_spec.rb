#require 'spec_helper'
require_relative '../lib/flipr.rb'
#require 'pry'

describe Flipr do

  it 'has a version number' do
    expect(Flipr::VERSION).not_to be nil
  end

  # describe the flipe_table method
  describe '#flip_table' do
    let(:output) { subject.flip_table }
    it 'flips a table' do
      expect(output).to match /(┻|┸)/i
    end
  end

  # describe the put_table method
  describe '#put_table' do
    let(:output) { subject.put_table }
    it 'puts a table' do
      expect(output).to match /┬/i
    end
  end

  # describe the valid_config? method
  describe '#valid_config?' do
    
    # Sometimes a user may provide a valid configuration file.
    context "with valid connfig" do
      let(:output) { subject.valid_config?("flip_tables_example_config.yaml") }
      it 'validates configuration file' do
        expect(output).to be true
      end
    end
    
    # Sometimes a user may provide an invalid configuration file.
    context "with invalid config" do
      let(:output) { subject.valid_config?("not_a_config_file.txt") }
      it 'does not accept an invalid configuration file' do
        expect(output).to be false
      end
    end
  end

end

