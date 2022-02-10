class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :lead_time

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :title, :explanation, presence: true
  validates :price, presence: true, numericality: { greater_than: 299, less_than: 10_000_000 }

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :lead_time_id, numericality: { other_than: 1 }
end
