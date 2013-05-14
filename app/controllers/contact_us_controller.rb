class ContactUsController < ApplicationController
  def index
    @contact_us = ContactUs.new
    @contact_us.build_program
    @title = "Contáctenos"
    render :new
  end
  def new
    
  end
  
  def create
    @contact_us = ContactUs.new(params[:contact_us])
    respond_to do |format| 
      if @contact_us.save                              
        Notifier.send_information(@contact_us).deliver
        format.html { redirect_to gracias_contact_us_path }
      else
        format.html { render :new, :locals => {:contact_us => @contact_us} }
        format.xml  { render :xml => @contact_us.errors, :status => :unprocessable_entity }
      end
    end
  end
end
