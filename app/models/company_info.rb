class CompanyInfo < ActiveRecord::Base
  #is_sluggable :title
  has_one :company_info_image
  accepts_nested_attributes_for :company_info_image
  
#  def to_param  # overridden in order to show the name in the url
#     ("#{cached_slug}").parameterize
#  end
end
