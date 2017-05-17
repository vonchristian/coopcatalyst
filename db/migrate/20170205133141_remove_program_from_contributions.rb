class RemoveProgramFromContributions < ActiveRecord::Migration[5.0]
  def change
    remove_reference :contributions, :program, foreign_key: true
  end
end
