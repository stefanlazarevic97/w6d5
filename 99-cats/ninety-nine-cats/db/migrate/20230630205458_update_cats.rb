class UpdateCats < ActiveRecord::Migration[7.0]
  def change
    rename_column :cats, :birthdate, :birth_date
  end
end
