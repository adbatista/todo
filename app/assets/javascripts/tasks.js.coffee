jQuery ->
  form = $("#new_task")
  form.hide()

  $("#add_task, .close").on 'click', (event) ->
    event.preventDefault()
    form.slideToggle()
    $("#add_task").toggle()
    $("#task_task").focus()

  $(".nav li").on 'click', (event) ->
    event.preventDefault()
    $('.nav li').removeClass('active')
    $(@).addClass('active')