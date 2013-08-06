class Program < ActiveRecord::Base
  #is_sluggable :name
  has_many :program_images
  has_one :contact_us
  accepts_nested_attributes_for :program_images
  scope :actives, where(:is_present_in_homepage => true)
#  def to_param  # overridden in order to show the name in the url
#     ("#{cached_slug}").parameterize
#  end
  
  def self.check_if_only_three_are_activated_for_homepage
    total = Program.where("is_present_in_homepage = true").count
    if total < 3
      true
    else 
      false
    end
  end
  
end
