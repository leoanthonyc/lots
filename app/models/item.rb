class Item < ApplicationRecord
  validates :name,
    presence: true, 
    uniqueness: true

  has_rich_text :description
end
