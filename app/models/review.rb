class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :booking

   validates :review, presence: true
end
