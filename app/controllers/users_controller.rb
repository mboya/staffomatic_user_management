class UsersController < ApplicationController
  def index
    render jsonapi: User.active
  end

  def archive
    user = find_user
    if user
      user&.update(archive: !user.archive)

      NotifieerJob.set(wait: 20.second).perform_later(user)

      render jsonapi: user
    else
      render json: {
        error: 'Record not Found'
      }, status: :not_found
    end
  end

  private

  def id
    params.dig(:user_id)
  end

  def find_user
    User.find_by(id: id)
  end
end
