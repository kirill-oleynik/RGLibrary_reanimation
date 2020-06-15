# frozen_string_literal: true

task default: 'validate'

desc 'Run rubocop > fasterer > rspec (only if previous succeed)'
task :validate do
  if system 'rubocop'
    system 'rspec' if system 'fasterer'
  end
end
namespace :lib do
  desc 'Initilize empty Library with default db settings'
  task :create do
    # code
  end
  desc 'Initialize Library from dummy data'
  task :bootstrap do
    # code
  end
  task boot: :bootstrap
  desc 'Initialize Library from existing yaml file'
  task :load, :filepath do |_, args|
    # code
  end
  desc 'Add new author to current library'
  task :add_author, :name, :bio do |t, args|
    # code
  end
  desc 'Add new reader to current library'
  task :add_reader, :name, :email, :city, :street, :house do |t, args|
    # code
  end
  task :add_book, :author_name, :author_bio, :book_title do |_, args|
    # code
  end
  task :add_reader, :name, :email, :city, :street, :house do |_, args|
    # code
  end
  task :add_order, :book_title, :erader_name, :reader_email, :author_name, :date do |_, args|
    # code
  end
  desc 'Save changes to Library'
  task :save do
    # code
  end
  namespace :stats do
    desc 'one that takes the most number of books. Default quantity is  1 reader.'
    task :top_reader, :qantity do |_, args|
      # code
    end
    desc 'The book that was taken by READERS the most times. Default quantity is 1 book.'
    task :popular_books, :quantity do |_, args|
      # code
    end
    task pop_books: :popular_books
    desc 'Number of readers of the most popular books. Default quantity of readers is 3.'
    task :popular_books_readers, :quantity do |_, args|
      # code
    end
    task pop_books_readers: :popular_books_readers
  end
end
