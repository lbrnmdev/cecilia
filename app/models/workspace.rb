class Workspace < ApplicationRecord
  has_secure_token :sign_up_code
end
