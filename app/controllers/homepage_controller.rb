# encoding: UTF-8
class HomepageController < ApplicationController
  def index
    @title = "Food Consulting Servicios de asesoría en Ecuador y Colombia"
    @programs = Program.all
  end
  def mision
    
  end
  
  def vision
    
  end
end
