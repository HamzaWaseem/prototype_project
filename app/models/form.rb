class Form < ApplicationRecord
  # include PublicActivity::Model
  # tracked

  belongs_to :user

  validates :department, presence: true, format: { with: //, message: "Can't be blank" }
  validates :category, presence: true, format: { with: //, message: "Can't be blank" }
  validates :date_started, presence: true, format: { with: //, message: "Can't be blank" }
  validates :date_completed, presence: true, format: { with: //, message: "Can't be blank" }
  validates :category_level, presence: true, format: { with: //, message: "Can't be blank" }
  validates :summary_of_problem, presence: true, format: { with: //, message: "Can't be blank" }
  validates :impact, presence: true, format: { with: //, message: "Can't be blank" }
  validates :applicable_to_other_areas, presence: true, format: { with: //, message: "Can't be blank" }
  validates :solution_applied, presence: true, format: { with: //, message: "Can't be blank" }

end
