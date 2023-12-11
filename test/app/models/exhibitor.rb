# frozen_string_literal: true

class Exhibitor < ApplicationRecord
  has_many :collections, -> { order('priority ASC') }
  has_many :venues, -> { order('priority ASC') }
  has_many :collection_features, through: :collections
  has_many :features, through: :collection_features
  validates_presence_of :name
  has_many :roles, as: :rolable
  has_and_belongs_to_many :users, join_table: :users_exhibitors
  has_many :purchases
  has_many :verbiages, as: :verbiagable
  has_many :terms, as: :termable, class_name: 'Terms'
  has_many :verbiages_can_admin, class_name: 'Verbiage', foreign_key: :exhibitor_id
  has_many :payments
  has_many :dashboards
  has_many :addons, -> { order('priority ASC') }
  # Currently addons_can_admin is just an alias of addons.
  # Added her in anticipation of allowing addons to be addonable
  # as coupons and verbiages are.
  has_many :addon_groups_can_admin, -> { order('priority ASC') }, class_name: 'AddonGroup', foreign_key: :exhibitor_id
  has_many :addons_can_admin, -> { order('priority ASC') }, class_name: 'Addon', foreign_key: :exhibitor_id
  has_many :coupons, as: :discountable
  has_many :addon_groups, as: :addonable
  has_many :coupons_can_admin, class_name: 'Coupon', foreign_key: :exhibitor_id
  has_many :showtime_block_can_admin, class_name: 'ShowtimeBlock', foreign_key: :exhibitor_id
  has_many :showtime_can_admin, through: :showtime_block_can_admin, source: :showtimes
  belongs_to :cohort, optional: true
  has_many :assets
  has_many :showtime_blocks
  has_many :video_assets, lambda {
                            joins(:encodes).where('assets.kind="video" AND encodes.completed_at IS NOT NULL').distinct
                          }, class_name: 'Asset', foreign_key: :exhibitor_id
  has_many :memberships, -> { order('priority ASC') }
  has_many :membership_eligibles
  has_many :payment_terminals
  has_many :loyalties
  has_many :loyalty_points
  has_many :loyalty_users
  has_many :membership_gifts
  has_many :prices
  has_many :campaigns

  serialize :sales_tax_states
  serialize :geofencing
end
