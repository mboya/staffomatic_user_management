class NotifieerJob < ApplicationJob
  queue_as :default

  def perform(item)
    User.active.each do |user|
      NotifierMailer.archive_unarchive_user(user, item.archive)
    #  from here we can also call a third party
    # same as to a push using MessageBus or any of choice
    end
  end

end
