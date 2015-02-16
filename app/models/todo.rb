class Todo < ActiveRecord::Base
  validates :title, presence: true
  scope :completed, -> { where("completed = ?", true) }
  scope :active, -> { where("completed = ?", false) }

### writer_Attribute
def title=(title)
	write_attribute(:title, title.strip)
	end
end