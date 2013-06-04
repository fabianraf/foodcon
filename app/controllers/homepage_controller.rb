# encoding: UTF-8
class HomepageController < ApplicationController
  def index
    @title = "Servicios de asesoría en Ecuador y Colombia"
    @programs = Program.actives
  end
  def mision
    @title = "Misión"
  end
  
  def vision
    @title = "Visión"
  end
end
