class Book < ApplicationRecord
  has_many :user_books
  has_many :users, through: :user_books

  validate :published_date_cannot_be_in_the_future

  private

  def published_date_cannot_be_in_the_future
    if published_date.present? && published_date > Date.today
      errors.add(:published_date, "can't be in the future")
    end
  end
end
