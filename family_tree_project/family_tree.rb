require 'active_record'
require './lib/people'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def start
  puts "Trace your lineage! Type 'person' to add a new person to the database. Or, to add a parent to someone already in the database, type 'parent'. Type 'e' to exit."
  choice = gets.chomp
  case choice
  when 'person'
    add_person
  when 'parent'
    add_parent
  when 'e'
    "Goodbye!"
  else
    puts "That wasn't a valid option."
  end
end

def add_person
  puts "Enter a first and last name of a family member."
  input = gets.split(" ")
  person_name = People.new({:given_name => input.first, :family_name => input.last})
  person_name.save
  # add_mom
end



def add_parent
  puts "Who do you want to add a parent for?"
  person_input = gets.split(" ")

  People.all.each do |person|
    if person_input.first = person.given_name
      &&
      person_input.last = person.family_name
    person.get_id
  else
    puts "Sorry, that person isn't in the database."
  end

  # Person.exists?(:given_name => person_input.first, :family_name => person_input.last)
  #search person table for person_input
  #if the person exists, save their id in a variable

  puts "Do you want to add #{person_input}'s mom or dad?"
  choice2 = gets.chomp
  case choice2
    when "mom"
      add_mom
    when "dad"
      add_dad
    else
      "That wasn't a valid option."
  end
  else #if the person_input isn't found
    puts "Sorry, that person isn't in the database yet. You have to add them."
  end

def add_mom
  puts "Who is #{person_input}'s mother?"
  mom_input = gets.split(" ")
  #search database for mom_input. Return "Sorry, this person isn't in the database yet. You have to add them." if they don't exist.
  #if mom_input exists, get her id and add it to :mother_id field for person_input
  mom_id = People.where("given_name = #{mom_input.first} AND family_name = #{mom_input.last}")[0].id
  #assign mom_id to :mother_id field for person_input
  People.last({ :mother_id => mom_name.get_id)
end

start
