class AddCooperativeToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_reference :programs, :cooperative, foreign_key: true
  end
end
