require "../styles/preview"
$ = require "jquery"

class Preview
  constructor: ->
    @$preview = $ ".preview"
    @$previewDocument = @$preview[0].contentWindow.document

    @updatePreview(localStorage["content"])
    $(window).bind "storage", @onStorageChange.bind(this)

   updatePreview: (content) ->
    @$previewDocument.open()
    @$previewDocument.write(content)
    @$previewDocument.close()

   onStorageChange: (event) -> @updatePreview(event.originalEvent.newValue)

$ -> new Preview
