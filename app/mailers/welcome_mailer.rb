class WelcomeMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome.contact.subject
  #
  def contact(name, email, body)
    @name = name; @email = email; @body = body;
    mail to: "cguerra.lambdait@gmail.com, plozano.lambdait@gmail.com", reply_to: email, subject: 'Contacto Simple Cases'
  end
end
