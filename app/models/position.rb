class Position < ApplicationRecord
  include AASM

  KINDS = {
    draft: 0,
    active: 1,
    blocked: 2
  }

  enum kind: KINDS

  belongs_to :parent, class_name: 'Position', foreign_key: :parent_id, optional: true
  has_many :child_positions, class_name: 'Position', foreign_key: :parent_id, dependent: :destroy

  aasm :column => :kind, :enum => true do
    state :draft, initial: :true
    state :active, :blocked

    event :active do
      transitions from: :draft, to: :active
    end

    event :blocked do
      transitions from: [:draft, :active], to: :blocked
    end

    event :draft do
      transitions from: :blocked, to: :draft
    end
  end

  def parent_name
    parent&.name
  end
end
