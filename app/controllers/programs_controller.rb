class ProgramsController < ApplicationController
  
  def show
    @program = Program.find_using_slug(params[:id])
    @title = @program.name
  end
  
end
