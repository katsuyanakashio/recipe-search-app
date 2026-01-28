class Recipe < ApplicationRecord
  belongs_to :category
  
  # バリデーション
  validates :title, presence: true
  validates :cooking_time, numericality: { greater_than: 0, allow_nil: true }
  validates :servings, numericality: { greater_than: 0, allow_nil: true }
  validates :difficulty, inclusion: { in: %w[簡単 普通 難しい], allow_nil: true }
  
  # Ransack用の検索可能な属性
  def self.ransackable_attributes(auth_object = nil)
    %w[title description ingredients difficulty cooking_time category_id created_at updated_at]
  end
  
  def self.ransackable_associations(auth_object = nil)
    %w[category]
  end
  
  # スコープ
  scope :recent, -> { order(created_at: :desc) }
  scope :by_difficulty, ->(difficulty) { where(difficulty: difficulty) if difficulty.present? }
  scope :quick_recipes, -> { where('cooking_time <= ?', 30) }
  
  # 検索メソッド
  def self.search(query)
    if query.present?
      where('title LIKE ? OR description LIKE ? OR ingredients LIKE ?', 
            "%#{query}%", "%#{query}%", "%#{query}%")
    else
      all
    end
  end
end