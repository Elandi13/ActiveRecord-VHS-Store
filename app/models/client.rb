class Client < ActiveRecord::Base
    has_many :rentals 
    has_many :vhs, through: :rentals

    #Client.first_rental - accepts and instance of arguments needed to create a new Client instance and a currently available Vhs instance (or, more difficult: a Movie instance or just a Movie title and on that basis chooses a currently available vhs); it creates a new Client instance and a new Rental instance with current set to true.

    def self.first_rental(name, home_address)
        #binding.pry
        new_client = Client.create(name, home_address)
        vhs1 = Vhs.all.shuffle.first{|vhs| vhs.current == false}
        puts new_client
        puts vhs1
        #Rental.create()

    end
   
   # Client#favorite_genre ⭐️ - puts the name of the genre that the client rented the most; in counting how many times a person watched a genre, you can treat two rentals of the same movie as two separate instances;
    # def most_rented
    #     binding.pry
    #     rental = Rental.all.select{|rental| rental.client_id == self.id}
    # end

    def movies
        self.vhs.map{|vhs| vhs.movie}
    end

    def genres
       genres = movies.map{|m| m.genres}.flatten
       genres
    end

    def favorite_genres_helper
        movie_genres = {}
        genres.each do |genre, num|
           num = 0
            if movie_genres[genre]
                movie_genres[genre][num] += 1
            else 
                movie_genres[genre] = {}
                movie_genres[genre][genre] = genre
                movie_genres[genre][num] = 1
            end
        end
        movie_genres
    end

    def favorite_genre
        #binding.pry
        my_fav = favorite_genres_helper.max_by{|genre| genre.count}
        my_fav[0][:name]
    end













end