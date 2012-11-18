window.App = {}

$ ->
  if location.pathname is '/schools'
    schoolController = new App.SchoolController()
  else if location.pathname is '/universities'
    universityController = new App.UniversityController()
  else if location.pathname is '/'
    imageCarousel = new App.CarouselController()
    console.log imageCarousel