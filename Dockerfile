FROM ruby:2.2.4-onbuild

CMD ["bundle", "exec", "unicorn", "-c", "./unicorn.rb"]
