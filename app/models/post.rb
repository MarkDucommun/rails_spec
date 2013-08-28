class Post < ActiveRecord::Base
  attr_accessible :title, :content, :is_published, :slug

  scope :recent, order: "created_at DESC", limit: 5

  before_save :titleize_title, :slugleize_slug

  validates_presence_of :title, :content


  private

  def titleize_title
    self.title = title.titleize
  end

  def slugleize_slug
    # parameterize
    self.slug = title.downcase.gsub(/[^\w ]/, '').gsub(' ', '-')
    puts slug
  end
end