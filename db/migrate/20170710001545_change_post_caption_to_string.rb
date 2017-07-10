class ChangePostCaptionToString < ActiveRecord::Migration[5.0]
  def up
    change_column :posts, :caption, :string
  end
  
  def down
    change_column :posts, :caption, :text
  end
end
