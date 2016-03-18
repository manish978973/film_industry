class MoviesController < ApplicationController

def index
	@actor=Actor.find(params[:actor_id])
	@movie=@actor.movies.all
end


def new
	@actor=Actor.find(params[:actor_id])
	@movie=Movie.new
end


def edit
	@actor=Actor.find(params[:actor_id])
	@movie=Movie.find(params[:id])
end

	
def show
	@actor=Actor.find(params[:actor_id])
	@movie=Movie.find(params[:id])
end


def create
     @actor=Actor.find(params[:actor_id])
     @movie=@actor.movies.build(movie_params)
     respond_to do |format|
    if @movie.save
      format.html {redirect_to actor_movie_path(@actor,@movie), notice: 'Your actor is created'}
      format.json{redirect_to "show", status: :created , location:@movie}
    else
      format.html{render :new}
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end

	
end



def update
	  @actor = Actor.where(id: params[:actor_id]).first
   @movie=@actor.movies.find(params[:id])
   
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to actor_movie_path(@actor,@movie), notice: 'Actor was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie}
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
end


def destroy
  @actor=Actor.find(params[:actor_id])
	  @movie=Movie.find(params[:id])
    @movie.destroy
    
    respond_to do |format|
    format.html { redirect_to actor_movies_path(@actor), notice: 'Actor was successfully destroyed.' } 
    format.json { head :no_content }
  

end
end

private

def movie_params
	params.require(:movie).permit(:actor_id, :name, :boxoffice)
end

end
