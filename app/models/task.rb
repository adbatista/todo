class Task < ActiveRecord::Base
  enum status: %i{ active completed }

  scope :completed, ->{ where(status: statuses[:completed]) }
  scope :active,    ->{ where(status: statuses[:active]) }

  def to_s
    task
  end

  def self.valid_status?(status)
    statuses.keys.include? status
  end
end