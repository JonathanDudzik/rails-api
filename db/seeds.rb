#---
# Excerpted from "Agile Web Development with Rails 6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails6 for more book information.
#---
# encoding: utf-8
Product.delete_all
# . . .
Product.create! do |p|
  p.title = 'Docker for Rails Developers'
  p.description = 'Build, Ship, and Run Your Applications Everywhere.
      Docker does for DevOps what Rails did for web development—it gives you 
      a new set of superpowers. Gone are “works on my machine” woes and lengthy 
      setup tasks, replaced instead by a simple, consistent, Docker-based 
      development environment that will have your team up and running in seconds. 
      Gain hands-on, real-world experience with a tool thats rapidly becoming 
      fundamental to software development. Go from zero all the way to production 
      as Docker transforms the massive leap of deploying your app in the cloud 
      into a baby step.'
  p.image_url = nil
  p.price = 38.00
  # p.image.attach(io: File.open("./storage/architecture.png"), filename: 'architecture.png')
  puts p.image.attached?
  # puts File.dirname("./storage/architecture.png")
end
# . . .
Product.new do |p|
  p.title = 'Build Chatbot Interactions'
  p.description = 'Responsive, Intuitive Interfaces with Ruby
The next step in the evolution of user interfaces is here. 
Chatbots let your users interact with your service in their
own natural language. Use free and open source tools along 
with Ruby to build creative, useful, and unexpected interactions 
for users. Take advantage of the Lita framework’s step-by-step 
implementation strategy to simplify bot development and testing.
From novices to experts, chatbots are an area in which everyone 
can participate. Exercise your creativity by creating chatbot 
skills for communicating, information, and fun.'
  p.image_url = nil
  p.price = 20.00
  p.save
end

Product.new do |p|
  p.title = "test"
  p.description = 'test test'
  p.image_url = nil
  p.price = 90.00
  p.save
end
# . . .
Product.create!(title: 'Programming Crystal',
  description:'Create High-Performance, Safe, Concurrent Apps.
      Crystal is for Ruby programmers who want more performance or for 
      developers who enjoy working in a high-level scripting environment. Crystal 
      combines native execution speed and concurrency with Ruby-like syntax, so 
      you will feel right at home. This book, the first available on Crystal, 
      shows you how to write applications that have the beauty and elegance of a 
      modern language, combined with the power of types and modern concurrency 
      tooling. Now you can write beautiful code that runs faster, scales better, 
      and is a breeze to deploy.',
  image_url: nil,
  price: 40.00
)