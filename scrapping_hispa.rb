#!/usr/local/bin/ruby
require 'nokogiri'
require 'open-uri'

puts "Insert url: "
url = gets.chomp

imagenes = []

  document = Nokogiri::HTML(open(url))
  div_main = document.css('table.respuesta.post tbody tr td.reply')

  div_main.css('div.activa.activadis').each do |post|
    imagenes << post.css('a').attr('href')
  end

imagenes.each do |direccion|
  system("curl -O #{direccion}")
end
