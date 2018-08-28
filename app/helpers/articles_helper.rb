module ArticlesHelper
  def long_article?(a)
    msg = if a.content.split('').count > 100
            'You may want to read this later'
          else
            'This is a quick read!'
                   end
    msg
end
end
