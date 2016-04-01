class Actor < ActiveRecord::Base
  belongs_to :language
 has_many :movies, dependent: :destroy
   validates :name,  presence: true, length: { maximum: 50 }
   validates :place,  presence: true, length: { maximum: 50 }

    validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '150x150#',
    medium: '300x300>'
  }
end
