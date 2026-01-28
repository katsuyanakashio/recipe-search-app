class Category < ApplicationRecord
  has_many :recipes, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  
  # カテゴリー名で検索
  scope :search_by_name, ->(name) { where('name LIKE ?', "%#{name}%") if name.present? }
end