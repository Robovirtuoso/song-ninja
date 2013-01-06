jQuery ->
  $('.best_in_place').best_in_place()
  $('.best_in_place').bind('ajax:success', ->
    this.innerHTML = this.innerHTML.replace(/\n/g, '<br />'))
