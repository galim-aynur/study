module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        array = films_select(_array)
        ratings = array.reduce(0) { |acc, f| f['rating_kinopoisk'].to_f + acc }
        ratings / array.count
      end

      def chars_count(_films, _threshold)
        array = _films.select do |f|
          f['rating_kinopoisk'].to_f >= _threshold if f['rating_kinopoisk']
        end
        array.reduce(0) { |acc, f| f['name'].count('и') + acc }
      end

      private
      def films_select(films)
        films.select do |f|
          if f['country'] && f['rating_kinopoisk']
            f['country'].split(',').size >= 2 && f['rating_kinopoisk'].to_f > 0
          end
        end
      end

    end
  end
end
