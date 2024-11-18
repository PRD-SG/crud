class CreateLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :logs do |t|
      t.string      :title,     null: false
      t.integer     :status
      t.integer     :log_type
      t.float       :value,     null: false, default: 0
      t.datetime        :date,      null: false, default: Time.zone.now
      t.text        :remark
      t.references  :user,      null: false, foreign_key: true
      t.references  :category,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
