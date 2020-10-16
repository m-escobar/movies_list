class FindAllMoviesQuery
  def execute
    ActiveRecord::Base.connection.execute(sql)
  end

  def sql
    <<-SQL
      WITH valid_ratings AS (
        SELECT movie_id, ROUND(AVG(r.rating),2) AS ratings_avg, COUNT(r.rating) AS ratings_count
        FROM ratings r
        GROUP BY movie_id
        HAVING COUNT(r.rating) > 20
        ORDER BY ratings_avg DESC, ratings_count DESC
        LIMIT 100)

      SELECT m.title, vr.ratings_avg, vr.ratings_count
      FROM movies m, valid_ratings vr
      WHERE m.id = vr.movie_id
      GROUP BY m.title, vr.ratings_avg, vr.ratings_count
      ORDER BY vr.ratings_avg DESC, vr.ratings_count DESC
    SQL
  end
end
