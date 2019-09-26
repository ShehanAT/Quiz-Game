module UserHelper

    def inline_errors(model, model_attribute)
      result = ""
      if model.errors[model_attribute].any?
           model.errors[model_attribute].each do |message|
              result += "<li>#{message}</li>"
          end
      end
      return "<ul>#{result}</ul>".html_safe
    end

end