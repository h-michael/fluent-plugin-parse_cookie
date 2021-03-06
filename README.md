## Fluent::Plugin::ParseCookie, a plugin for [Fluentd](http://fluentd.org)
[![Build Status](https://travis-ci.org/h-michael/fluent-plugin-parse_cookie.svg?branch=master)](https://travis-ci.org/h-michael/fluent-plugin-parse_cookie)

Fluentd plugin to parse cookie log.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fluent-plugin-parse_cookie'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-parse_cookie

## Requirements

| fluent-plugin-parse_cookie | Fluentd     | Ruby   |
|---------------------------|-------------|--------|
| >= 2.0.0                  | >= v0.14.0  | >= 2.1 |
| < 2.0.0                   | >= v0.12.0  | >= 1.9 |

## Usage

default usage
```
<match foo.**>
  type parse_cookie
  key  cookie
</match>

input
"test" {
  "cookie": "foo=baz; empty=; array=123; array=abc; array=1a2b"
}

output
    "parsed_cookie.test" {
      "cookie": "foo=baz; empty=; array=123; array=abc; array=1a2b"
      "foo": ["baz"],
      "empty": [],
      "array": ["123", "abc", "1a2b"]
    }
```

change tag prefix (default tag prefix is "parsed_cookie.")
```
<match foo.**>
  type parse_cookie
  key  cookie
  tag_prefix changed.

</match>

input
"test" {
  "cookie": "foo=baz; empty=; array=123; array=abc; array=1a2b"
}

output
    "changed.test" {
      "cookie": "foo=baz; empty=; array=123; array=abc; array=1a2b"
      "foo": ["baz"],
      "empty": [],
      "array": ["123", "abc", "1a2b"]
    }
```

If you want to remove empty array.
```
<match foo.**>
  type                parse_cookie
  key                 cookie
  remove_empty_array  true
</match>

input
"test" {
  "cookie": "foo=baz; empty=; array=123; array=abc; array=1a2b"
}

output
    "parsed_cookie.test" {
      "cookie": "foo=baz; empty=; array=123; array=abc; array=1a2b"
      "foo": ["baz"],
      "array": ["123", "abc", "1a2b"]
    }
```

If you want convert array that has only single object to string.
```
<match foo.**>
  type                    parse_cookie
  key                     cookie
  single_value_to_string  true
</match>

input
"test" {
  "cookie": "foo=baz; empty=; array=123; array=abc; array=1a2b"
}

output
    "parsed_cookie.test" {
      "cookie": "foo=baz; empty=; array=123; array=abc; array=1a2b"
      "foo": "baz",
      "empty": [],
      "array": ["123", "abc", "1a2b"]
    }
```

If you want remove cookie from record.
```
<match foo.**>
  type           parse_cookie
  key            cookie
  remove_cookie  true
</match>

input
"test" {
  "cookie": "foo=baz; empty=; array=123; array=abc; array=1a2b"
}

output
    "parsed_cookie.test" {
      "foo": ["baz"],
      "empty": [],
      "array": ["123", "abc", "1a2b"]
    }
```

If you want create key with parsed data.
```
<match foo.**>
  type           parse_cookie
  key            cookie
  sub_key        cookie_parsed
</match>

input
"test" {
  "cookie": "foo=baz; empty=; array=123; array=abc; array=1a2b"
}

output
    "parsed_cookie.test" {
      "cookie": "foo=baz; empty=; array=123; array=abc; array=1a2b",
      "cookie_parsed": {
        "foo": ["baz"],
        "empty": [],
        "array": ["123", "abc", "1a2b"]
      }
    }
```

## Option Parameters

### key :String
key is used to point a key thad is cookie.

### tag_prefix :String
Added tag prefix.
Default value is "parsed."

### remove_empty_array :Bool
You want to remove empty array.
You must be this option setting true.
Default value is false.

### single_value_to_string :Bool
You want to convert array that has only single object to string.
You must be this option setting true.
Default value is false.

### remove_cookie :Bool
You want to remove cookie.
You must be this option setting true.
Default value is false.

### sub_key :String
You want to put parsed data into separate key.
Default value is false.

## Change log
See [CHANGELOG.md](https://github.com/h-michael-z/fluent-plugin-parse_cookie/blob/master/CHANGELOG.md) for details.

## Contributing

1. Fork it ( https://github.com/h-michael-z/fluent-plugin-parse_cookie/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
