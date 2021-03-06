
USING: kernel math sequences tools.test utils ;

IN: utils

[ { 1 2 } ] [ 1 => 2 ] unit-test
[ { "abc" "def" } ] [ "abc" => "def" ] unit-test
[ { t "some value" } ] [ t => "some value" ] unit-test
[ { { 1 2 } { 3 4 } } ] [ { 1 => 2 3 => 4 } ] unit-test
[ H{ { 1 2 } { 3 4 } } ] [ H{ 1 => 2 3 => 4 } ] unit-test

TUPLE: foo a b c ;

[ T{ foo f } ] [ H{ } foo new [ set-slots ] keep  ] unit-test
[ H{ { "d" 0 } } foo new set-slots ] must-fail

[ T{ foo f 1 2 3 } ]
[ H{ { "a" 1 } { "b" 2 } { "c" 3 } } foo new [ set-slots ] keep ]
unit-test

USE: math.statistics

[ { { 1 3 } { "Other" 2 } } ]
[ { 1 1 1 2 2 } histogram 1 trim-histogram ] unit-test

[ { "negative" 0 "positive" } ] [
    { -1 0 1 } [
        {
           { [ 0 > ] [ "positive" ] }
           { [ 0 < ] [ "negative" ] }
           [ ]
        } cond-case
    ] map
] unit-test

[ H{ } ] [ { } assoc-merge ] unit-test

[ H{ { "a" V{ 2 5 } } { "b" V{ 3 } } { "c" V{ 10 } } } ]
[
    { H{ { "a" 2 } { "b" 3 } } H{ { "a" 5 } { "c" 10 } } }
    assoc-merge
] unit-test

[ "1" "123" ] [ "1" "123" [ length ] [ > ] swap-when ] unit-test
[ "123" "1" ] [ "1" "123" [ length ] [ < ] swap-when ] unit-test

[ f ] [ { } majority ] unit-test
[ 1 ] [ { 1 } majority ] unit-test
[ f ] [ { 1 2 } majority ] unit-test
[ 1 ] [ { 1 1 2 } majority ] unit-test
[ f ] [ { 1 1 2 2 } majority ] unit-test
[ 2 ] [ { 1 1 2 2 2 } majority ] unit-test
[ 3 ] [ { 1 2 3 1 2 3 1 2 3 3 } majority ] unit-test

[ "1st" ] [ 1 humanize ] unit-test
[ "2nd" ] [ 2 humanize ] unit-test
[ "3rd" ] [ 3 humanize ] unit-test
[ "4th" ] [ 4 humanize ] unit-test
[ "11th" ] [ 11 humanize ] unit-test
[ "12th" ] [ 12 humanize ] unit-test
[ "13th" ] [ 13 humanize ] unit-test
[ "21st" ] [ 21 humanize ] unit-test

[ "" ] [ "abcd" dup length [ remove-random nip ] times ] unit-test
