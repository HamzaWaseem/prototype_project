class Form < ApplicationRecord
  # include PublicActivity::Model
  # tracked

  belongs_to :user
end
