# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081023071300) do

  create_table "bj_config", :id => false, :force => true do |t|
    t.integer "bj_config_id", :null => false
    t.text    "hostname"
    t.text    "key"
    t.text    "value"
    t.text    "cast"
  end

  add_index "bj_config", ["hostname", "key"], :name => "index_bj_config_on_hostname_and_key", :unique => true

  create_table "bj_job", :id => false, :force => true do |t|
    t.integer  "bj_job_id",      :null => false
    t.text     "command"
    t.text     "state"
    t.integer  "priority"
    t.text     "tag"
    t.integer  "is_restartable"
    t.text     "submitter"
    t.text     "runner"
    t.integer  "pid"
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.text     "env"
    t.text     "stdin"
    t.text     "stdout"
    t.text     "stderr"
    t.integer  "exit_status"
  end

  create_table "bj_job_archive", :id => false, :force => true do |t|
    t.integer  "bj_job_archive_id", :null => false
    t.text     "command"
    t.text     "state"
    t.integer  "priority"
    t.text     "tag"
    t.integer  "is_restartable"
    t.text     "submitter"
    t.text     "runner"
    t.integer  "pid"
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "archived_at"
    t.text     "env"
    t.text     "stdin"
    t.text     "stdout"
    t.text     "stderr"
    t.integer  "exit_status"
  end

  create_table "ips", :force => true do |t|
    t.integer  "network"
    t.string   "address"
    t.integer  "interface"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "network_id"
  end

  create_table "networks", :force => true do |t|
    t.string   "name"
    t.string   "network_address"
    t.string   "first_usable"
    t.string   "last_usable"
    t.string   "gateway"
    t.string   "netmask"
    t.string   "broadcast"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
