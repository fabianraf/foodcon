class Notifier < ActionMailer::Base
  
  TEST_RECIPIENT = ["fabianraf@gmail.com"]
  default :from => "fabianraf@gmail.com"
  
  def send_information(contact_us)    
    if Rails.env.production?
      @emails = "davidaguirrerodriguez@gmail.com"
    else
      @emails = TEST_RECIPIENT
    end    
    @contact_us = contact_us          
    #@program = @contact_us.program.name if !@contact_us.program.nil?               
    if Rails.env.production?                                       
      mail(:to => @emails, :subject => "Contáctenos - #{@contact_us.full_name}" )
    else
      mail(:to => @emails, :subject => "#{Rails.env} - Contáctenos - #{@contact_us.full_name}" )
    end
    
  end
end