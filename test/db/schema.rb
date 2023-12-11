# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_231_105_183_119) do
  create_table 'active_admin_comments', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index [ 'namespace' ], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'addon_groups', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'name'
    t.text 'intro'
    t.integer 'addonable_id'
    t.string 'addonable_type'
    t.integer 'priority'
    t.bigint 'exhibitor_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'status'
    t.boolean 'allow_multiple'
    t.index %w[addonable_id addonable_type], name: 'index_addon_groups_on_addonable_id_and_addonable_type'
    t.index [ 'priority' ], name: 'index_addon_groups_on_priority'
    t.index [ 'status' ], name: 'index_addon_groups_on_status'
  end

  create_table 'addon_options', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'name'
    t.integer 'priority'
    t.integer 'price'
    t.bigint 'addon_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'max_purchases'
    t.integer 'total_purchases'
    t.index [ 'addon_id' ], name: 'index_addon_options_on_addon_id'
    t.index [ 'priority' ], name: 'index_addon_options_on_priority'
  end

  create_table 'addons', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.bigint 'exhibitor_id'
    t.string 'name'
    t.integer 'price'
    t.integer 'priority'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'taxable'
    t.boolean 'discounts_apply'
    t.bigint 'addon_group_id'
    t.boolean 'offer_pickup'
    t.string 'status'
    t.boolean 'allow_multiple'
    t.string 'kind'
    t.integer 'max_purchases'
    t.integer 'total_purchases'
    t.index [ 'exhibitor_id' ], name: 'index_addons_on_exhibitor_id'
    t.index [ 'priority' ], name: 'index_addons_on_priority'
    t.index [ 'status' ], name: 'index_addons_on_status'
  end

  create_table 'assets', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'kind'
    t.bigint 'created_by_user_id'
    t.integer 'exhibitor_id'
    t.string 'file'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'exhibitor_id' ], name: 'index_assets_on_exhibitor_id'
    t.index [ 'kind' ], name: 'index_assets_on_kind'
  end

  create_table 'auto_sessions', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'code'
    t.datetime 'effective_at', precision: nil
    t.datetime 'expires_at', precision: nil
    t.string 'destination'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'campaigns', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'exhibitor_id'
    t.string 'name'
    t.string 'slug'
    t.datetime 'effective_at'
    t.datetime 'expires_at'
    t.text 'intro'
    t.text 'custom_styles'
    t.string 'background_url'
    t.boolean 'default'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'default' ], name: 'index_campaigns_on_default'
    t.index [ 'effective_at' ], name: 'index_campaigns_on_effective_at'
    t.index [ 'exhibitor_id' ], name: 'index_campaigns_on_exhibitor_id'
    t.index [ 'expires_at' ], name: 'index_campaigns_on_expires_at'
    t.index [ 'slug' ], name: 'index_campaigns_on_slug'
  end

  create_table 'cohorts', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'collection_features', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'feature_id'
    t.integer 'collection_id'
    t.text 'intro'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'promote_at', precision: nil
    t.string 'plan_id'
    t.boolean 'offer_on_demand'
    t.datetime 'available_at', precision: nil
    t.string 'feature_slug'
    t.datetime 'opens_at', precision: nil
    t.datetime 'closes_at', precision: nil
    t.integer 'priority'
    t.integer 'old_price'
    t.text 'receipt_note'
    t.string 'status'
    t.string 'lifecycle_label'
    t.integer 'max_purchases'
    t.integer 'total_purchases'
    t.text 'trailer_preroll'
    t.text 'trailer_postroll'
    t.text 'feature_preroll'
    t.text 'feature_postroll'
    t.integer 'price_id'
    t.boolean 'offer_rsvp', default: false
    t.index [ 'available_at' ], name: 'index_collection_features_on_available_at'
    t.index [ 'closes_at' ], name: 'index_collection_features_on_closes_at'
    t.index [ 'collection_id' ], name: 'index_collection_features_on_collection_id'
    t.index [ 'feature_id' ], name: 'index_collection_features_on_feature_id'
    t.index [ 'price_id' ], name: 'index_collection_features_on_price_id'
    t.index [ 'priority' ], name: 'index_collection_features_on_priority'
    t.index [ 'status' ], name: 'index_collection_features_on_status'
  end

  create_table 'collections', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'title'
    t.string 'slug'
    t.text 'intro'
    t.integer 'exhibitor_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'display_list'
    t.text 'custom_styles'
    t.bigint 'sync_to_collection_id'
    t.boolean 'offer_showtimes'
    t.boolean 'show_in_menu'
    t.integer 'priority'
    t.string 'logo_url'
    t.string 'color_logo_url'
    t.integer 'sync_source_for_library_id'
    t.integer 'old_price'
    t.datetime 'published_at', precision: nil
    t.string 'geofencing'
    t.integer 'venue_id'
    t.integer 'price_id'
    t.index [ 'exhibitor_id' ], name: 'index_collections_on_exhibitor_id'
    t.index [ 'price_id' ], name: 'index_collections_on_price_id'
    t.index [ 'published_at' ], name: 'index_collections_on_published_at'
    t.index [ 'slug' ], name: 'index_collections_on_slug'
  end

  create_table 'coupons', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'name'
    t.string 'code'
    t.datetime 'effective_at', precision: nil
    t.datetime 'expires_at', precision: nil
    t.integer 'max_uses'
    t.string 'discount_unit'
    t.integer 'discount'
    t.integer 'discountable_id'
    t.string 'discountable_type'
    t.integer 'uses'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'exhibitor_id'
    t.integer 'created_by_user_id'
    t.boolean 'applies_to_features'
    t.boolean 'applies_to_addons'
    t.text 'message'
    t.bigint 'payment_id'
    t.string 'kind', default: 'coupon'
    t.text 'valid_days'
    t.index [ 'code' ], name: 'index_coupons_on_code'
    t.index %w[discountable_type discountable_id kind],
            name: 'index_coupons_on_discountable_type_and_discountable_id_and_kind'
    t.index [ 'effective_at' ], name: 'index_coupons_on_effective_at'
    t.index %w[exhibitor_id kind], name: 'index_coupons_on_exhibitor_id_and_kind'
    t.index [ 'exhibitor_id' ], name: 'index_coupons_on_exhibitor_id'
    t.index [ 'expires_at' ], name: 'index_coupons_on_expires_at'
    t.index [ 'kind' ], name: 'index_coupons_on_kind'
    t.index [ 'max_uses' ], name: 'index_coupons_on_max_uses'
    t.index [ 'uses' ], name: 'index_coupons_on_uses'
  end

  create_table 'dashboards', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'name'
    t.string 'url'
    t.integer 'priority'
    t.integer 'exhibitor_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'delayed_jobs', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'priority', default: 0, null: false
    t.integer 'attempts', default: 0, null: false
    t.text 'handler', null: false
    t.text 'last_error'
    t.datetime 'run_at', precision: nil
    t.datetime 'locked_at', precision: nil
    t.datetime 'failed_at', precision: nil
    t.string 'locked_by'
    t.string 'queue'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w[priority run_at], name: 'delayed_jobs_priority'
  end

  create_table 'delivereds', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'mailer'
    t.datetime 'delivered_at', precision: nil
    t.string 'via'
    t.string 'subject'
    t.text 'body'
    t.text 'recipient'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'devices', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'code'
    t.integer 'user_id'
    t.datetime 'activated_at', precision: nil
    t.string 'device'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'activated_at' ], name: 'index_devices_on_activated_at'
    t.index [ 'code' ], name: 'index_devices_on_code'
    t.index [ 'user_id' ], name: 'index_devices_on_user_id'
  end

  create_table 'distributors', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'encode_steps', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'encode_id'
    t.integer 'asset_id'
    t.string 'step'
    t.integer 'progress'
    t.datetime 'started_at', precision: nil
    t.datetime 'completed_at', precision: nil
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'encodes', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'asset_id'
    t.string 'encoder'
    t.datetime 'enqueued_at', precision: nil
    t.datetime 'started_at', precision: nil
    t.datetime 'completed_at', precision: nil
    t.text 'params'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'failed_at', precision: nil
    t.text 'last_error'
  end

  create_table 'exhibitors', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'name'
    t.string 'slug'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'hostname'
    t.string 'tos_url'
    t.string 'privacy_policy_url'
    t.string 'help_url'
    t.string 'timezone'
    t.integer 'timezone_offset'
    t.string 'faq_url'
    t.string 'home_url'
    t.string 'logo_style'
    t.text 'custom_styles'
    t.string 'connected'
    t.string 'fee_unit'
    t.integer 'fee'
    t.string 'silhouette_logo_url'
    t.string 'color_logo_url'
    t.string 'accent_color'
    t.string 'background_style'
    t.string 'facebook_page'
    t.string 'twitter_handle'
    t.string 'instagram_handle'
    t.bigint 'cohort_id'
    t.string 'short_name'
    t.float 'sales_tax_rate'
    t.text 'sales_tax_states'
    t.string 'tax_payer'
    t.string 'address'
    t.string 'city'
    t.string 'state'
    t.string 'zip_code'
    t.string 'media_hostname'
    t.boolean 'offer_gift_codes'
    t.string 'geofencing'
    t.boolean 'offer_membership'
    t.string 'membership_name'
    t.boolean 'offer_loyalty'
    t.integer 'loyalty_validity_days'
    t.string 'loyalty_name'
    t.boolean 'offer_stand_alone_addons'
    t.boolean 'observe_dst'
    t.boolean 'offer_stand_alone_donations'
    t.string 'address2', limit: 128
    t.index [ 'facebook_page' ], name: 'index_exhibitors_on_facebook_page'
    t.index [ 'hostname' ], name: 'index_exhibitors_on_hostname'
    t.index [ 'instagram_handle' ], name: 'index_exhibitors_on_instagram_handle'
    t.index [ 'short_name' ], name: 'index_exhibitors_on_short_name'
    t.index [ 'twitter_handle' ], name: 'index_exhibitors_on_twitter_handle'
  end

  create_table 'features', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'title'
    t.text 'trailer_url'
    t.text 'feature_url'
    t.string 'hero_url'
    t.string 'poster_url'
    t.string 'thumbnail_url'
    t.string 'runtime'
    t.string 'mpaa_rating'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'platform'
    t.string 'purchase_url'
    t.string 'affiliate_url'
    t.text 'description'
    t.string 'distributor'
    t.string 'slug'
    t.datetime 'available_at', precision: nil
    t.text 'intro'
    t.bigint 'library_id'
    t.datetime 'expires_at', precision: nil
    t.integer 'access_duration_hours'
    t.integer 'window_duration_hours'
    t.integer 'old_price'
    t.datetime 'closes_at', precision: nil
    t.string 'delivery'
    t.string 'status'
    t.string 'captions_url'
    t.string 'geofencing'
    t.string 'portrait_poster_url'
    t.string 'portrait_thumbnail_url'
    t.string 'genre'
    t.integer 'price_id'
    t.index [ 'available_at' ], name: 'index_features_on_available_at'
    t.index [ 'closes_at' ], name: 'index_features_on_closes_at'
    t.index [ 'expires_at' ], name: 'index_features_on_expires_at'
    t.index [ 'library_id' ], name: 'index_features_on_library_id'
    t.index [ 'price_id' ], name: 'index_features_on_price_id'
    t.index [ 'status' ], name: 'index_features_on_status'
  end

  create_table 'invitations', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'code'
    t.datetime 'redeemed_at', precision: nil
    t.integer 'exhibitor_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'ip_addies', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'address'
    t.text 'data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'address' ], name: 'index_ip_addies_on_address'
  end

  create_table 'libraries', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'geofencing'
  end

  create_table 'loyalties', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'exhibitor_id'
    t.string 'name'
    t.text 'description'
    t.datetime 'effective_at', precision: nil
    t.datetime 'expires_at', precision: nil
    t.integer 'points'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'effective_at' ], name: 'index_loyalties_on_effective_at'
    t.index [ 'exhibitor_id' ], name: 'index_loyalties_on_exhibitor_id'
    t.index [ 'expires_at' ], name: 'index_loyalties_on_expires_at'
    t.index [ 'points' ], name: 'index_loyalties_on_points'
  end

  create_table 'loyalty_coupon_users', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'loyalty_user_id'
    t.integer 'loyalty_id'
    t.integer 'coupon_id'
    t.integer 'used_points'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'loyalty_coupons', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'coupon_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'loyalty_id'
    t.index [ 'coupon_id' ], name: 'index_loyalty_coupons_on_coupon_id'
  end

  create_table 'loyalty_points', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'exhibitor_id'
    t.integer 'user_id'
    t.integer 'payment_id'
    t.integer 'points'
    t.datetime 'effective_at', precision: nil
    t.datetime 'expires_at', precision: nil
    t.datetime 'redeemed_at', precision: nil
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'notes'
    t.datetime 'donated_at'
    t.index [ 'effective_at' ], name: 'index_loyalty_points_on_effective_at'
    t.index [ 'exhibitor_id' ], name: 'index_loyalty_points_on_exhibitor_id'
    t.index [ 'expires_at' ], name: 'index_loyalty_points_on_expires_at'
    t.index [ 'points' ], name: 'index_loyalty_points_on_points'
    t.index [ 'redeemed_at' ], name: 'index_loyalty_points_on_redeemed_at'
    t.index [ 'user_id' ], name: 'index_loyalty_points_on_user_id'
  end

  create_table 'loyalty_users', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'exhibitor_id'
    t.integer 'user_id'
    t.integer 'payment_id'
    t.datetime 'redeemed_at', precision: nil
    t.integer 'net_used_points'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'membership_coupons', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'coupon_id'
    t.integer 'membership_id'
    t.integer 'max_uses'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'max_uses_per_showtime'
  end

  create_table 'membership_eligibles', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'phone'
    t.string 'membership_id'
    t.string 'exhibitor_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'ignored_at'
    t.index [ 'ignored_at' ], name: 'index_membership_eligibles_on_ignored_at'
  end

  create_table 'membership_gifts', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'email'
    t.integer 'membership_plan_id'
    t.integer 'exhibitor_id'
    t.integer 'payment_id'
    t.integer 'gifted_by_user_id'
    t.datetime 'effective_at'
    t.datetime 'redeemed_at'
    t.string 'code'
    t.integer 'user_id'
    t.text 'message'
    t.string 'redeemable_type'
    t.bigint 'redeemable_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'created_by_user_id'
    t.integer 'venue_id'
    t.index [ 'code' ], name: 'index_membership_gifts_on_code'
    t.index [ 'effective_at' ], name: 'index_membership_gifts_on_effective_at'
    t.index [ 'email' ], name: 'index_membership_gifts_on_email'
    t.index [ 'exhibitor_id' ], name: 'index_membership_gifts_on_exhibitor_id'
    t.index [ 'redeemed_at' ], name: 'index_membership_gifts_on_redeemed_at'
    t.index [ 'venue_id' ], name: 'index_membership_gifts_on_venue_id'
  end

  create_table 'membership_grant_coupons', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'membership_id'
    t.integer 'user_id'
    t.integer 'coupon_id'
    t.integer 'max_uses'
    t.integer 'total_uses'
    t.integer 'membership_coupon_id'
    t.string 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'membership_grant_id'
  end

  create_table 'membership_grant_users', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'membership_grant_id'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'membership_grant_id' ], name: 'index_membership_grant_users_on_membership_grant_id'
    t.index [ 'user_id' ], name: 'index_membership_grant_users_on_user_id'
  end

  create_table 'membership_grants', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'membership_id'
    t.integer 'user_id'
    t.datetime 'effective_at', precision: nil
    t.datetime 'expires_at', precision: nil
    t.boolean 'auto_renew'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'membership_plan_id'
    t.integer 'renewals'
    t.integer 'unpaid_value'
    t.integer 'repaid_value'
    t.integer 'granted_by_user_id'
    t.string 'memo'
    t.datetime 'last_notified_of_expiration_at'
    t.integer 'campaign_id'
    t.index [ 'auto_renew' ], name: 'index_membership_grants_on_auto_renew'
    t.index [ 'campaign_id' ], name: 'index_membership_grants_on_campaign_id'
    t.index [ 'effective_at' ], name: 'index_membership_grants_on_effective_at'
    t.index [ 'expires_at' ], name: 'index_membership_grants_on_expires_at'
    t.index [ 'last_notified_of_expiration_at' ], name: 'index_membership_grants_on_last_notified_of_expiration_at'
    t.index [ 'membership_id' ], name: 'index_membership_grants_on_membership_id'
    t.index [ 'membership_plan_id' ], name: 'index_membership_grants_on_membership_plan_id'
    t.index [ 'repaid_value' ], name: 'index_membership_grants_on_repaid_value'
    t.index [ 'unpaid_value' ], name: 'index_membership_grants_on_unpaid_value'
    t.index [ 'user_id' ], name: 'index_membership_grants_on_user_id'
  end

  create_table 'membership_payments', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.bigint 'membership_grant_id'
    t.bigint 'payment_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'membership_plans', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'duration'
    t.string 'duration_units'
    t.integer 'price'
    t.string 'payment_duration_units'
    t.boolean 'allow_early_cancellation'
    t.integer 'membership_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'kind'
    t.datetime 'effective_at'
    t.datetime 'expires_at'
    t.index [ 'duration_units' ], name: 'index_membership_plans_on_duration_units'
    t.index [ 'effective_at' ], name: 'index_membership_plans_on_effective_at'
    t.index [ 'expires_at' ], name: 'index_membership_plans_on_expires_at'
    t.index [ 'kind' ], name: 'index_membership_plans_on_kind'
    t.index [ 'membership_id' ], name: 'index_membership_plans_on_membership_id'
    t.index [ 'payment_duration_units' ], name: 'index_membership_plans_on_payment_duration_units'
  end

  create_table 'memberships', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'exhibitor_id'
    t.string 'name'
    t.text 'description'
    t.integer 'priority'
    t.datetime 'effective_at', precision: nil
    t.datetime 'expires_at', precision: nil
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'upgrade_tier', default: 1
    t.string 'slug'
    t.text 'email_welcome'
    t.integer 'max_users', default: 1
    t.index [ 'effective_at' ], name: 'index_memberships_on_effective_at'
    t.index [ 'exhibitor_id' ], name: 'index_memberships_on_exhibitor_id'
    t.index [ 'expires_at' ], name: 'index_memberships_on_expires_at'
    t.index [ 'priority' ], name: 'index_memberships_on_priority'
    t.index [ 'slug' ], name: 'index_memberships_on_slug'
  end

  create_table 'payment_coupons', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'coupon_id'
    t.integer 'discountable_id'
    t.string 'discountable_type'
    t.integer 'quantity'
    t.integer 'discount_amount'
    t.string 'kind'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'coupon_id' ], name: 'index_payment_coupons_on_coupon_id'
    t.index %w[discountable_id discountable_type],
            name: 'index_payment_coupons_on_discountable_id_and_discountable_type'
  end

  create_table 'payment_integrations', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'type', limit: 64, null: false
    t.bigint 'payable_id', null: false
    t.string 'payable_type', limit: 64, null: false
    t.bigint 'system_integration_id', null: false
    t.string 'system_integration_type', limit: 64, null: false
    t.string 'foreign_id', limit: 32
    t.datetime 'last_sync_at'
    t.text 'metadata'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'created_at' ], name: 'index_payment_integrations_on_created_at'
    t.index [ 'foreign_id' ], name: 'index_payment_integrations_on_foreign_id'
    t.index %w[id type], name: 'pi_id_type_combo', unique: true
    t.index [ 'last_sync_at' ], name: 'index_payment_integrations_on_last_sync_at'
    t.index %w[payable_id payable_type], name: 'pi_payable_id_type_combo'
    t.index [ 'payable_id' ], name: 'index_payment_integrations_on_payable_id'
    t.index [ 'payable_type' ], name: 'index_payment_integrations_on_payable_type'
    t.index %w[system_integration_id system_integration_type], name: 'pi_si_id_type_combo'
    t.index [ 'system_integration_id' ], name: 'index_payment_integrations_on_system_integration_id'
    t.index [ 'system_integration_type' ], name: 'index_payment_integrations_on_system_integration_type'
    t.index [ 'type' ], name: 'index_payment_integrations_on_type'
    t.index [ 'updated_at' ], name: 'index_payment_integrations_on_updated_at'
  end

  create_table 'payment_items', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.bigint 'payment_id'
    t.bigint 'user_id'
    t.bigint 'exhibitor_id'
    t.string 'item_type'
    t.bigint 'item_id'
    t.integer 'amount'
    t.integer 'sales_tax_amount'
    t.integer 'refunded_amount'
    t.integer 'refunded_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'discount_amount'
    t.integer 'net_amount'
    t.bigint 'coupon_id'
    t.integer 'quantity'
    t.integer 'total_net_amount'
    t.integer 'total_discount_amount'
    t.index [ 'exhibitor_id' ], name: 'index_payment_items_on_exhibitor_id'
    t.index %w[item_type item_id], name: 'index_payment_items_on_item_type_and_item_id'
    t.index [ 'payment_id' ], name: 'index_payment_items_on_payment_id'
    t.index [ 'user_id' ], name: 'index_payment_items_on_user_id'
  end

  create_table 'payment_methods', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'cb_customer_id'
    t.boolean 'auto_collection'
    t.string 'payment_type'
    t.string 'reference_id'
    t.string 'card_last4'
    t.string 'card_type'
    t.string 'status'
    t.datetime 'event_last_modified_at', precision: nil
    t.bigint 'payment_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'payment_id' ], name: 'index_payment_methods_on_payment_id'
  end

  create_table 'payment_terminals', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'provider'
    t.string 'provider_id'
    t.integer 'exhibitor_id'
    t.integer 'venue_id'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'printer_id'
  end

  create_table 'payments', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'plan_id'
    t.integer 'plan_quantity', default: 1
    t.integer 'user_id'
    t.string 'status'
    t.datetime 'event_last_modified_at', precision: nil
    t.datetime 'expires_on', precision: nil
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'exhibitor_id'
    t.integer 'plan_amount'
    t.integer 'plan_discount_amount'
    t.integer 'plan_net_amount'
    t.integer 'addon_amount'
    t.integer 'addon_discount_amount'
    t.integer 'addon_net_amount'
    t.integer 'total_net_amount'
    t.datetime 'paid_at', precision: nil
    t.integer 'refunded_amount'
    t.datetime 'refunded_at', precision: nil
    t.string 'provider'
    t.string 'provider_id'
    t.text 'provider_data'
    t.text 'provider_refund_data'
    t.integer 'sales_tax_amount'
    t.integer 'fee_amount'
    t.integer 'units', default: 1
    t.bigint 'coupon_id'
    t.integer 'reported_amount'
    t.string 'code'
    t.integer 'plan_net_discount_amount'
    t.integer 'fee_net_amount'
    t.integer 'sales_tax_net_amount'
    t.integer 'total_plan_net_amount'
    t.integer 'venue_id'
    t.integer 'addon_donation_net_amount'
    t.integer 'addon_merchandise_net_amount'
    t.integer 'addon_concession_net_amount'
    t.string 'kind', limit: 64, default: 'unknown'
    t.integer 'donation_amount', default: 0, null: false
    t.integer 'campaign_id'
    t.index [ 'addon_amount' ], name: 'index_payments_on_addon_amount'
    t.index [ 'addon_concession_net_amount' ], name: 'index_payments_on_addon_concession_net_amount'
    t.index [ 'addon_discount_amount' ], name: 'index_payments_on_addon_discount_amount'
    t.index [ 'addon_donation_net_amount' ], name: 'index_payments_on_addon_donation_net_amount'
    t.index [ 'addon_merchandise_net_amount' ], name: 'index_payments_on_addon_merchandise_net_amount'
    t.index [ 'addon_net_amount' ], name: 'index_payments_on_addon_net_amount'
    t.index [ 'campaign_id' ], name: 'index_payments_on_campaign_id'
    t.index [ 'code' ], name: 'index_payments_on_code'
    t.index [ 'coupon_id' ], name: 'index_payments_on_coupon_id'
    t.index [ 'donation_amount' ], name: 'index_payments_on_donation_amount'
    t.index [ 'expires_on' ], name: 'index_payments_on_expires_on'
    t.index [ 'fee_amount' ], name: 'index_payments_on_fee_amount'
    t.index [ 'fee_net_amount' ], name: 'index_payments_on_fee_net_amount'
    t.index [ 'kind' ], name: 'index_payments_on_kind'
    t.index [ 'paid_at' ], name: 'index_payments_on_paid_at'
    t.index [ 'plan_amount' ], name: 'index_payments_on_plan_amount'
    t.index [ 'plan_discount_amount' ], name: 'index_payments_on_plan_discount_amount'
    t.index [ 'plan_id' ], name: 'index_payments_on_plan_id'
    t.index [ 'plan_net_amount' ], name: 'index_payments_on_plan_net_amount'
    t.index [ 'plan_net_discount_amount' ], name: 'index_payments_on_plan_net_discount_amount'
    t.index [ 'provider_id' ], name: 'index_payments_on_provider_id'
    t.index [ 'refunded_amount' ], name: 'index_payments_on_refunded_amount'
    t.index [ 'refunded_at' ], name: 'index_payments_on_refunded_at'
    t.index [ 'reported_amount' ], name: 'index_payments_on_reported_amount'
    t.index [ 'sales_tax_amount' ], name: 'index_payments_on_sales_tax_amount'
    t.index [ 'sales_tax_net_amount' ], name: 'index_payments_on_sales_tax_net_amount'
    t.index [ 'status' ], name: 'index_payments_on_status'
    t.index [ 'total_net_amount' ], name: 'index_payments_on_total_net_amount'
    t.index [ 'total_plan_net_amount' ], name: 'index_payments_on_total_plan_net_amount'
    t.index [ 'units' ], name: 'index_payments_on_units'
    t.index [ 'user_id' ], name: 'index_payments_on_user_id'
    t.index [ 'venue_id' ], name: 'index_payments_on_venue_id'
  end

  create_table 'plans', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'name'
    t.string 'plan_id'
    t.string 'status'
    t.text 'chargebee_data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'price_tiers', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'name'
    t.integer 'price'
    t.integer 'priority'
    t.integer 'price_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'required_membership_id'
    t.integer 'required_membership_upgrade_tier'
    t.index [ 'price_id' ], name: 'index_price_tiers_on_price_id'
  end

  create_table 'prices', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'name'
    t.integer 'exhibitor_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'ineligible_for_discounts', default: false
    t.index [ 'exhibitor_id' ], name: 'index_prices_on_exhibitor_id'
  end

  create_table 'purchase_validations', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'purchase_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'purchases', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'role_id'
    t.integer 'exhibitor_id'
    t.integer 'purchasable_id'
    t.string 'purchasable_type'
    t.integer 'schedulable_id'
    t.string 'schedulable_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'payment_id'
    t.datetime 'viewed_at', precision: nil
    t.text 'playhead_position'
    t.string 'pickup_license_plate'
    t.string 'status'
    t.datetime 'accounted_at', precision: nil
    t.index [ 'accounted_at' ], name: 'index_purchases_on_accounted_at'
    t.index [ 'created_at' ], name: 'index_purchases_on_created_at'
    t.index [ 'exhibitor_id' ], name: 'index_purchases_on_exhibitor_id'
    t.index [ 'payment_id' ], name: 'index_purchases_on_payment_id'
    t.index %w[purchasable_id purchasable_type], name: 'index_purchases_on_purchasable_id_and_purchasable_type'
    t.index [ 'purchasable_type' ], name: 'index_purchases_on_purchasable_type'
    t.index [ 'role_id' ], name: 'index_purchases_on_role_id'
    t.index [ 'status' ], name: 'index_purchases_on_status'
    t.index [ 'user_id' ], name: 'index_purchases_on_user_id'
  end

  create_table 'roles', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'granted_by_user_id'
    t.integer 'rolable_id'
    t.string 'rolable_type'
    t.string 'role'
    t.datetime 'effective_at', precision: nil
    t.datetime 'expires_at', precision: nil
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'effective_at' ], name: 'index_roles_on_effective_at'
    t.index [ 'expires_at' ], name: 'index_roles_on_expires_at'
    t.index %w[rolable_id rolable_type], name: 'index_roles_on_rolable_id_and_rolable_type'
    t.index [ 'role' ], name: 'index_roles_on_role'
    t.index [ 'user_id' ], name: 'index_roles_on_user_id'
  end

  create_table 'rsvps', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'showtime_id'
    t.integer 'user_id'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'phone'
    t.integer 'quantity'
    t.string 'referred_by'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'showtime_id' ], name: 'index_rsvps_on_showtime_id'
    t.index [ 'user_id' ], name: 'index_rsvps_on_user_id'
  end

  create_table 'showtime_blocks', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.bigint 'exhibitor_id'
    t.bigint 'feature_id'
    t.bigint 'collection_feature_id'
    t.datetime 'first_showtime_at', precision: nil
    t.integer 'repeat_for_days'
    t.integer 'max_purchases'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.index [ 'collection_feature_id' ], name: 'index_showtime_blocks_on_collection_feature_id'
  end

  create_table 'showtimes', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'collection_feature_id'
    t.datetime 'showtime_at', precision: nil
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'plan_id'
    t.integer 'max_purchases'
    t.integer 'total_purchases'
    t.bigint 'showtime_block_id'
    t.integer 'old_price'
    t.string 'status', default: 'active'
    t.integer 'price_id'
    t.index [ 'collection_feature_id' ], name: 'index_showtimes_on_collection_feature_id'
    t.index [ 'max_purchases' ], name: 'index_showtimes_on_max_purchases'
    t.index [ 'price_id' ], name: 'index_showtimes_on_price_id'
    t.index [ 'showtime_at' ], name: 'index_showtimes_on_showtime_at'
    t.index [ 'showtime_block_id' ], name: 'index_showtimes_on_showtime_block_id'
    t.index [ 'status' ], name: 'index_showtimes_on_status'
    t.index [ 'total_purchases' ], name: 'index_showtimes_on_total_purchases'
  end

  create_table 'signin_tokens', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'phone'
    t.string 'token'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'slideshows', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.integer 'total_count'
    t.integer 'display_count'
    t.boolean 'randomize'
    t.integer 'priority'
    t.bigint 'collection_feature_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'collection_feature_id' ], name: 'index_slideshows_on_collection_feature_id'
  end

  create_table 'system_integrations', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'type', limit: 64, null: false
    t.string 'name', limit: 64, null: false
    t.integer 'exhibitor_id', null: false
    t.string 'status', limit: 16, null: false
    t.text 'metadata'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'created_at' ], name: 'index_system_integrations_on_created_at'
    t.index [ 'exhibitor_id' ], name: 'index_system_integrations_on_exhibitor_id'
    t.index %w[id type], name: 'si_id_type_combo', unique: true
    t.index [ 'name' ], name: 'index_system_integrations_on_name'
    t.index [ 'status' ], name: 'index_system_integrations_on_status'
    t.index [ 'type' ], name: 'index_system_integrations_on_type'
    t.index [ 'updated_at' ], name: 'index_system_integrations_on_updated_at'
  end

  create_table 'terms', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'termable_type'
    t.integer 'termable_id'
    t.text 'body'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'user_integrations', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'type', limit: 64, null: false
    t.integer 'user_id'
    t.integer 'exhibitor_id'
    t.bigint 'system_integration_id', null: false
    t.string 'system_integration_type', limit: 64, null: false
    t.string 'foreign_id', limit: 32
    t.string 'status', limit: 16, null: false
    t.text 'metadata'
    t.datetime 'last_sync_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'created_at' ], name: 'index_user_integrations_on_created_at'
    t.index [ 'exhibitor_id' ], name: 'index_user_integrations_on_exhibitor_id'
    t.index [ 'foreign_id' ], name: 'index_user_integrations_on_foreign_id'
    t.index %w[id type], name: 'ui_id_type_combo', unique: true
    t.index [ 'last_sync_at' ], name: 'index_user_integrations_on_last_sync_at'
    t.index [ 'status' ], name: 'index_user_integrations_on_status'
    t.index %w[system_integration_id system_integration_type], name: 'ui_si_id_type_combo'
    t.index [ 'system_integration_id' ], name: 'index_user_integrations_on_system_integration_id'
    t.index [ 'system_integration_type' ], name: 'index_user_integrations_on_system_integration_type'
    t.index [ 'type' ], name: 'index_user_integrations_on_type'
    t.index [ 'updated_at' ], name: 'index_user_integrations_on_updated_at'
    t.index [ 'user_id' ], name: 'index_user_integrations_on_user_id'
  end

  create_table 'user_payment_methods', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'stripe_customer_id'
    t.string 'card_last4'
    t.string 'card_type'
    t.string 'zip_code'
    t.string 'status'
    t.text 'card_data'
    t.string 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'user_id' ], name: 'index_user_payment_methods_on_user_id'
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'phone'
    t.string 'password'
    t.string 'status', default: 'active'
    t.string 'last_ip_address'
    t.string 'session_token'
    t.datetime 'session_token_expires_at', precision: nil
    t.datetime 'last_seen_at', precision: nil
    t.integer 'failed_auth_attempts', default: 0
    t.datetime 'event_last_modified_at', precision: nil
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at', precision: nil
    t.integer 'total_features_amount'
    t.integer 'total_addons_amount'
    t.text 'last_location'
    t.string 'complete_account_token'
    t.datetime 'complete_account_sent_at', precision: nil
    t.string 'zip_code'
    t.string 'address'
    t.string 'city'
    t.string 'state'
    t.string 'address2', limit: 128
    t.index [ 'email' ], name: 'index_users_on_email'
    t.index [ 'last_seen_at' ], name: 'index_users_on_last_seen_at'
    t.index [ 'phone' ], name: 'index_users_on_phone'
    t.index [ 'session_token' ], name: 'index_users_on_session_token'
    t.index [ 'session_token_expires_at' ], name: 'index_users_on_session_token_expires_at'
  end

  create_table 'venues', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'exhibitor_id'
    t.string 'name'
    t.string 'slug'
    t.string 'hostname'
    t.integer 'priority'
    t.string 'address'
    t.string 'city'
    t.string 'state'
    t.string 'zip_code'
    t.string 'logo_url'
    t.string 'color_logo_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'media_hostname'
    t.string 'login_method'
    t.string 'address2', limit: 128
    t.index [ 'exhibitor_id' ], name: 'index_venues_on_exhibitor_id'
    t.index [ 'hostname' ], name: 'index_venues_on_hostname'
  end

  create_table 'verbiages', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'name'
    t.text 'value'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'verbiagable_type'
    t.bigint 'verbiagable_id'
    t.integer 'exhibitor_id'
    t.index [ 'exhibitor_id' ], name: 'index_verbiages_on_exhibitor_id'
    t.index %w[verbiagable_type verbiagable_id], name: 'index_verbiages_on_verbiagable_type_and_verbiagable_id'
  end

  create_table 'zip_codes', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'country_name'
    t.string 'postal_code'
    t.string 'postal_type'
    t.string 'city_name'
    t.string 'city_type'
    t.string 'county_name'
    t.string 'county_fips'
    t.string 'province_name'
    t.string 'province_abbr'
    t.string 'state_fips'
    t.string 'msa_code'
    t.string 'area_code'
    t.string 'time_zone'
    t.string 'utc'
    t.string 'dst'
    t.string 'latitude'
    t.string 'longitude'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'postal_code' ], name: 'index_zip_codes_on_postal_code'
    t.index [ 'province_abbr' ], name: 'index_zip_codes_on_province_abbr'
  end

  add_foreign_key 'payment_methods', 'payments'
end
