class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.similar_find movie_title
    movie_dir = Movie.find_by(title: movie_title).director
    return nil if movie_dir.blank?
    Movie.where(director: movie_dir)
  end
end
