$ ->
  $('#castings').imagesLoaded ->
    $('#castings').masonry
      itemSelector: '.box'
      isFitWidth: true
