class Program < ActiveRecord::Base
  is_sluggable :name
  has_many :program_images
  def to_param  # overridden in order to show the name in the url
     ("#{cached_slug}").parameterize
  end
end
