class Card < ApplicationRecord
    has_one_attached :eyecatch
    belongs_to :board
    belongs_to :user
end
