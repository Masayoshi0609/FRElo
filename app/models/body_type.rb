class BodyType < ApplicationRecord

has_many :users, dependent: :destroy
has_one_attached :image

end
