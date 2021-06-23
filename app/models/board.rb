class Board < ApplicationRecord
    belongs_to :user
    has_many :cards, dependent: :destroy
end
