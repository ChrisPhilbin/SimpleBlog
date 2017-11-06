class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    validates :body, presence: true, length: { maximum: 140 }
    default_scope -> { order(created_at: :desc) }

#implements a SEO-friendly URL, while keeping the :id in the URL before the article title
    def to_param
    slug
    end

end
