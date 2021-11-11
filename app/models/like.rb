class Like < ApplicationRecord
  belongs_to :user
  belongs_to :food
  validates :user_id, uniqueness: {
    scope: :food_id,
    message: "は同じ投稿に2回以上いいねはできません",
  }
  validate :my_food_cannot_like

  private

  def my_food_cannot_like
    errors.add(:base, "自分の投稿にいいねはできません") if user_id == food.user_id
  end
end
