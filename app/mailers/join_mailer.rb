class JoinMailer < ActionMailer::Base
  default :from => "Join_the_team@design4tomorrow.net"
  
  def join_email(join)
    @join = join
    mail(:to => "admin@design4tomorrow.net", :subject => "design4tomorrow Applicant" )
  end
end
