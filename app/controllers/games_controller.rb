require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.shuffle[0..9]
  end

  def score
    @word = params[:ask]
    @letters = params[:letters]
    @url = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}").read
    @check = JSON.parse(@url)
    @check_exist = []

    @word.downcase.split("").each do |letter|
      @check_exist << @letters.include?(letter.downcase)
    end
  end
end
