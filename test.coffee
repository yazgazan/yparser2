#!/usr/bin/env coffee

YParser = require "./yparser"

bnf = require "./bnf"
testbnf = require "./testbnf"

class YParser2 extends YParser.AstParser
  constructor: ->
    super()
    gram = new YParser.GrammarParser
    gram.loadString bnf
    parser = gram.loadGrammar()
    @grammars = parser.grammars

test = new YParser2

test.loadString testbnf
if (test.execGrammar "main") is false
  throw Error "Failed to exec grammar"

console.log JSON.stringify test.ast, null, 2

