class BodyType < ApplicationRecord

has_many :users, dependent: :destroy

end
