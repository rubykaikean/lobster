class CreateSourcesTypes < ActiveRecord::Migration
  def change
    create_table :sources_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
