class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :region
  belongs_to :delivery_day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :region_id
    validates :delivery_days_id
  end
end
