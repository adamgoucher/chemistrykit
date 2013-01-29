[![Gem Version](https://badge.fury.io/rb/chemistrykit.png)](http://badge.fury.io/rb/chemistrykit)
[![Dependency Status](https://gemnasium.com/arrgyle/chemistrykit.png)](https://gemnasium.com/arrgyle/chemistrykit)

ChemistryKit
============================================================

### A simple and opinionated web testing framework for Selenium built in Ruby

For a Python and PHP version, check out [py.saunter and saunter.php](https://github.com/Element-34/). ChemistryKit's inspiration comes from Saunter.

## Installation

Add this line to your application's Gemfile:

    gem 'chemistrykit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chemistrykit

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Spec Discovery
--------------

All Chemistry Kit specs are in the _spec_ directory. Rather than being discovered via class or file name as some systems they are by identified by tag. The tagging implementation in RSpec isn't the greatest, but...

```ruby
it 'with invalid credentials', :depth => 'shallow' do

end

it 'with invalid credentials', :depth => 'deep' do

end
````
All specs should have at least a :depth tag. The depth should either be 'shallow' or 'deep'. Shallow specs are the ones that are the absolute-must-pass ones. And there will only be a few of them typically. Deep ones are everything else.

You can add multiple tags as well.

```ruby
it 'with invalid credentials', :depth => 'shallow', :authentication => true do

end
````

By default Chemistry Kit will discovery and run the _:depth => 'shallow'_ scripts. To run different ones you use the --tag option.

    ckit --tag authentication

    ckit --tag depth:shallow --tag authentication

To exlude a tag, put a ~ in front of it.

    ckit --tag depth:shallow --tag ~authentication

A useful trick when developing a script is to use a custom tag.

```ruby
it 'with invalid credentials', :depth => 'shallow', :flyingmonkeybutt => true do

end
````

Execution Order
---------------

Chemistry Kit executes specs in a random order. This is intentional. Knowing the order a spec will be executed in allows for dependencies between them to creep in. Sometimes unintentionally. By having them go in a random order parallelization becomes a much easier.

Facade all the Things!
----------------------

Chemistry Kit injects itself between you and WebDriver, the page-object gem, and various other future components. You should also inject something between your project and Chemistry Kit. Chemistry Kit has started this for you in the following ways:

- _lib/tailored/webdriver.rb_: @driver inside your scripts refers to this class

Configuration
-------------

Configuration should not be in your script. Nor should it be commit to version control. Before you can run a spec you need to copy _config/chemistrykit.yaml.default_ to _config/chemistrykit.yaml_. The various keys that are available and what they do is in the default file.

To use something in the config it is as simple as 

```ruby
CHEMISTRY_CONFIG['chemistrykit']['baseurl']
```

You can add your own sections as well. And probably should. 

Before and After
----------------

Chemistry Kit uses the 4-phase model for scripts with a chunk of code that gets run before and after each method. By default, it does nothing more than launch a browser instance that your configuration says you want. If you want to do something more than that, just add it to your spec.

```ruby
before(:each) do
    # something here
end
```

You can even nest them inside different describe/context blocks and they will get executed from the outside-in.

Logs and CI Integration
-----------------------

Each run of Chemistry Kit creates a timestamped directory inside the logs directory. And in there will be the full set of JUnit Ant XML files. You don't point your CI server at this timestamped directory. Instead you want to point at the _latest_ directory which is a symlink to the latest timestamp directory.
