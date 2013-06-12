ActiveRecord::Schema.define(:version => 20130612163939) do

  create_table "links", :force => true do |t|
    t.string   "url"
    t.text     "text"
    t.string   "title"
    t.integer  "submitter_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "linksubs", :force => true do |t|
    t.integer  "link_id"
    t.integer  "sub_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subs", :force => true do |t|
    t.string   "category"
    t.integer  "moderator_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "token"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
