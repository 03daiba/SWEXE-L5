class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  
        def like(user)
            likes.create(user_id: user_id)
        end
        
        def unlike(user)
            likes.find_by(user_id: user_id).destroy
        end
        
        def liked?(user)
            like_users.include?(user)
        end
  
end
