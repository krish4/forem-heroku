# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120924180521) do

  create_table "cms_blocks", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.string   "identifier", :null => false
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cms_blocks", ["page_id", "identifier"], :name => "index_cms_blocks_on_page_id_and_identifier"

  create_table "cms_categories", :force => true do |t|
    t.integer "site_id",          :null => false
    t.string  "label",            :null => false
    t.string  "categorized_type", :null => false
  end

  add_index "cms_categories", ["site_id", "categorized_type", "label"], :name => "index_cms_categories_on_site_id_and_categorized_type_and_label", :unique => true

  create_table "cms_categorizations", :force => true do |t|
    t.integer "category_id",      :null => false
    t.string  "categorized_type", :null => false
    t.integer "categorized_id",   :null => false
  end

  add_index "cms_categorizations", ["category_id", "categorized_type", "categorized_id"], :name => "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", :unique => true

  create_table "cms_files", :force => true do |t|
    t.integer  "site_id",                                          :null => false
    t.integer  "block_id"
    t.string   "label",                                            :null => false
    t.string   "file_file_name",                                   :null => false
    t.string   "file_content_type",                                :null => false
    t.integer  "file_file_size",                                   :null => false
    t.string   "description",       :limit => 2048
    t.integer  "position",                          :default => 0, :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "cms_files", ["site_id", "block_id"], :name => "index_cms_files_on_site_id_and_block_id"
  add_index "cms_files", ["site_id", "file_file_name"], :name => "index_cms_files_on_site_id_and_file_file_name"
  add_index "cms_files", ["site_id", "label"], :name => "index_cms_files_on_site_id_and_label"
  add_index "cms_files", ["site_id", "position"], :name => "index_cms_files_on_site_id_and_position"

  create_table "cms_layouts", :force => true do |t|
    t.integer  "site_id",                                           :null => false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                                             :null => false
    t.string   "identifier",                                        :null => false
    t.text     "content",    :limit => 16777215
    t.text     "css",        :limit => 16777215
    t.text     "js",         :limit => 16777215
    t.integer  "position",                       :default => 0,     :null => false
    t.boolean  "is_shared",                      :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "cms_layouts", ["parent_id", "position"], :name => "index_cms_layouts_on_parent_id_and_position"
  add_index "cms_layouts", ["site_id", "identifier"], :name => "index_cms_layouts_on_site_id_and_identifier", :unique => true

  create_table "cms_pages", :force => true do |t|
    t.integer  "site_id",                                               :null => false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                                                 :null => false
    t.string   "slug"
    t.string   "full_path",                                             :null => false
    t.text     "content",        :limit => 16777215
    t.integer  "position",                           :default => 0,     :null => false
    t.integer  "children_count",                     :default => 0,     :null => false
    t.boolean  "is_published",                       :default => true,  :null => false
    t.boolean  "is_shared",                          :default => false, :null => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "cms_pages", ["parent_id", "position"], :name => "index_cms_pages_on_parent_id_and_position"
  add_index "cms_pages", ["site_id", "full_path"], :name => "index_cms_pages_on_site_id_and_full_path"

  create_table "cms_revisions", :force => true do |t|
    t.string   "record_type",                     :null => false
    t.integer  "record_id",                       :null => false
    t.text     "data",        :limit => 16777215
    t.datetime "created_at"
  end

  add_index "cms_revisions", ["record_type", "record_id", "created_at"], :name => "index_cms_revisions_on_record_type_and_record_id_and_created_at"

  create_table "cms_sites", :force => true do |t|
    t.string  "label",                          :null => false
    t.string  "identifier",                     :null => false
    t.string  "hostname",                       :null => false
    t.string  "path"
    t.string  "locale",      :default => "en",  :null => false
    t.boolean "is_mirrored", :default => false, :null => false
  end

  add_index "cms_sites", ["hostname"], :name => "index_cms_sites_on_hostname"
  add_index "cms_sites", ["is_mirrored"], :name => "index_cms_sites_on_is_mirrored"

  create_table "cms_snippets", :force => true do |t|
    t.integer  "site_id",                                           :null => false
    t.string   "label",                                             :null => false
    t.string   "identifier",                                        :null => false
    t.text     "content",    :limit => 16777215
    t.integer  "position",                       :default => 0,     :null => false
    t.boolean  "is_shared",                      :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "cms_snippets", ["site_id", "identifier"], :name => "index_cms_snippets_on_site_id_and_identifier", :unique => true
  add_index "cms_snippets", ["site_id", "position"], :name => "index_cms_snippets_on_site_id_and_position"

  create_table "forem_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "forem_categories", ["slug"], :name => "index_forem_categories_on_slug", :unique => true

  create_table "forem_forums", :force => true do |t|
    t.string  "title"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", :default => 0
    t.string  "slug"
  end

  add_index "forem_forums", ["slug"], :name => "index_forem_forums_on_slug", :unique => true

  create_table "forem_groups", :force => true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], :name => "index_forem_groups_on_name"

  create_table "forem_memberships", :force => true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], :name => "index_forem_memberships_on_group_id"

  create_table "forem_moderator_groups", :force => true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], :name => "index_forem_moderator_groups_on_forum_id"

  create_table "forem_posts", :force => true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "reply_to_id"
    t.string   "state",       :default => "pending_review"
    t.boolean  "notified",    :default => false
  end

  add_index "forem_posts", ["reply_to_id"], :name => "index_forem_posts_on_reply_to_id"
  add_index "forem_posts", ["state"], :name => "index_forem_posts_on_state"
  add_index "forem_posts", ["topic_id"], :name => "index_forem_posts_on_topic_id"
  add_index "forem_posts", ["user_id"], :name => "index_forem_posts_on_user_id"

  create_table "forem_subscriptions", :force => true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "locked",       :default => false,            :null => false
    t.boolean  "pinned",       :default => false
    t.boolean  "hidden",       :default => false
    t.datetime "last_post_at"
    t.string   "state",        :default => "pending_review"
    t.integer  "views_count",  :default => 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], :name => "index_forem_topics_on_forum_id"
  add_index "forem_topics", ["slug"], :name => "index_forem_topics_on_slug", :unique => true
  add_index "forem_topics", ["state"], :name => "index_forem_topics_on_state"
  add_index "forem_topics", ["user_id"], :name => "index_forem_topics_on_user_id"

  create_table "forem_views", :force => true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             :default => 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], :name => "index_forem_views_on_updated_at"
  add_index "forem_views", ["user_id"], :name => "index_forem_views_on_user_id"
  add_index "forem_views", ["viewable_id"], :name => "index_forem_views_on_topic_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "avatar_url"
    t.string   "location"
    t.string   "occupation"
    t.string   "company"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.boolean  "forem_admin",          :default => false
    t.string   "forem_state",          :default => "pending_review"
    t.boolean  "forem_auto_subscribe", :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
