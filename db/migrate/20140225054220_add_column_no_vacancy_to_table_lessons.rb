class AddColumnNoVacancyToTableLessons < ActiveRecord::Migration
  def change
    change_table :lessons do |t|
      t.boolean :no_vacancy
    end
  end
end
