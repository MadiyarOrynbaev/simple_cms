$(document).ready ->
  $("input:radio[name=\"section[content_type]\"]").change ->
    if $(this).is(":checked") and $(this).val() is "HTML"
      $ ->
        $(".wysihtml5").each (i, elem) ->
          $(elem).wysihtml5()
    else
      $ ->
        $(".wysihtml5").each (i, elem) ->
          content = $(elem)
          contentPar = content.parent()
          contentPar.find(".wysihtml5-toolbar").remove()
          contentPar.find("iframe").remove()
          contentPar.find("input[name*=\"wysihtml5\"]").remove()
          content.show()
         