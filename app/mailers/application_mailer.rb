class ApplicationMailer < ActionMailer::Base
  default from: "noreply@twoacres.co"
  # layout 'mailer'


  def notice_sign_up(email)
  	# Marcus@twoacres.co
  	mail(to: "marcus@twoacres.co", subject: "User Sign Up", from: "noreply@twoacres.co", body: "Hi, #{email} sign up as lobster user.")
  end

end
