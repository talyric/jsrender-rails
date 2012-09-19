# jsRender-rails

This gem adds jsRender (next generation of jQuery Templates) and a corresponding Sprockets engine to the asset pipeline for Rails >= 3.1 applications.

## Installation

Add it to your Gemfile and run `bundle` or run `gem install jsRender-rails`.

## Usage

jsRender tempaltes will be recognized by Sprockets with the `.tmpl` extension. Place them anywhere in the Sprockets load path.

```html
<!-- app/assets/javascripts/views/user.tmpl -->
<div class="user">{{>name}}</div>
```

In your JavaScript manifest file, require jsRender followed by your folder containing all your templates/views. The templates are compiled and named with their Sprockets logical path:

```javascript
<!-- app/assets/javascripts/application.js -->
//= require jsrender
//= require_tree ./views

$(body).append($.render["views/user"]({name:"Sebastian Pape"}));
```

## Configuration

If the path to all of your views/templates have a common prefix that you prefer is not included in the template's name, you can set this option in `config/application.rb`:

```ruby
config.jsrender.prefix = "views"
```

That would change the previous example to this:

```javascript
$(body).append($.render["user"]({name:"Sebastian Pape"}));
```

The prefix can also be a regular expression. For example, to use only the name of the file for the template name, regardless of directory structure:

```ruby
config.jsrender.prefix = %r{([^/]*/)*}
```

## Acknowledgements

This is not compatible with jQuery Templates!

If you like to use haml in your jsRender templates I highly recommend [haml_assets](https://github.com/infbio/haml_assets).

The idea to easily adding JavaScript templates to the Rails Asset-Pipeline comes from [jimmycuadra/jquery-tmpl-rails](https://github.com/jimmycuadra/jquery-tmpl-rails) and was adopted here to work with jsRender.

The Sprockets engine was originally derived from the [sprockets-jquery-tmpl](https://github.com/rdy/sprockets-jquery-tmpl) gem. If you want a similar mechanism for use outside of Rails, take a look at this project.
