# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    request = search_params

    @ages = Age.all
    @gender = { 'M': 'Male',
                'F': 'Female' }

    if !request[:age].present? && !request[:gender].present?
      find_all_movies
    elsif request[:age].present? && request[:gender].present?
      find_movies_by_age_gender(request[:age], request[:gender])
    elsif request[:age].present?
      find_movies_by_age(request[:age])
    elsif request[:gender].present?
      find_movies_by_gender(request[:gender])
    end
  end

  def find_all_movies
    @movies_list = FindAllMoviesQuery.new().execute
  end

  def find_movies_by_age(age)
    @movies_list = FindMoviesByAgeQuery.new(age).execute
    @current_age = request[:age]
  end

  def find_movies_by_gender(gender)
    @movies_list = FindMoviesByGenderQuery.new(gender).execute
    @current_gender = request[:gender]
  end

  def find_movies_by_age_gender(age, gender)
    @movies_list = FindMoviesByAgeGenderQuery.new(age, gender).execute
    @current_age = age
    @current_gender = gender
  end

  def search_params
    params.permit(:age, :gender)
  end
end
