class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: {maximum:250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :clickbait

    def clickbait 
        number = /\d+/
        valid_title = title.to_s.include?("Won't Believe" || "Secret" || "Top #{number.to_s}" || "Guess")
        # byebug
        if(!valid_title)
            errors.add(:title, "not clickbait-y enough")
        end

    end

end
