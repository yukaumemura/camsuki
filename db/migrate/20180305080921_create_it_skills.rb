class CreateItSkills < ActiveRecord::Migration
  def change
    create_table :it_skills do |t|
      t.string :ITimage
      t.string :ITName
      t.references :user, index: true, foreign_key: true
      t.string :existence
      t.string :educate
      t.string :Field
      t.string :Itgenre
      t.integer :Accession
      t.integer :Resident
      t.string :TypeIndustry
      t.integer :dgpn
      t.integer :dbweb
      t.integer :dbopen
      t.integer :dbnclusion
      t.integer :dbfirmware
      t.integer :dbcontrol
      t.integer :frequency
      t.string :ITRemarks

      t.timestamps null: false
      t.index [:user_id, :created_at]
      t.index [:follower_id, :followed_id], unique: true # この行を追加
    end
  end
end
