$(document).ready ->
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

  # load existing files
  $.getJSON $("#fileupload").prop("action"), (files) ->
    fu = $("#fileupload").data("blueimp-fileupload")
    template = fu._renderDownload(files)
    $("tbody.files").append(template)

    # Force reflow:
    fu._reflow = fu._transition and template.length and template[0].offsetWidth
    template.addClass "in"
    $("#loading").remove()


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
