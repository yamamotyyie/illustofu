class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :illust

  validates :messeage,presence: true 
end
