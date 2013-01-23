module RecipesHelper
  def button_to_remove_ingredient_fields(f)
    f.hidden_field(:_destroy) + button_to_function("Remove Ingredient", "remove_fields(this)", :class => "btn btn-danger btn-small")
  end

  def button_to_remove_step_fields(f)
    f.hidden_field(:_destroy) + button_to_function("Remove Step", "remove_step_fields(this)", :class => "btn btn-danger btn-small")
  end

  def get_new_fields(f,association)
    logger.debug "Attempting: New Class #{f.object.class.reflect_on_association(association).klass}"
    new_object = f.object.class.reflect_on_association(association).klass.new
    logger.debug "Success: New Class #{f.object.class.reflect_on_association(association).klass}"
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize, :f => builder)
    end
    logger.debug "#{fields}"
    return fields
  end

  def button_to_add_ingredient_fields(name, f)
    fields = get_new_fields(f, :ingredient_list_items)
    button_to_function(name, "add_ingredient_fields(\"#{:ingredient_list_items}\", \"#{escape_javascript(fields)}\")", :class => "btn btn-inverse btn-small")
  end

  def button_to_add_step_fields(name, f)
    fields = get_new_fields(f, :steps)
    button_to_function(name, "add_step_fields(\"#{:steps}\", \"#{escape_javascript(fields)}\")", :class => "btn btn-inverse btn-small")
  end

  def button_to_begin_building_recipe()
    button_to_function("Start Building", "convert_text_box_to_paragraph(this)")
  end

  def toolbar_for_parsing_recipe(f)
    button_to_function("Set Title", "add_title()")+
    button_to_function("Set Source", "add_source()")+
    button_to_add_ingredient_fields("Add Ingredient", f)+
    button_to_add_step_fields("Add Step", f)
  end
end
