class ActorsController < ApplicationController

def index
   @language = Language.find(params[:language_id])
  @actor=@language.actors.all

end

def new
  @language = Language.find(params[:language_id])
  @actor = Actor.new
end

def create
 
  #@language = Language.where(id: params[:language_id]).first
  @language= Language.find(params[:language_id])
  @actor= @language.actors.build(actor_params)
  #@actor=Actor.new(actor_params)
  respond_to do |format|
    if @actor.save
      format.html {redirect_to language_actor_path(@language,@actor), notice: 'Your actor is created'}
      format.json{redirect_to "show", status: :created , location:@actor}
    else
      format.html{render :new}
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end

end

def show

  @actor=Actor.find(params[:id])
  @language = Language.find(params[:language_id])
  
end

def edit
  @language = Language.find(params[:language_id])
  @actor=Actor.find(params[:id])

end

  def update
   @language = Language.where(id: params[:language_id]).first
   @actor=Actor.find(params[:id])
   
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to language_actor_path(@language,@actor), notice: 'Actor was successfully updated.' }
        format.json { render :show, status: :ok, location: @actor }
      else
        format.html { render :edit }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
  @language=Language.find(params[:language_id])
    @actor=Actor.find(params[:id])
    @actor.destroy
    
    respond_to do |format|
    format.html { redirect_to language_actors_path(@language), notice: 'Actor was successfully destroyed.' } 
    format.json { head :no_content }
  end
end


private

def actor_params
   params.require(:actor).permit(:name, :place,:image, :language_id)
end


end
