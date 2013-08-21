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
  # It also accepts an array and will pad the messages with <br/> tags
  FlashGordon::Flash.append(["First messsage","Second Message"])
```

### Specifying a Flash zone
You can specify a zone in append method. The default zones are similar to bootstrap alerts classes, which are :warning, :success, :info, :danger. The rails default :error is included by default also.
```ruby
  # Available Zones are :warning, :success, :info, :error, :danger
  FlashGordon::Flash.append("Success Message", :success)
```

### Configuring custom zones
To create custom zones create an initializer file that contains the following:
``` ruby
  #config/initializers/flash_gordon.rb
  FlashGordon.setup do |config|
    #multi values will be added in next version
    config.add_zone(:pewpewpew)
  end

  #any_view
  FlashGordon::Flash.append("Message",:pewpewpew)
  # this will now work
```

### Rendering the Flash messages
To render the flashes, just put this anywhere in your view where you want to show, e.g application.html.erb

```ruby
  # application.html.erb
  <%= render_flash %>
```
