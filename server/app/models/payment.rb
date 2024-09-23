class Payment < ApplicationRecord
  belongs_to :user, depenedent: :destroy
end
