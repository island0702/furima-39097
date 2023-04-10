class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :area_of_origin
  belongs_to :estimated_sipping_date
  belongs_to :user
  has_one_attached :image
  has_one :buy

  validates :image,                         presence: true
  validates :name,                          presence: true
  validates :detail,                        presence: true
  validates :category_id,                   numericality: { other_than: 1, message: 'Select' }
  validates :condition_id,                  numericality: { other_than: 1, message: 'Select' }
  validates :shipping_cost_id,              numericality: { other_than: 1, message: 'Select' }
  validates :area_of_origin_id,             numericality: { other_than: 1, message: 'Select' }
  validates :estimated_sipping_date_id,     numericality: { other_than: 1, message: 'Select' }

  with_options presence: true do
    validates :selling_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                              presence: { message: 'Please enter within the range of values' }
  end
end
