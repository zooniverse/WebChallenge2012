template = (school) -> """
"""

class SchoolController extends window.App.Controller
  constructor: () ->
    super '.schools', window.App.School

  listTemplate: (model) ->
    if model.phase_3_complete
      progress = 'complete'
      progress_text = 'Phase 3: Complete'
    else if model.phase_2_complete
      progress = 'two-thirds'
      progress_text = 'Phase 2: Complete'
    else if model.phase_1_complete
      progress = 'one-third'
      progress_text = 'Phase 1: Complete'
    else
      progress = 'begin'
      progress_text = ''

    """
      <section class="school normal">
        <div class="image">
          <figure>
            <div class="progress #{progress}"></div>
            <img src="#{model.image_url || '//placehold.it/128.png'}" />
          </figure>
          <figcaption>#{progress_text}</figcaption>
        </div>

        <div class="content">
          <header>
            <div class="name">#{model.name}</div class="name">
            <div class="location">Kampala, Uganda</div>
          </header>
          <p>#{model.story}</p>
          <div class='storyButtons'>
              <p><a href="#/#{model.slug}" class="standard-button green">View site</a></p>
              <p class='social'><a target='_blank' href="#{App.SocialNetworks.twitterHref model.name, window.location+'#'+model.slug}"><i class='icon-twitter'> </i></a></p>
              <p class='social'><a target='_blank' href="#{App.SocialNetworks.twitterHref model.name, model.slug}"><i class='icon-facebook-squared'> </i></a></p>
          </div>  
        </div>
      </section>
    """

  itemTemplate: (model) ->
    """
      <section class="school normal">
        <div class="image">
          <figure>
            <div class="progress one-third"></div>
            <img src="#{model.image_url || '//placehold.it/128.png'}">
          </figure>
        </div>

        <div class="content">
          <header>
            <div class="name">#{model.name}</div class="name">
            <div class="location">Kampala, Uganda</div>
          </header>
          <p>#{model.story}</p>
           <div class='storyButtons'>
              
              <p class='social'><a target='_blank' href="#{App.SocialNetworks.twitterHref model.name, window.location}"><i class='icon-twitter'> </i></a></p>
              <p class='social'><a target='_blank' href="#{App.SocialNetworks.twitterHref model.name, model.slug}"><i class='icon-facebook-squared'> </i></a></p>
          </div>  
        </div>
      </section>

      <section class="normal">
        <h1><strong>Project Timeline</strong></h1>
        <div id="school_timeline"></div>
      </section>
    """

  startList: (schools) =>
    unless @map
      @map = new window.App.Map(element: 'map')
    
    @map.addSchool(schoolForMap) for hash,schoolForMap of @models
    
  start: (school) =>
    unless @map
      @map = new window.App.Map(element: 'map', lat: school.lat, lng: school.lng)
      
    for hash,schoolForMap of @models
      @map.addSchool schoolForMap

    @map.centerSchool school
    if @currentTimeLine
      @currentTimeLine.remove()
      delete @currentTimeLine

    @currentTimeLine = new window.App.Timeline(school, "#school_timeline")


window.App.SchoolController = SchoolController
