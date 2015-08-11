class Page < ActiveRecord::Base
    belongs_to :subject
    has_many :sections
    
    acts_as_list scope: :subject
    
    scope :visible, -> { where(:visible => true) }
    scope :invisible, -> { where(:visible => false) }
    scope :sorted, -> { order("pages.position ASC") }
    scope :newest_first, -> { order("pages.created_at DESC")}
    
    validates :title, presence: true
    validates :position, presence: true
    validates :subject_id, presence: true

    validates :link, presence: true
    before_validation :add_default_link
    
    private
    
        def add_default_link
          if link.blank?
            self.link = "#{id}-#{title.to_lat.parameterize}"
          end
        end


end
