class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
    	t.string   :type,                       comment: "类别（单表继承）"
      t.string   :owner_type,                 comment: "所属对象"
      t.integer  :owner_id,                   comment: "所属对象id"
      t.integer  :position,                   comment: "排序"
      t.string   :file,                       comment: "附件"
      t.string   :file_name,                  comment: "文件名"
      t.integer  :file_size,                  comment: "文件大小"
      t.string   :user_type,                  comment: "所属用户类型"
      t.integer  :user_id,                    comment: "所属用户id"
      t.string   :protect_token,              comment: "删除token"
      t.index ["owner_type", "owner_id"], name: "index_assets_on_owner_type_and_owner_id", using: :btree
      t.index ["position"], name: "index_assets_on_position", using: :btree
      t.index ["type"], name: "index_assets_on_type", using: :btree

      t.timestamps
    end
  end
end
