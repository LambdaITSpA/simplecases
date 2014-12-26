class UserMailer < ActionMailer::Base
  def test(user)
  	@user = user
    mail(to: user.email, subject: "Notificaciones Simple Cases")
  end
end