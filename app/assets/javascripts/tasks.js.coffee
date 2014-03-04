$ ->
  $("#fileupload").fileupload
    dataType: "json"
    done: (e, data) ->
      $.each data.result.files, (index, file) ->
        $("<p/>").text(file.name).appendTo document.body
        return

      return

    progressall: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $("#progress .bar").css "width", progress + "%"
      return

  return
