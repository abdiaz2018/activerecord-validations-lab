class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbaitey?
    
    def clickbaitey?
        if title && !title.match(/Won't Believe|Secret|Guess|Top [0-9]*/)
            errors.add(:title, "No clickbait!")
        end
    end
end
