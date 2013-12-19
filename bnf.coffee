
module.exports = """

main :: [rule | comment]+ anyspace* eof ;

comment :: anyspace* '#' [any ^ eol]* eol ;

rule :: rule#_rule ;
_rule :: anyspace* .name:id anyspace* '::' [rule_body | true#true] anyspace* ';' ;

rule_body :: group ;

group :: or#group_or | and#group_and ;

group_or :: token [ anyspace* [['|' token] | not] ]+ ;
group_and :: token [ anyspace token]* ;

token :: token#_token ;
_token :: anyspace* [cap | ast]? [ sub:id | str!str | subgroup | not ] repeater? ;

cap :: .capattr:'.'? .cap:id [':' | .treatstr:'!'] ;
ast :: .ast:id '#' ;

repeater :: .repeat:_repeater ;
_repeater :: '+' | '*' | '?' ;

subgroup :: '[' group anyspace* ']' ;

not :: not#_not ;
_not :: '^' token ;

"""

