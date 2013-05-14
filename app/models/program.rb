class Program < ActiveRecord::Base
  is_sluggable :name
  has_many :program_images
  has_one :contact_us
  accepts_nested_attributes_for :program_images
  def to_param  # overridden in order to show the name in the url
     ("#{cached_slug}").parameterize
  end
end
