class SignupMailer < ActionMailer::Base
  default :from => "sign_up@design4tomorrow.net"
  
  def signup_email(sign_up)
    @sign_up = sign_up
    mail(:to => "admin@design4tomorrow.net", :subject => "Someone Signed Up" )
  end
end