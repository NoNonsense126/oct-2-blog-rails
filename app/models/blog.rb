class Blog < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  has_many :tags

  def tags_names
    # self.tags.pluck(:name).join(", ")
    array = []
    self.tags.each do |tag|
      array << tag.name
    end
    array.join(", ")
  end
end
