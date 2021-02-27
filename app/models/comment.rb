class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :illust

  validates :text,presence: true 
end
