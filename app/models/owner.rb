class Owner < ActiveRecord::Base
  # TODO: add validations
  validates :first_name, length: {maximum: 255}, presence: true
  validates :last_name, length: {maximum: 255}, presence: true
  validates :email, length: {maximum: 255}, uniqueness: true, format: {with: /\@/}, presence: true

  before_save :normalize_phone_number
  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    if phone.present?
      phone.gsub!(/^1/, "")
      phone.gsub!(/[(),.-]/, "")
    end
    # stretch
  end

end
