class Comment < ApplicationRecord
    belongs_to :datum
    validates :comment, presence: true
end
