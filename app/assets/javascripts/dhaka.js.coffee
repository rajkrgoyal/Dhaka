# IE is really bad at HTML5, so let's help it along...
document.createElement 'header'
document.createElement 'nav'
document.createElement 'section'
document.createElement 'article'
document.createElement 'aside'
document.createElement 'footer'
document.createElement 'figure'
document.createElement 'hgroup'
document.createElement 'detail'
document.createElement 'summary'
document.createElement 'time'

jQuery.fn.exists = ->
  jQuery(this).length > 0

jQuery.timeago.settings.strings =
  prefixAgo: null
  prefixFromNow: null
  suffixAgo: 'ago'
  suffixFromNow: null
  seconds: 'Less than a minute'
  minute: 'About a minute'
  minutes: '%d minutes'
  hour: 'About an hour'
  hours: 'About %d hours'
  day: 'A day'
  days: '%d days'
  month: 'About a month'
  months: '%d months'
  year: 'About a year'
  years: '%d years'
  numbers: []

$(document).ready ->
  # Hide mechanism for flashes and debug
  $('#flashes > p').click -> $(this).slideUp 500
  $('#debug').click -> $(this).fadeOut()
  $('.currency').numeric { negative: false }
  $('.time-ago').attr('title', '').timeago()

  marketplace_wordmark_el = 'body > header > h1'
  if $(marketplace_wordmark_el).find('a').exists()
    $(marketplace_wordmark_el).find('a').lettering()
  else
    $(marketplace_wordmark_el).lettering()

  listing_search_form = $('form#listing_search')
  listing_search_form.find('.inside_label').each ->
    input = $(this).find 'input'
    label = $(this).find 'label'
    input.data 'default_text', label.text()

    input.focus ->
      console.log $(this).val()
      if $(this).val() is $(this).data('default_text')
        $(this).removeClass()
        $(this).val ''

    input.blur ->
      console.log $(this).val()
      if $(this).val() is ''
        $(this).addClass 'undisturbed'
        $(this).val $(this).data('default_text')

    listing_search_form.submit -> input.focus()
    input.blur()
