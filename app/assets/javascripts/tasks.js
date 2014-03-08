$(function () {
 $('#fileupload').fileupload({
   dataType: 'json',
   autoUpload: false,
   acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
   maxFileSize: 5000000,
   disableImageResize: /Android(?!.*Chrome)|Opera/
       .test(window.navigator.userAgent),
   previewMaxWidth: 100,
   previewMaxHeight: 100,
   previewCrop: true,
   filesContainer: $('tbody.files')
 });


 $('.start').on('click', function() {
   $('tbody.files').find('.start').click();
 });

 $('.cancel').on('click', function() {
   $('tbody.files').find('.cancel').click();
 });

 $('.delete-toggle').click(function() {
   if ($(this).is(':checked')) {
     $('tbody.files').find('.toggle').prop('checked', true);
   } else {
     $('tbody.files').find('.toggle').prop('checked', false);
   }
 });

 $('.delete').click(function() {
   $('tbody.files').find('.toggle:checked')
       .closest('.template-download')
       .find('.delete').click();
   $('.delete-toggle').prop('checked', false);
 });

});
