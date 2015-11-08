# is_datetime

A simple `#is_datetime` validator for validating a date and time [Nitrogen Web
Framework](http://nitrogenproject.com)

## Installing into a Nitrogen Application

Add it as a rebar dependency by adding into the deps section of rebar.config:

```erlang
	{validator_is_datetime, ".*", {git, "git://github.com/choptastic/validator_is_datetime.git", {branch, master}}}
```

### Using Nitrogen's built-in plugin installer (Requires Nitrogen 2.2.0+)

Run `make` in your Application. The rest should be automatic.

### Manual Installation (Nitrogen Pre-2.2.0)

Run the following at the command line:

```shell
	./rebar get-deps
	./rebar compile
```

Then add the following includes into any module requiring the form

```erlang
	-include_lib("validator_is_datetime/include/records.hrl").
```

## Usage

```erlang
	wf:wire(my_button, my_time_field, #validation{validators=[
		#is_datetime{text="Value must be a parseable date or time format"}
	]})
```

## License

Copyright (c) 2015, [Jesse Gumm](http://sigma-star.com/page/jesse)
([@jessegumm](http://twitter.com/jessegumm))

Development Sponsored by [Sidello Property Service](http://sidelloproperty.com)

MIT License
