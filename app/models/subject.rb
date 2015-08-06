class Subject < ActiveRecord::Base
    has_many :pages
    
    acts_as_list
    
    scope :visible, -> { where(:visible => true) }
    scope :invisible, -> { where(:visible => false) }
    scope :sorted, -> { order("subjects.position ASC") }
    scope :newest_first, -> { order("subjects.created_at DESC")}
    scope :search, ->(query) { where(["title LIKE ?", "%#{query}%"]) }
    
    validates :title, presence: true
    validates :position, presence: true
    
end
