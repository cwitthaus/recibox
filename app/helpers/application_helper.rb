module ApplicationHelper
	def full_title(page_title)
		base_title = "Recibox"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def button_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + button_to_function(name, "remove_fields(this)", :class => "btn btn-danger btn-small")
  end
  
  def button_to_add_fields(name, f, association)
    logger.debug "Attempting: New Class #{f.object.class.reflect_on_association(association).klass}"
    new_object = f.object.class.reflect_on_association(association).klass.new
    logger.debug "Success: New Class #{f.object.class.reflect_on_association(association).klass}"
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize, :f => builder)
    end
    logger.debug "#{fields}"
    
    button_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => "btn btn-inverse btn-small")
  end

end
