class Admin::ProgramsController < Admin::BaseController
  def index
    @programs = Program.page(params[:page]).per(10)
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
    @program = Program.find(params[:id])
  end
  
  def update
    @program = Program.find(params[:id])
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
    @program = Program.find(params[:id])
    @program.destroy
    respond_to do |format|
      format.html { redirect_to admin_programs_path }
      format.xml  { head :ok }
    end
  end
  
end