require 'rails_helper'

describe MoviesController do
  describe 'Search movies by the same director' do
    it 'should call Movie.similar_movies' do
      expect(Movie).to receive(:similar_find).with('Aladdin')
      get :similar_movies, { title: 'Aladdin' }
    end
    it 'should assign similar movies if director exists' do
      movies = ['Seven', 'The Social Network']
      Movie.stub(:similar_find).with('Seven').and_return(movies)
      get :similar_movies, { title: 'Seven' }
      expect(assigns(:similar_movies)).to eql(movies)
    end

    it "should redirect to home page if director isn't known" do
      Movie.stub(:similar_find).with('No name').and_return(nil)
      get :similar_movies, { title: 'No name' }
      expect(response).to redirect_to(movies_path)
    end
  end
end