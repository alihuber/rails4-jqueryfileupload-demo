Demo.newTask = ->
  $("#fileupload").fileupload
    dataType: "json"
    autoUpload: false
    acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i
    maxFileSize: 5000000
    disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator.userAgent)
    previewMaxWidth: 100
    previewMaxHeight: 100
    previewCrop: true
    filesContainer: $("tbody.files")

  # we have to handle these ourselves
  $(".start").on "click", ->
    $("tbody.files").find(".start").click()

  $(".cancel").on "click", ->
    $("tbody.files").find(".cancel").click()

  $(".delete-toggle").click ->
    if $(this).is(":checked")
      $("tbody.files").find(".toggle").prop "checked", true
    else
      $("tbody.files").find(".toggle").prop "checked", false

  $(".delete").click ->
    $("tbody.files").find(".toggle:checked").closest(".template-download").find(".delete").click()
    $(".delete-toggle").prop "checked", false


  $("#submit_task").click ->
    ids = []
    $(".delete-elem").each ->
      ids.push $(this).attr("data-url").replace("/attachments/", "")
    $("#submitted_attachments").val ids


  # task creation aborted: already uploaded images have to be deleted
  # to prevent orphaned attachments
  $("#back_link").click ->
    $(".delete-elem").each ->
      $(this).click()
