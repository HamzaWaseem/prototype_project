class User < ApplicationRecord

  # include PublicActivity::Model
  # tracked

  rolify
  # attr_accessible :role_ids
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :forms
  has_one :notification
  validates :email, presence: true


  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  phone                  :string(255)
#  parent_id              :integer
#  commission             :float(24)
#  limit_amount           :float(24)        default(0.0)
#  amount_used            :float(24)        default(0.0)
#
