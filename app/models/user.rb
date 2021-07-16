class User < ApplicationRecord
 has_secure_password

 validates :email,
  presence: true,
  uniqueness: true,
  format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.from_token_request(request)
    User.find_by(email: request.params.fetch(:auth, {}).fetch(:email, nil))
  end
end
