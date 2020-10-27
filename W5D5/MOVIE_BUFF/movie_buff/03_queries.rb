def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  # Movie.joins(:actors).where(actors: { name: those_actors }).group(:id).having("COUNT(actors.id) >= ? ", those_actors.length).select(:id, :title)
  Movie.joins(:actors).where(actors: { name: those_actors }).group(:id).having("COUNT(actors.id) >= ?", those_actors.length).select(:id, :title)
end

def golden_age
  # Find the decade with the highest average movie score.
  # Movie.select("(movies.yr / 10) * 10").group("(movies.yr / 10) * 10").order("(avg(movies.score)) desc").limit(1).pluck("movies.yr/10*10").first
  Movie.group("yr / 10  * 10").order("AVG(movies.score) desc").limit(1).pluck("yr / 10 * 10").first
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  movie_id = Movie.joins(:actors).where(actors: { name: name }).select(:id)
  Movie.joins(:actors).where(id: movie_id).where.not("actors.name = ?", name).pluck("distinct actors.name")
  # ids = Movie.joins(:actors).where(actors: { name: name }).select(:id)
  # Actor.joins(:movies).where(movies: { id: ids }).where.not(name: name).pluck("distinct actors.name")
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor.left_outer_joins(:movies).where(movies: { id: nil }).pluck("COUNT(*)").first

  # Actor.left_outer_joins(:movies).where("movies.id is null").pluck("COUNT(*)").first
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  name = whazzername.chars
  name = name.inject("%") { |a, c| a += c + "%" }
  Movie.joins(:actors).where("actors.name ilike ?", name).select("movies.*")
end

def longest_career
  Actor.joins(:movies).group(:id).order("max(movies.yr) - min(movies.yr) desc").limit(3).select(:id, :name, "max(movies.yr) - min(movies.yr) as career")
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  # Actor.joins(:movies).group(:id).order("max(yr) - min(yr) desc").select(:id, "max(yr)-min(yr) as career", :name).limit(3)
end
