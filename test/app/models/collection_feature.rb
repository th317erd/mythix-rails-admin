# frozen_string_literal: true

require 'open-uri'
require 'net/http'

class CollectionFeature < ApplicationRecord
  belongs_to :feature
  belongs_to :collection
  has_many :showtimes, -> { where('showtime_at > ?', Time.now - 90.minutes).order(:showtime_at) }, dependent: :destroy
  has_many :all_showtimes, -> { order(:showtime_at) }, class_name: 'Showtime'
  has_one :exhibitor, through: :collection
  has_one :venue, through: :collection
  has_many :roles, as: :rolable
  has_many :purchases, as: :purchasable
  has_many :verbiages, as: :verbiagable
  has_many :coupons, as: :discountable
  has_many :addon_groups, as: :addonable
  has_many :terms, as: :termable, class_name: 'Terms'
  has_many :slideshows, -> { order('slideshows.priority ASC') }
  has_many :showtime_blocks
  belongs_to :price, optional: true # Added 'optional: true' to support the 'add_to_collection' functionality in Feature

  scope :active, lambda {
                   where('collection_features.available_at < :current_time AND (collection_features.closes_at IS NULL OR collection_features.closes_at > :current_time)', { current_time: Time.now })
                 }
  scope :active_cum_closed_last_30_days, lambda {
                                           where('collection_features.available_at < :current_time AND (collection_features.closes_at IS NULL OR collection_features.closes_at > :last_30)', { current_time: Time.now, last_30: Time.now - 30.days })
                                         }
  scope :native, -> { joins(:feature).where("features.platform = 'native'") }
  scope :foreign, -> { joins(:feature).where("features.platform != 'native'") }
  scope :promoted, lambda {
                     active.where('promote_at IS NOT NULL AND promote_at < ?', Time.now).order('promote_at DESC')
                   }
  scope :active_feature, lambda {
                           joins(:feature).where('features.expires_at IS NULL OR features.expires_at > :current_time', { current_time: Time.now })
                         }
  scope :active_status,  -> { where("collection_features.status IS NULL OR collection_features.status='active'") }
  scope :archived, -> { where("collection_features.status='archived'") }
end
