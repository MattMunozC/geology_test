class Datum < ApplicationRecord

    has_many :comments
    validates :url, presence: true
    validates :title, presence: true
    validates :place, presence: true
    validates :magType, presence: true
    validates :magnitude, numericality: { greater_than_or_equal_to:-1.0, lower_than_or_equal_to:1.0}
    validates :latitude, numericality: {greater_than_or_equal_to: -90.0,lower_than_or_equal_to:90.0}
    validates :longitude, numericality: {greater_than_or_equal_to: -180.0, lower_than_or_equal_to:180.0}
    validates :external_id, uniqueness: {scope: [:title,:url,:place,:magType,:magnitude,:latitude,:longitude,:tsunami,:magType, :time]}
end
