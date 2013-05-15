class Notifier < ActionMailer::Base
  
  TEST_RECIPIENT = ["fabianraf@gmail.com"]
  PRODUCTION_RECIPIENT = ["info@foodcon.net", "davidaguirrerodriguez@gmail.com"]
  default :from => "info@foodnet.net"
  
  def send_information(contact_us)    
    if Rails.env.production?
      @emails = PRODUCTION_RECIPIENT
    else
      @emails = TEST_RECIPIENT
    end    
    @contact_us = contact_us          
    if Rails.env.production?                                       
      mail(:to => @emails, :subject => "Contáctenos - #{@contact_us.full_name}" )
    else
      mail(:to => @emails, :subject => "#{Rails.env} - Contáctenos - #{@contact_us.full_name}" )
    end
    
  end
end