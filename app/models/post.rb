class Post < ApplicationRecord
  validates :title, 
    presence: true,
    length: { maximum: 100 }
  
  validates :body,
    presence: true

  belongs_to :user

  def likeable?(likes, current_user)
    if ( (!likes && !current_user) ||
         (!likes && current_user && current_user != user) ||
         (likes && likes.none?(id) && current_user && current_user != user) ||
         (likes && likes.none?(id) && !current_user) )
      true
    else
      false
    end
  end
end
