class CreateBelongings < ActiveRecord::Migration[5.0]
  def change
    create_table :belongings do |t|
    	t.belongs_to :course
    	t.belongs_to :course_module
    	t.boolean :mandatory, null: false, default: false
      	t.timestamps null: false
    end
  end
end
