class Like < ApplicationRecord
        
        
        belongs_to :tweet
        belongs_to :user
        
        def liked(user)
                like_users.include?(user)
        end
        
end
