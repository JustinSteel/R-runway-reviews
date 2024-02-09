class Review < ApplicationRecord
  validates_presence_of :comment, :category
  
  enum category: {general: 0, security: 1, restaurants: 2, bathrooms: 3, amenities: 4, accessibility: 5}

  belongs_to :user
end
