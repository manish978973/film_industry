class Movie < ActiveRecord::Base
belongs_to :actor
validates :name,  presence: true, length: { maximum: 50 }
validates :boxoffice,  presence: true, length: { maximum: 50 }
end
