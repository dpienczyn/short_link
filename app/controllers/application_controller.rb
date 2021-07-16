class ApplicationController < ActionController::API
  include Knock::Authenticable
  include JSONAPI::Errors
end
