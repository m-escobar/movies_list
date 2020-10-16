class FindMoviesByGenderQuery
  def initialize(gender)
    @gender = gender
  end

  def execute
    query = sanitize_query
    ActiveRecord::Base.connection.execute(query)
  end

  def sanitize_query
    ActiveRecord::Base.send(:sanitize_sql_array, [sql, @gender])
  end

  def sql
    <<-SQL
      WITH gender_filter AS (
      SELECT id
      FROM users
      WHERE gender = (?)),
      gender_table AS (
      SELECT * FROM ratings
      WHERE user_id IN (SELECT * FROM gender_filter))
      SELECT m.title, ROUND(AVG(r.rating),2) AS ratings_avg, COUNT(r.rating) AS ratings_count
      FROM gender_table r
      INNER JOIN movies m ON m.id = r.movie_id
      GROUP BY m.title
      HAVING COUNT (r.rating) > 20
      ORDER BY ratings_avg DESC, ratings_count DESC
      LIMIT 100;
    SQL
  end
end
