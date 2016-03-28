require "csv"
class Language < ActiveRecord::Base
  has_many :actors, dependent: :destroy
  
  validates :name,  presence: true, length: { maximum: 50 }


 

searchable do
   text :name
end
  
  
                    
    def self.to_csv(options={})
  	CSV.generate(options) do |row|
  		row << ["Language", "Actor Name","Actor Place", "Movie Name","Movie Boxoffice"]
  		all.each do |language|
  			language.actors.each do |actor|
      		actor.movies.each do |movie|
        		row << [language.name, actor.name,actor.place, movie.name,movie.boxoffice]
      		end
    		end
  		end
  	end
  end

 def self.to_vimal(language)
    CSV.generate do |row|
      row << ["Language", "Actor Name","Actor Place", "Movie Name","Movie Boxoffice"]
      language.each do |lane|
        lane.actors.each do |actor|
          actor.movies.each do |movie|
            row << [lane.name, actor.name,actor.place, movie.name,movie.boxoffice]
          end
        end
      end
    end
  end
                  
   
  end



