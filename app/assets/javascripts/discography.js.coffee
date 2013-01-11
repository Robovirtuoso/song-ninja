class Discography
  constructor: (@elements) ->
    @bands = []

    for element in @elements
      @bands.push new BandLink(element)

    $(@elements[0]).addClass('active')
    @setupObservers()

  setupObservers: ->
    @elements.bind 'clicked_link', @handleClick

  handleClick: (event, clickedBand) =>
    link.hideAlbum() for link in @bands
    clickedBand.showAlbum()

class BandLink
  constructor: (@link) ->
    @link = $(@link)
    @id = $(@link).attr('id')
    @setupObservers()

  setupObservers: ->
    @link.bind 'click', (event) =>
      event.preventDefault()
      $(event.target).trigger 'clicked_link', @

  hideAlbum: ->
    @link.removeClass('active')
    $("table#band_#{@id}").hide()
    $("div#band_#{@id}").hide()

  showAlbum: ->
    @link.addClass('active')
    $("table#band_#{@id}").show()
    $("div#band_#{@id}").show()


jQuery ->
  links = $('.nav-list li')

  if links.length > 0
    new Discography links
