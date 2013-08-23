flash_gordon
============

Flash Gordon is a Rails Flash helper Gem that allows you to add custom flash notification handlers anywhere within your application.

Installation:
-------------

```ruby
  # Gemfile
  gem 'flash_gordon'
```

Usage:
------

### Appending to the Flash event
To add a custom flash event user the append method, the default zone will be :alert

```ruby
  FlashGordon::Flash.append("Notification Message")
  # It also accepts an array and will pad the messages with <br/> or otherwise specified tags
  FlashGordon::Flash.append ["You can include", "Arrays which will be joined", "by your specified glue"]
```

### Specifying a Flash zone
You can specify a zone in append method. The default zones are similar to bootstrap alerts classes, which are :warning, :success, :info, :danger. The rails default :error is included by default also.
```ruby
  # Available Zones are :warning, :success, :info, :error, :danger
  FlashGordon::Flash.append "Success Message", :success
```

### Configuring custom zones
To create custom zones create an initializer file that contains the following:
``` ruby
  # config/initializers/flash_gordon.rb
  FlashGordon.setup do |config|
    #multi values will be added in next version
    config.add_zone(:pewpewpew)
  end

  # Any view
  FlashGordon::Flash.append("Message",:pewpewpew)
  # this will now work
```

### Rendering the Flash messages
To render the flashes, just put this anywhere in your view where you want to show, e.g application.html.erb

```ruby
  # application.html.erb
  <%= render_flash %>
```

### Custom Flash Render
If you dont want to use an all in one flash render, you can cherry pick your render by specifying the zone, glue and container tag

For example,
```ruby
  # For example if you want to build a unordered list of the :danger zone with each listing having
  # a class of 'flash-item' and a unique id of 'flash-i' where i is the index of the element.
  # Note that % is replaced by the index of messages starting from 0
  # Use the following syntax to render a custom zone, 
  # render_flash zone, glue, tag
  <%= render_flash :danger, "li.flash-item#flash-%", "ul" %>

  # If the glue is set to "br" will separate each element by <br> tags instead of a wrapping element.
  # If the glue is set to "" it will just join the messages without spacing.
```

Produces
```html
  <ul class="alert alert-danger">
    <li class="flash-item" id="flash-0"> Your first message</li>
    <li class="flash-item" id="flash-1"> Your second message</li>
    <li class="flash-item" id="flash-2"> Your third message</li>
  </ul>
```

License
-------

This project is on a kickass MIT-License :O  