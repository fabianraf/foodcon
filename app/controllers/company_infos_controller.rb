class CompanyInfosController < ApplicationController
  
  def show
    @company_info = CompanyInfo.find_using_slug(params[:id])
    @keywords = @company_info.meta_keywords
    @title = @company_info.title
  end
  
end
