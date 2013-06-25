class Admin::CompanyInfosController < Admin::BaseController
  def index
    @company_infos = CompanyInfo.page(params[:page]).per(10).order(:created_at)
  end
  
  def new
    @company_info = CompanyInfo.new
    @company_info.build_company_info_image
  end
  
  def show
    @company_info = CompanyInfo.find_using_slug(params[:id])
  end
  
  def create
    @company_info = CompanyInfo.new(params[:company_info])
    respond_to do |format|
      if @company_info.save
        flash[:notice] = 'CompanyInfo was successfully created.'
        format.html { redirect_to admin_company_infos_path(@company_info) }
        format.xml  { head :ok }
      else
        format.html { render :new }
        format.xml  { render :xml => @company_info.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def edit
    @company_info = CompanyInfo.find_using_slug(params[:id])
  
  end
  
  def update
    @company_info = CompanyInfo.find_using_slug(params[:id])
    respond_to do |format|
      if @company_info.update_attributes(params[:company_info])
        flash[:notice] = 'CompanyInfo was successfully updated.'
          format.html { redirect_to admin_programs_path }
          format.xml  { head :ok }
      else
        format.html { render :edit }
        format.xml  { render :xml => @company_info.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def destroy
    @company_info = CompanyInfo.find_using_slug(params[:id])
    @company_info.destroy
    respond_to do |format|
      format.html { redirect_to admin_programs_path }
      format.xml  { head :ok }
    end
  end
  
  def update_status
    @company_info = CompanyInfo.find_using_slug(params[:id])
    
    if @company_info.is_present_in_homepage?
      @company_info.is_present_in_homepage = false
      @validated = true
    else
      if CompanyInfo.check_if_only_three_are_activated_for_homepage
        @company_info.is_present_in_homepage = true
        @validated = true
      else
        @validated = false
      end
    end
    
    respond_to do |format|
      if @validated
        @company_info.save
      end
      
      format.js
    end
    
    
  end
end
