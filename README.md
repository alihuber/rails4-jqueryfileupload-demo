#jQuery File Upload Demo

A sample Rails 4 app that demonstrates the use of the [jQuery File Uploader](http://blueimp.github.io/jQuery-File-Upload/) in combination with [carrierwave](https://github.com/carrierwaveuploader/carrierwave).

What is demonstrated?
* The (almost) complete "Basic Plus UI" interface incl. drag and drop (the overall upload progress bar is omitted)
* Multiple file upload of files for another model, without nested attributes
* The full CRUD scenario, with display of uploaded files for the model
* Rails 4.0.3, bootstrap-sass 3.1.1.0 and blueimp-file-upload version 9.5.6, obtained from [rails-assets.org](https://rails-assets.org/)

### Use case
A "task" model `has_many` attachments, and one attachment `belongs_to` a task. The files are stored in the `file` attribute of the attachment model via carrierwave. It should be possible to create a task record, while uploading files on the same page, but for the "attachment" model. The fileupload widget is not used on the complete form for a new task, instead it is called on a simple file input field styled with Bootstrap. The association of the created task to its uploaded attachments is done in the `TasksController` with a hidden field.

###Getting started
After making sure to have ImageMagick or GraphicsMagick installed, just `bundle install`, `rake db:migrate` and start uploading to `localhost:3000` ;)

###Pitfalls
Since it is possible to upload data via AJAX for a record that does not yet exist and users just won't click on the buttons and navigation elements how they are supposed to, there will be orphaned attachments in the database. One solution could be to drag more JavaScript into this (e.g. when the user is leaving the upload page) or with a cron job that removes orphaned records.
