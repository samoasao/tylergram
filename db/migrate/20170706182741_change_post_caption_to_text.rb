class ChangePostCaptionToText < ActiveRecord::Migration[5.0]
  def up
    change_column :posts, :caption, :text
  end

  def down
    change_column :posts, :caption, :string
  end
end
