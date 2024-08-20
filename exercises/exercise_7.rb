require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store_id, presence: true

end

class Store < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validate :carry_apparel

  def carry_apparel
    if mens_apparel != true && womens_apparel != true
      errors.add(:base, "At least one type of apparel must be true")
    end
  end
end

puts "Please enter a store name"
store_name = gets.chomp

store = Store.new(name: store_name)

if store.save
  puts "Store created successfully!"
else
  puts "Failed to create store:"
  store.errors.full_messages.each do |message|
    puts message
  end
end