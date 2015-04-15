# *************************************
#
#   Video Showcase
#
# *************************************
#
# @param $element    { jQuery object }
# @param $trigger    { jQuery object }
# @param $video      { jQuery object }
# @param $close      { jQuery object }
# @param $overlay    { jQuery object }
# @param overlayNode { string (selector) }
# @param closeNode   { string (selector) }
# @param activeClass { string }
#
# *************************************

@VideoShowcase = {}

@VideoShowcase = do ->

  # -------------------------------------
  #   Private Variables
  # -------------------------------------

  _settings  = {}
  _isPlaying = false
  _video     = null

  # -------------------------------------
  #   Initialize
  # -------------------------------------

  init = ( options ) ->
    _settings = $.extend
      $element    : $( 'body')
      $trigger    : $( '.js-video-trigger' )
      $video      : $( '.js-video-element' )
      $close      : $( '<a href="#" class="video-close js-video-close">&times;</a>' )
      $overlay    : $( '<div class="video-overlay js-video-overlay"></div>' )
      overlayNode : '.js-video-overlay'
      closeNode   : '.js-video-close'
      activeClass : 'is-video-playing'
      playDelay   : 1000
    , options

    _video = _settings.$video[0]

    _setEventHandlers()

  # -------------------------------------
  #   Set Event Handlers
  # -------------------------------------

  _setEventHandlers = ->

    # ----- Click: Trigger ----- #

    _settings.$trigger.on 'click', ( event ) ->
      event.preventDefault()

      _toggle( 'open' )

    # ----- Click: Close ----- #

    $( document ).on 'click', _settings.closeNode, ( event ) ->
      event.preventDefault()

      _toggle( 'close' )

    # ----- Click: Overlay ----- #

    $( document ).on 'click', _settings.overlayNode, ( event ) ->
      _toggle( 'close' )

    # ----- Keydown: Escape ----- #

    $( document ).on 'keydown', ( event ) ->
      switch event.which
        when 27 then _toggle( 'close' )

  # -------------------------------------
  #   Toggle
  # -------------------------------------

  _toggle = ( state ) ->
    switch state

      when 'open'
        _settings.$element.prepend(_settings.$overlay)
        _settings.$overlay.prepend(_settings.$close)

        setTimeout( ->
          _settings.$element.addClass(_settings.activeClass)
        , 200 )

        setTimeout( ->
          _play()
        , _settings.playDelay )

      when 'close'
        _settings.$element.removeClass(_settings.activeClass)
        _pause()

  # -------------------------------------
  #   Play
  # -------------------------------------

  _play = ->
    _video.play()
    _isPlaying = true

  # -------------------------------------
  #   Pause
  # -------------------------------------

  _pause = ->
    _video.pause()
    _isPlaying = false

  # -------------------------------------
  #   Stop
  # -------------------------------------

  _stop = ->
    _video.stop()
    _isPlaying = false

  # -------------------------------------
  #   Public Methods
  # -------------------------------------

  init : init

# -------------------------------------
#   Usage
# -------------------------------------
#
# VideoShowcase.init()
#

jQuery ($) -> VideoShowcase.init()
