module FlashGordon
  class Flash
    # Messages fall under different message zones, for now zones are hardcoded
    # eventually we can add custom ones via initializers

    @main_messages = Hash[FlashGordon.zones]

    def self.append(message,zone=:warning, options={})
      # Added options for future use
      if @main_messages[zone]
        if message.class == Array
          message.each do |m|
            @main_messages[zone] << m
          end
        else
          @main_messages[zone] << message
        end
      else
        raise "Zone does not exist, please use the following zones - #{@main_messages.map{|k| ":#{k[0]}"}.join(", ") } or add it to the initializer."
      end
    end

    def self.render(zone, glue)
      messages = get_messages(zone,glue)
    end

    def self.reset
      @main_messages = FlashGordon.reset_zones
    end

    def self.get_messages(zone, glue)
      messages = Hash[@main_messages]
      if zone == :all
        messages.each_pair do |k,v|
          if v.empty?
            # Remove empty zone keys
            messages.delete(k)
          else
            messages[k] = v.join(glue)
          end
        end
        messages
      elsif messages[zone]
        messages.each_pair do |k,v|
          if k == zone
            case glue
            when "br", ""
              messages[k] = messages[k].join(glue)
            else
              messages[k] = messages[k].each_with_index.map{|m,i| ElementDecorator.decorate_message(m,glue,i)}.join("")
            end
          else
            messages.delete(k)
          end
        end
        messages
      end
    end
  end

  class ElementDecorator
    def self.decorate_message(message, glue, index)
      # Splits the elements into sticky elements and sticky classes
      raw = glue.split(".")
      # Unsticky the element if it has an id tag stuck to it
      element = raw.map{|x| x["#"] ? x[0..x.index("#")-1] : x}[0]
      # Next you isolate the sticky id and classes into its own array
      ids = raw.map{|x| x[x.index("#")+1..-1].gsub("%",index.to_s) if x["#"]}.compact
      classes = raw[1..-1].map{|x| x["#"] ? x[0..x.index("#")-1] : x}
      # Lastly decorate the message with the intended tags with classes and ids
      "<#{element}#{" class='"+classes.join(" ")+"'" unless classes.empty? }#{" id='"+ids.join(" ")+"'" unless ids.empty? }>#{message}</#{element}>"
    end
  end
end
