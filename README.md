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

To add a custom flash event user the append method, the default zone will be :alert

```ruby
  FlashGordon::Flash.append("Notification Message")
```

You can specify a zone in the method, right now zones are hardcoded to the follow. 
This is purely for bootstrap elements to render the correct colored alert div's

```ruby
  # Available Zones are :warning, :alert, :log, :success, :info, :error, :danger
  FlashGordon::Flash.append("Success Message", :success)
``` 
To render the flashes, just put this anywhere in your view where you want to show, e.g application.html.erb

```ruby
  # application.html.erb
  <%= render_flash %>
```