# frozen_string_literal: true

module MoviesControllerHelper
  def query(type)
    query_type = type.scan(reg=/[a-z]+/m).first

    response = Rails.cache.fetch([type, 'movies']) do
                case query_type
                when 'all'
                  FindAllMoviesQuery.new().execute.to_json
                when 'a'
                  FindMoviesByAgeQuery.new(@current_age).execute.to_json
                when 'g'
                  FindMoviesByGenderQuery.new(@current_gender).execute.to_json
                when 'ag'
                  FindMoviesByAgeGenderQuery.new(@current_age, @current_gender).execute.to_json
                end
              end
    JSON.parse(response)
  end
end
