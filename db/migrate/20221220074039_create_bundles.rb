class CreateBundles < ActiveRecord::Migration[6.1]
  def change
    create_table :bundles do |t|
      t.string :install

      t.timestamps
    end
  end
end
