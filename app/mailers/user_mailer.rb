class UserMailer < ApplicationMailer
  # default from: 'PMT <purvrajdodia@gmail.com>'
  default from: '<collapro.pmt@gmail.com>'

  def welcome_email
    @user = params[:user]
    mail(to: "vaisvik.chaudhary@bacancy.com", subject: 'Welcome to My Awesome Site')
  end

end
