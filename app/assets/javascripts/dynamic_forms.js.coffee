window.Application ||= {} # Ensure that the Appliation global is available

# Nested forms
# -Remember to have a 'div' in the view so that add_fields knows where to insert the new lines.
# -Remember to have the link_to_add_fields & link_to_remove_files helpers

Application.add_fields = (link, association, content) ->
  new_id = new Date().getTime()
  regexp = new RegExp("new_" + association, 'g')
  $(link).parent().before(content.replace(regexp, new_id))
  true

Application.remove_fields = (link) ->
  $(link).prev("input[type=hidden]").val("1")
  $(link).closest(".nested-fields").hide()
  true

$ ->
  $(document).on 'blur', '.upcase', (event) ->
    $(this).val( $(this).val().toUpperCase() )