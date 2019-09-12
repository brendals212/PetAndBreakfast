class PagesController < ApplicationController
  def home
    @pets = Pet.all
    # raise
    # prepare data for search form
    @list_of_animals = Pet::PET_LIST
    @animal_array = []
    @list_of_animals.each_with_index do |animal, index|
      animal.capitalize!
      @animal_array[index] = [animal, animal]
    end
  end
end
