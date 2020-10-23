# frozen_string_literal: true

class MoviesController < ApplicationController
  include MoviesControllerHelper

  def index
    request = search_params

    @ages = Age.all
    @gender = { 'M': 'Male',
                'F': 'Female' }

    if search_all?
      find_all_movies
    elsif search_age_gender?
      @current_age = request[:age]
      @current_gender = request[:gender]
      find_movies_by_age_gender
    elsif search_age?
      @current_age = request[:age]
      find_movies_by_age
    elsif search_gender?
      @current_gender = request[:gender]
      find_movies_by_gender
    end
  end

  def find_all_movies
    @movies_list = query('all')
  end

  def find_movies_by_age
    @movies_list = query("a-#{@current_age}")
  end

  def find_movies_by_gender
    @movies_list = query("g-#{@current_gender}")
  end

  def find_movies_by_age_gender
    @movies_list = query("ag-#{@current_age}#{@current_gender}")
  end

  def search_params
    params.permit(:age, :gender)
  end
end
