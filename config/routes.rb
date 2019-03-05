Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get 'similar_movies/:title' => "movies#similar_movies", as: :similar_movies
end
