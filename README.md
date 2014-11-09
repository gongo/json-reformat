JSON Reformat
=============

[![Build Status](https://travis-ci.org/gongo/json-reformat.png)](https://travis-ci.org/gongo/json-reformat)
[![Coverage Status](https://img.shields.io/coveralls/gongo/json-reformat.svg)](https://coveralls.io/r/gongo/json-reformat?branch=master)
[![melpa badge][melpa-badge]][melpa-link]
[![melpa stable badge][melpa-stable-badge]][melpa-stable-link]

`json-reformat.el` is reformat tool for [JSON](http://en.wikipedia.org/wiki/JavaScript_Object_Notation).

## Requirements

- Emacs 23 or higher

## Installation

You can install from [MELPA](http://melpa.milkbox.net/) with package.el

    M-x package-install RET json-reformat

## Usage

```
M-x json-reformat-region
```

### Sample 1

![](https://github.com/gongo/json-reformat/raw/master/images/json-reformat_demo.gif)

### Sample 2

![](https://github.com/gongo/json-reformat/raw/master/images/json-reformat-2-before.png)

![](https://github.com/gongo/json-reformat/raw/master/images/json-reformat-2-after.png)

## Configuration

```lisp
json-reformat:indent-width (integer)

    Change indentation level (default 4)
```

## IMPORTANT

From emacs 24.4, `json-pretty-print` and `json-pretty-print-buffer` was bundled.

Example:

```json
{"name":"foobar","nick":"foo \u00e4 bar","description":"<pre>\nbaz\n</pre>"}
```

Result of `json-pretty-print`:

```json
{
  "description": "<pre>\nbaz\n<\/pre>",
  "nick": "foo \u00e4 bar",
  "name": "foobar"
}
```

Result of `json-reformat-region`:

```json
{
  "description": "<pre>
baz
</pre>",
  "nick": "foo ä bar",
  "name": "foobar"
}
```

## LICENSE

MIT License. see `json-reformat.el`

[melpa-link]: http://melpa.org/#/json-reformat
[melpa-stable-link]: http://stable.melpa.org/#/json-reformat
[melpa-badge]: http://melpa.org/packages/json-reformat-badge.svg
[melpa-stable-badge]: http://stable.melpa.org/packages/json-reformat-badge.svg
