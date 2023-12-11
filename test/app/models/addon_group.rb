# frozen_string_literal: true

class AddonGroup < ApplicationRecord
  has_many :addons, -> { where("status IS NULL OR status='active'").order('priority ASC') }
  belongs_to :addonable, polymorphic: true
  has_many :coupons, as: :discountable
  belongs_to :exhibitor

  default_scope -> { where("status IS NULL OR status='active'").order('priority ASC') }
end
