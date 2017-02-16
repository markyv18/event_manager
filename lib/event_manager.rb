# puts "EventManager Initialized!"
#
# contents = File.read "event_attendees.csv"
# puts contents
#
# puts "EventManager initialized."
#
# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
#   puts line
# end
#
  # puts "EventManager initialized."
  #
  # lines = File.readlines "event_attendees.csv"
  # lines.each do |line|
  #   columns = line.split(",")
  #   p columns
  # end
#
# puts "EventManager initialized."
#
# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end
# puts "EventManager initialized."
#
# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
#   next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end

# puts "EventManager initialized."
#
# lines = File.readlines "event_attendees.csv"
# row_index = 0
# lines.each do |line|
#   row_index = row_index + 1
#   next if row_index == 1
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end


# puts "EventManager initialized."
#
# lines = File.readlines "event_attendees.csv"
# lines.each_with_index do |line,index|
#   # next if index == 0
#   columns = line.split(",")
#   name = columns[2]
#   puts name
#   require "pry"; binding.pry
# end

# require 'csv'
# puts "EventManager initialized."
#
# contents = CSV.open "event_attendees.csv", headers: true
# contents.each do |row|
#   name = row[2]
#   puts name
# end


# require "csv"
# puts "EventManager initialized."
#
# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
#   name = row[:first_name]
#   puts name
# end


# require "csv"
# puts "EventManager initialized."
#
# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
#   name = row[:first_name]
#   zipcode = row[:zipcode]
#   puts "#{name} #{zipcode}"
# end

# require 'csv'
#
# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5,"0")[0..4]
# end
#
# puts "EventManager initialized."
#
# contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
#
# contents.each do |row|
#   name = row[:first_name]
#   zipcode = row[:zipcode]
# clean_zipcode(zipcode)
#
#    puts "#{name} #{zipcode}"
#  end



require 'csv'
require 'sunlight/congress'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)

  puts "#{name} #{zipcode} #{legislators}"
end
