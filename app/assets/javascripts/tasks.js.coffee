$ ->
  $("#fileupload").fileupload
    dataType: "json"
    add: (e, data) ->
      data.context = $("<p/>").text("Uploading...").appendTo(document.body)
      data.submit()
      return

    done: (e, data) ->
      data.context.text "Upload finished."
      return

  return
