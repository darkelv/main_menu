class Position < ActiveRecord::Base
  KINDS = {
    new: 0,
    active: 1,
    blocked: 2
  }

  enum kind: KINDS, _prefix: :is

  belongs_to :parent, class_name: 'Position', foreign_key: :parent_id, optional: true
  has_many :child_positions, class_name: 'Position', foreign_key: :parent_id, dependent: :destroy

  def move_to_next_status(new_status)
    self.send("is_#{new_status}!") if need_change_status?(new_status.to_sym)
  end

  private

  def need_change_status?(new_status)
    return false if new_status == kind
    return true if new_status == :blocked

    case new_status
      when :new
        return true if is_blocked?
      when :active
        return true if is_new?
    end

    false
  end
end
