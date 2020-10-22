#!/usr/local/bin/ruby
require 'nokogiri'
require 'open-uri'

puts "Insert url: "
url = gets.chomp

imagenes = []

  document = Nokogiri::HTML(open(url))
  div_main = document.css('div.thread')

  div_main.css('span.filesize').each do |post|
    imagenes << post.css('a').attr('href')
  end

  imagenes.each do |direccion|
  	system("curl -O #{direccion}")
  end