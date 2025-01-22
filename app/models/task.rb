class Task < ApplicationRecord
  STATUS = %w[not_started completed].freeze
  validates :title, :description, presence: true
  validates :description, length: { minimum: 12 }
  validates :status, inclusion: { in: STATUS }

  before_validation :default_status

  broadcasts_to ->(task) { "tasks" }, inserts_by: :append


  private

  def default_status
    self.status = "not_started"
  end
end
