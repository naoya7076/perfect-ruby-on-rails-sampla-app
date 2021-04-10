class Event < ApplicationRecord
  belongs_to :owner, class_name: "User"
  validates :name, presence: true, length: {maximum: 50}
  validates :place, presence: true, length: {maximum: 100}
  validates :content, presence: true, length: {maximum: 200}
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_at_shoud_be_before_end_at

  private

  def start_at_shoud_be_before_end_at
    return unless start_at && end_at
    
    if start_at >= end_at
      errors.add(:start_at, "は終了時間よりも前に設定してください") 
    end
  end
end
