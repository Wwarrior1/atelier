class Category < ActiveYaml::Base
  set_root_path 'db/data'

  def books
    ::Book.where(category_id: id)
          # .where((Date.today - current_user.date_of_birth).to_i / 365 >= 18)
  end

  def similar_books
    ::Book.where(category_id: similar_ids)
  end

  private

  def similar_ids
    similar_categories.map { |name| Category.find_by(name: name).id }
  end
end
