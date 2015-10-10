require 'active_record'
require 'rspec'
require_relative '../lib/people'

ActiveRecord::Base.establish_connection(YAML::load(File.open("../db/config.yml"))["test"])

RSpec.configure do |config|
  config.after(:each) do
    People.all.each { |person| person.destroy }
  end
end

describe People do

  it "has a given name" do
    input = "Input Stuff"
    expect(People.new).to include({:given_name => "Input"})
  end

  it "has a family name" do
    input = "Input Stuff"
    expect(People.new).to include({:family_name => "Stuff"})
  end

  # it "saves a name into a given name field and a family name field" do
  #   input = "input stuff"
  #   expect(People.new).to include({:given_name => "input", :family_name => "stuff"})
  # end
end
