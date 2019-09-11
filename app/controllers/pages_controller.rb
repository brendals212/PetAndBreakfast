class PagesController < ApplicationController
  def home
    @pets = Pet.all
    # raise
    # prepare data for search form
    @list_of_animals = %w(dog cat snake rabbit mice parrot ferret turtle)
    @animal_array = []
    @list_of_animals.each_with_index do |animal, index|
      animal.capitalize!
    @animal_array[index] = [animal, animal]
    end
  end
end

