# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: :new # rubocop:disable Rails/LexicallyScopedActionFilter

  # rubocop:disable Metrics/AbcSize
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(
      :notice,
      :signed_in,
      first_name: resource.first_name,
      last_name: resource.last_name
    )
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end
  # rubocop:enable Metrics/AbcSize
end
