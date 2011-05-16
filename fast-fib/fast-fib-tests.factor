
USING: fast-fib sequences tools.test ;

IN: fast-fib.tests

[ -1 slow-fib ] must-fail
[ { 0 1 1 2 3 5 8 } ] [ 7 iota [ slow-fib ] map ] unit-test

[ -1 okay-fib ] must-fail
[ { 0 1 1 2 3 5 8 } ] [ 7 iota [ okay-fib ] map ] unit-test

[ -1 fast-fib ] must-fail
[ { 0 1 1 2 3 5 8 } ] [ 7 iota [ fast-fib ] map ] unit-test
