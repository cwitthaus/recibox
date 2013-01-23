# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  Mousetrap.bind 'shift+k', ->
    $("input")

step_number = 1

getSelected = ->
  if window.getSelection 
    t = window.getSelection()
  else if(document.getSelection)
    t = document.getSelection()
  else if(document.selection)
    t = document.selection.createRange().text
  return t

get_updated_content = (association, content) ->
  new_id = new Date().getTime()
  regexp = new RegExp("new_" + association, "g")
  return content.replace(regexp, new_id)

parse_ingredient = (ingredient_text) ->
  $.ajax '/parse_ingredient', ->
    type: 'POST'
    dataType: 'html'
    data: "text=" + ingredient_text
    (data) ->
      alert(data)
  return

@remove_fields = (link) ->
  $(link).prev("input[type=hidden]").val("1")
  $(link).parent().hide()
  return

@remove_step_fields = (link) ->
  $(link).prev("input[type=hidden]").val("1")
  $(link).parent().hide()
  return

@add_ingredient_fields = (association, content) ->
  selected_text = getSelected()
  ingredient_list_info = parse_ingredient(selected_text)
  content = get_updated_content(association, content)
  $(".ingredients").append(content)
  return

@add_step_fields = (association, content) ->
  selected_text = getSelected()
  content = get_updated_content(association, content)
  $("div.steps").append(content)
  $("div.step:last").children("textarea[id$='_instructions']").val(selected_text)
  return

@add_title = () ->
  selected_text = getSelected()
  $("input#recipe_title").val(selected_text)
  return

@add_source = () ->
  selected_text = getSelected()
  $("input#recipe_source").val(selected_text)
  return

@convert_text_box_to_paragraph = (link) ->
  recipe_text = $("textarea#recipe_text").val()
  recipe_text = recipe_text.replace(/\.  /g, ".<br>")
  recipe_text = recipe_text.replace(/\t/g, "<br>")
  $("textarea#recipe_text").hide()
  $("pre#recipe_text").html(recipe_text)
  $("pre#recipe_text").show()
  return