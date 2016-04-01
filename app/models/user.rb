class User < ActiveRecord::Base
before_save { self.email = email.downcase }
 validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
 validates :password, presence: true, length: { minimum: 6 }

 def User.new_token
    SecureRandom.urlsafe_base64
  end

   validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '150x150#',
    medium: '300x300>'
  }

end
