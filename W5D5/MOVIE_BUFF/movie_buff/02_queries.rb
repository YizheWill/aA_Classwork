def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie.where(yr: 1980..1989).where(score: 3..5).select(:id, :title, :yr, :score)
  # Movie.where(score: 3..5).where(yr: 1980..1989).select(:id, :title, :yr, :score)
end

def bad_years
  Movie.group(:yr).having("MAX(score) < 8").pluck(:yr)
  # List the years in which a movie with a rating above 8 was not released.
  # Movie.select(:yr).group(:yr).having("max(score) < 8").pluck(:yr)
end

def cast_list(title)
  Movie.joins(:actors).where(title: title).select("actors.id, actors.name").order("castings.ord")
  # Actor.joins(:movies).where("movies.title = ?", title).select(:id, :name).order("castings.ord")

  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  # Movie.joins(:actors).where(title: title).joins(:castings).group("actors.id", "castings.ord").order("castings.ord").select("actors.id, actors.name")
end

def vanity_projects
  Movie.joins(:actors).where("actors.id = director_id").where("castings.ord = 1").select(:id, :title, "actors.name")
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  # Movie.joins(:actors).where("director_id = actors.id").where("castings.ord = 1").select(:id, :title, :name)
end

def most_supportive
  # Actor.select(:id, :name, "COUNT(*)").joins(:movies).where("castings.ord != 1").group(:id).order("count(distinct movies.id) desc").limit(2)
  Movie.joins(:actors).where("castings.ord != 1").group("actors.id").order("COUNT(distinct movies.id) desc").limit(2).select("actors.id, actors.name, count(*) as roles")
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  # Movie.joins(:actors).group("actors.id").where("castings.ord <> 1").order("COUNT(movies.id) desc").limit(2).select("actors.id, actors.name, count(movies.id) as roles")
end
