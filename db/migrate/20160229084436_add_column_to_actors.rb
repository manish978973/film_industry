class AddColumnToActors < ActiveRecord::Migration
  def change
  	add_column :actors, :language_id, :string
  end
end
