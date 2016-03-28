class LanguagesController < ApplicationController


def index
	@language = Language.all
	 respond_to do |format| 
		format.html
		format.csv { send_data @language.to_csv }
	end
end

def search

l = Language.search do
        fulltext params[:search]
  end

if Language.find_by(name: params[:search])
 @languages = l.results

else
	flash[:danger] = "Enter valid Language"
	redirect_to languages_path

end

  
end


def new
	@language=Language.new
end



def create
	@language=Language.new(language_params)
	respond_to do |format|
		if @language.save
			format.html {redirect_to @language, notice: 'Your language is created'}
			format.json{redirect_to "show", status: :created , location:@language}
		else
			format.html{render :new}
			  format.json { render json: @language.errors, status: :unprocessable_entity }
			end
		end

end

def show
	@language=Language.find(params[:id])
	@lan=Language.where(id:params[:id])
	@u=@language.actors
	respond_to do |format|
		format.html
		format.csv { send_data @lan.to_vimal(@lan), file_name: "#{@language.name}_report" }
	end
 end

def edit
    @language=Language.find(params[:id])
end

def update
	   @language=Language.find(params[:id])
	  respond_to do |format|
      if @language.update(language_params)
        format.html { redirect_to @language, notice: 'Language was successfully updated.' }
        format.json { render :show, status: :ok, location: @language }
      else
        format.html { render :edit }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
	end


	def destroy
		@Language=Language.find(params[:id])
		@Language.destroy
		respond_to do |format|
		format.html { redirect_to languages_path, notice: 'Language was successfully destroyed.' } 
		format.json { head :no_content }
	end
end



	private

	def language_params
     params.require(:language).permit(:name)
    end

   end

