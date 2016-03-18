class AddColumnsToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :actor_id, :string
  	add_column :movies, :name, :string
  	add_column :movies, :boxoffice, :string
  end
  end

