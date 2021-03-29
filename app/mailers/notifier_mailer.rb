class NotifierMailer < ApplicationMailer
  default from: "admin@easypep.de"

  def archive_unarchive_user(user, state)
    @user = user
    mail(to: @user.email, subject: "#{state}d user")
  end

end
