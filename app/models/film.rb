class Film < ContentfulModel::Base
  self.content_type_id = 'film'

  belongs_to_many :events, class_name: 'Event'

  return_nil_for_empty :title, :alt_title, :tmdb_id, :image, :youtube_id,
                       :vimeo_id, :description, :director, :runtime,
                       :original_language, :country_of_origin, :genres,
                       :release_date, :tags

  def formatted_runtime
    if runtime
      hours = (runtime / 60).to_i
      minutes = (runtime % 60).to_i
      "#{hours}h #{minutes}m"
    end
  end

  def image_url
    image&.file&.url
  end

  def trailer
    if vimeo_id
      "https://player.vimeo.com/video/#{vimeo_id}?title=0&byline=0&portrait=0"
    elsif youtube_id
      "https://www.youtube.com/embed/#{youtube_id}?rel=0&amp;&amp;showinfo=0"
    end
  end
end
