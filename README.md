# Voting app for interview exercises

## My notes

To start, follow the installation and running instructions below.
But of course, you probably wrote this exercise, so you already knew that.
Anyways...

I had Ruby 3.4.1 and Rails 8 installed, so i went with those (updated Gemfile as such).

I used the `rails generate authentication` script to set up the session scaffold,
then undid the password verification part so it'd just take whatever email you put in.
Seems to work.

Once you sign in, you'll be redirected to the voting page.
First time, you'll have to write in a band name. After that, you can write in or select a radio button of an exising band.
Up to ten bands will be allowed - after that, you can only select an existing one.

When you submit the vote, you'll be redirected to the results page.

I did add a `I'm done` button on the results page, which logs you out.
Seemed like the thing to do.

If you sign in with an existing email, you can re-vote (changes your vote, doesn't add to it).
I figured this was appropriate, cuz after all if you're at a music festival you're probably
getting wasted and forgot you already voted. So, whatever...

There's also a /users page so you can list all the users. Did that really for debugging,
but it seems handy anyway.

Once you're signed in, if you go back to home (`localhost:3000/`), you'll get a little greeting page
reminding you of your email. Cuz you probably forgot, right?

So, have fun. Drive home safe. Or take the bus. Or walk, cuz it's a great summer night
and you want to savor the last moments of the music reverberating in your head....

## Installation

Your development environment should have:

* Ruby v3.2.2
* [Bundler](https://bundler.io/)
* Node v20.18.2
* Yarn v1.22.19
* git
* [SQLite3](https://www.sqlite.org/)

Initialize git, install the application, and initialize the database:

```sh
# First, download the zip file, unzip the directory,
# and navigate into the project directory. Then:
git init
git add .
git commit -m "Initial files provided"
bundle install
bundle exec rake db:migrate

# Install JS packages, including React
yarn install
```

## Running the app

```sh
bundle exec rails server
```

Visit [http://localhost:3000](http://localhost:3000) in your browser

For asset live reloading, run:
```sh
./bin/shakapacker-dev-server
```

If the assets ever get out of sync, delete `/public/packs` and restart your
Rails server (and your shakapacker-dev-server if it was running).

## Running tests

The included test suite uses Rspec and Capybara.

Check out `spec/requests/` for example tests.

```sh
# Run all tests
bundle exec rspec

# Run one test file
bundle exec rspec <path/to/the/file.rb>

# Run one test case inside a test file
bundle exec rspec <path/to/the/file.rb>:<line_number>
```

## Accessing the Rails console

```sh
bundle exec rails console
```

## Debugging

You can open up a debugging console by adding `binding.pry` anywhere in test or
application code.

Example:

```rb
def show
  binding.pry
  render json: { data: @my_object }, status: :ok
end
```

In this example, when the `show` method is hit during click testing or a test,
a debugger will open up in the terminal, where you can inspect values:

```rb
@my_object.id
@my_object.valid?
```

Step to the next line with `next`. Resume regular code execution or tests with
`continue`.
