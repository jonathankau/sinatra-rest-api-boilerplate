class CreateSampleModel < ActiveRecord::Migration[5.1]
  def change
     create_table "samples" do |t|
       t.datetime :created_at, null: false
       t.string :sample_text, limit: 128, null: false
     end
  end
end
