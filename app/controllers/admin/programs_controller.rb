class Admin::ProgramsController < Admin::BaseController
  def index
    @programs = Program.page(params[:page]).per(10).order(:created_at)
  end
  def new
    @program = Program.new
    @program.program_images.build
  end
  def show
    @program = Program.find_using_slug(params[:id])
  end
  def create
    @program = Program.new(params[:program])
    respond_to do |format|
      if @program.save
        flash[:notice] = 'Program was successfully created.'
        format.html { redirect_to admin_programs_path }
        format.xml  { head :ok }
      else
        format.html { render :new }
        format.xml  { render :xml => @program.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def edit
    @program = Program.find_using_slug(params[:id])
    @program.program_images.build
  end
  
  def update
    @program = Program.find_using_slug(params[:id])
    respond_to do |format|
      if @program.update_attributes(params[:program])
        flash[:notice] = 'Program was successfully updated.'
          format.html { redirect_to admin_programs_path }
          format.xml  { head :ok }
      else
        format.html { render :edit }
        format.xml  { render :xml => @program.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def destroy
    @program = Program.find_using_slug(params[:id])
    @program.destroy
    respond_to do |format|
      format.html { redirect_to admin_programs_path }
      format.xml  { head :ok }
    end
  end
  
  def update_status
    @program = Program.find_using_slug(params[:id])
    
    if @program.is_present_in_homepage?
      @program.is_present_in_homepage = false
      @validated = true
    else
      if Program.check_if_only_three_are_activated_for_homepage
        @program.is_present_in_homepage = true
        @validated = true
      else
        @validated = false
      end
    end
    
    respond_to do |format|
      if @validated
        @program.save
      end
      
      format.js
    end
    
    
  end
  
end
