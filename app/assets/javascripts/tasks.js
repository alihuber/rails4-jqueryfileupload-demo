$(function () {
    // uploadButton = $('<button/>')
    //                .text('Upload')
    //                .addClass('btn btn-primary')
    //                .click(function(e, data) {
    //                    var $this = $(this),
    //                    data = $this.data();
    //                    e.preventDefault();
    //                    data.submit();
    //                });

    $('#fileupload').fileupload({
        dataType: 'json',
        autoUpload: false,
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
        maxFileSize: 5000000, // 5 MB
        // Enable image resizing, except for Android and Opera,
        // which actually support image resizing, but fail to
        // send Blob objects via XHR requests:
        disableImageResize: /Android(?!.*Chrome)|Opera/
            .test(window.navigator.userAgent),
        previewMaxWidth: 100,
        previewMaxHeight: 100,
        previewCrop: true,
        filesContainer: $('tbody.files'),
        uploadTemplateId: 'template-upload',
        downloadTemplateId: 'template-download'
    // }).on('fileuploadadd', function(e, data) {
    //     data.context = $('<div/>').appendTo('#files');
    //     $.each(data.files, function (index, file) {
    //     var node = $('<p/>')
    //               .append($('<span/>').text(file.name))
    //               .append('<br>')
    //               .append(uploadButton.clone(true).data(data));
    //     node.appendTo(data.context);
    //     });
    // }).on('fileuploaddone', function(e, data) {
    //     data.context.text('Upload finished.');
    // }).on('fileuploadprocessalways', function (e, data) {
    //     var index = data.index,
    //         file = data.files[index],
    //         node = $(data.context.children()[index]);
    //     if (file.preview) {
    //         node
    //             .prepend('<br>')
    //             .prepend(file.preview);
    //     }
    //     if (file.error) {
    //         node
    //             .append('<br>')
    //             .append($('<span class="text-danger"/>').text(file.error));
    //     }
    //     if (index + 1 === data.files.length) {
    //         data.context.find('button')
    //             .text('Upload')
    //             .prop('disabled', !!data.files.error);
    //     }
    });
});
