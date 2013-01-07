class Home
  constructor: (@element) ->
    @class = $(@element).attr('class')

    @hideForm()
    @setupObservers()

  hideForm: ->
    $('.album-form').hide()

  setupObservers: ->
    @element.bind 'click', (event) =>
      event.preventDefault
      @handleClick()

  handleClick: ->
    $('.wrapper').hide()
    $('div').find(".#{@class}-form").show()

jQuery ->
  new Home $('a.album')
  new Home $('a.song')
