class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.string :place

      t.timestamps null: false
    end
  end
end
