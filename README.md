Video Showcase
==============

- JavaScript (CoffeeScript) in `source/assets/javascripts/videoShowcase.coffee`
- Styles (Sass) in `source/assets/stylesheets/partials/_video.sass`

Usage
-----

```haml
.video.js-video
  %video.video-element.js-video-element(controls)
    %source{ src: 'assets/videos/sky.mp4', type: 'video/mp4' }
```

```coffeescript
jQuery ($) -> VideoShowcase.init()
```

### Vendor

If you want to use YouTube/Vimeo videos:

```haml
.video.video--vendor.js-video
  %iframe.js-video-element(width='560' height='315' src='https://www.youtube.com/embed/RljpEJNFVFo' frameborder='0' allowfullscreen)
```

```coffeescript
jQuery ($) -> VideoShowcase.init( { vendor: true } )
```
