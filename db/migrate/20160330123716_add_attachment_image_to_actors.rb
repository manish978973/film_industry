class AddAttachmentImageToActors < ActiveRecord::Migration
  def self.up
    change_table :actors do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :actors, :image
  end
end
