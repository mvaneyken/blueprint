module ApplicationHelper

  def icon_class(name)
    '<i class="' + name + '"></i>'
  end

  def icon_with_label(icon, label)
    raw(icon_class(icon) + ' ' + label)
  end

  # Nested forms -add field set
  def link_to_add_fields(name, f, association, classes = '')
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "Application.add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => "#{classes}")
  end

  # Nested forms -remove field set
  def link_to_remove_fields(name, f, classes = '') 
    f.hidden_field(:_destroy) + link_to_function(name, "Application.remove_fields(this)", :class => "#{classes}")
  end
  
end
