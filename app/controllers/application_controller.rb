class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  prepend_before_filter :load_programs
  
  def load_programs
    @all_programs = Program.all
  end
end
