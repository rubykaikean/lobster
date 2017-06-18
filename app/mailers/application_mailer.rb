class ApplicationMailer < ActionMailer::Base
  default from: "noreply@twoacres.co"
  # layout 'mailer'


  def notice_sign_up(email)
  	# Marcus@twoacres.co
  	mail(to: "khongkk89@gmail.com", subject: "User Sign Up", from: "#{email}", body: "Hi, #{email} sign up as lobster user.")
  end

end
