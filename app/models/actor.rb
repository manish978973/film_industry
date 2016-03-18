class Actor < ActiveRecord::Base
  belongs_to :language
 has_many :movies, dependent: :destroy
   validates :name,  presence: true, length: { maximum: 50 }
   validates :place,  presence: true, length: { maximum: 50 }
end
