class ProgramsController < ApplicationController
  
  def show
    @program = Program.find_using_slug(params[:id])
    @keywords = @program.meta_keywords
    @title = @program.name
  end
  
end
