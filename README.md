JSON Reformat
=============

[![Build Status](https://travis-ci.org/gongo/json-reformat.png)](https://travis-ci.org/gongo/json-reformat)
[![Coverage Status](https://img.shields.io/coveralls/gongo/json-reformat.svg)](https://coveralls.io/r/gongo/json-reformat?branch=master)

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

## LICENSE

MIT License. see `json-reformat.el`
