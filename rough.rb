require "csv"
file_name = "Report3.csv"
CSV.open("#{Rails.root}/tmp/#{file_name}", "wb", {col_sep: ','}) do |row|
  row << ["Language", "Actor Name","Actor Place", "Movie Name","Movie Boxoffice"]
  Language.all.each do |language|
    language.actors.each do |actor|
      actor.movies.each do |movie|
        row << [language.name, actor.name,actor.place, movie.name,movie.boxoffice]
      end
    end
  end
end

require "csv"

file_name = "Report2.csv"
CSV.open("#{Rails.root}/tmp/#{file_name}", "wb", {col_sep: ','}) do |row|
  row << ["Actor Name","Actor Place", "Movie Name","Movie Boxoffice"]
   language = Language.find(1) 
    language.actors.each do |actor|
      actor.movies.each do |movie|
        row << [language.name, actor.name,actor.place, movie.name,movie.boxoffice]
      
    end
  end
end




