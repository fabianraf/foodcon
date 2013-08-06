class ProgramsController < ApplicationController
  
  def show
    @program = Program.find(params[:id])
    @keywords = @program.meta_keywords
    @title = @program.name
  end
  
end
