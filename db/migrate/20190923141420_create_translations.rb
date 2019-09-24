class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.string :input
      t.string :output

      t.timestamps
    end
  end
end
