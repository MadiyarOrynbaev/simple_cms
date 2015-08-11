class Section < ActiveRecord::Base
    belongs_to :page
    scope :visible, -> { where(:visible => true) }
    scope :invisible, -> { where(:visible => false) }
    scope :sorted, -> { order("sections.position ASC") }
    scope :newest_first, -> { order("sections.created_at DESC")}
    
    acts_as_list scope: :page

    validates :title, presence: true, length: {maximum: 255}
    validates :content, presence: true
    validates :page_id, presence: true
end
