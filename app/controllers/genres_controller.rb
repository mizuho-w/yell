class GenresController < ApplicationController

  def new
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  		redirect_to new_genre_path
  	else
  		@genres = Genre.all
  		render root_path
  	end
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	if @genre.update(genre_params)
  	   redirect_to new_genre_path
  	else
  		render 'edit'
  	end
  end

  def genre
    @genres = Genre.all
  end

    private
  def genre_params
  	params.require(:genre).permit(:name, :is_active)
  end

end
