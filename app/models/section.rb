class Section < ActiveRecord::Base
    belongs_to :page
    scope :visible, -> { where(:visible => true) }
    scope :invisible, -> { where(:visible => false) }
    scope :sorted, -> { order("sections.position ASC") }
    scope :newest_first, -> { order("sections.created_at DESC")}
end
