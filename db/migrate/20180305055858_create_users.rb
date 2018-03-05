class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :RecruitEmail
      t.string :email
      t.string :password_digest
      t.string :listing
      t.date :Establishment
      t.integer :Capitalstock
      t.string :area
      t.integer :zipcode
      t.string :dwelling
      t.string :BuildName
      t.integer :TelNam
      t.integer :fax
      t.string :UserAttribut
      t.datetime :DateTime
      t.text :Profile
      t.string :Specialty
      t.string :BusinessArea
      t.string :officialhp

      t.timestamps null: false
    end
  end
end
