class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController

  # context available within jsonapi resource classes
  def context
    {
      params: params
    }
  end
end
