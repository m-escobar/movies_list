class FindMoviesByAgeQuery
  def initialize(age)
    @age = age
  end

  def execute
    query = sanitize_query
    ActiveRecord::Base.connection.execute(query)
  end

  def sanitize_query
    ActiveRecord::Base.send(:sanitize_sql_array, [sql, @age])
  end

  def sql
    <<-SQL
      WITH age_filter as (
      SELECT id
      FROM users
      WHERE age_id = (?)),
      ages_table as (
      select * from ratings
      where user_id in (select * from age_filter))
      SELECT m.title, ROUND(AVG(r.rating),2) as ratings_avg, COUNT(r.rating) as ratings_count
      FROM ages_table r
      INNER JOIN movies m ON m.id = r.movie_id
      GROUP BY m.title
      HAVING COUNT (r.rating) > 20
      ORDER BY ratings_avg DESC, ratings_count DESC
      LIMIT 100;
    SQL
  end
end
