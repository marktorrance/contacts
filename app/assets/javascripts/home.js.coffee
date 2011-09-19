# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.C =
  load_person: (pid,div) ->
    if (pid)
      $.get("/people/"+pid+"?plain=1", (data) -> $(div).html(data))
      C.check_dist()
    else
      $(div).html('')
      $('#result').html('')
  check_dist: () ->
    p1=$('#pf1').val()
    p2=$('#pf2').val()
    if (p1 && p2)
      $.get("/people/"+p1+"/dist?p2="+p2, (data) -> $('#result').html(data))
