require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  has_many :employees
end

class Employee < ActiveRecord::Base
  belongs_to :store
end

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "Bob", last_name: "Smith", hourly_rate: 25)
@store1.employees.create(first_name: "Vandal", last_name: "Push", hourly_rate: 37)

@store2.employees.create(first_name: "David", last_name: "Habi", hourly_rate: 70)
@store2.employees.create(first_name: "Sam", last_name: "Aidjo", hourly_rate: 55)
@store2.employees.create(first_name: "Rick", last_name: "Doi", hourly_rate: 44)