% Pute Realistic and Outrageous Unique Translator
-module(prout).
-export([parse/1]).

-include_lib("eunit/include/eunit.hrl").


parse(String) ->
    {_,ScanRes,_} = erl_scan:string(String),
    pute:parse(ScanRes).


assign_test() ->
    {ok,{":",{atom,1,a},{integer,1,1}}} = parse("a : 1").
values_test() ->
    {ok,{integer,1,1}} = parse("1"),
    {ok,{float,1,1.2}} = parse("1.2"),
    {ok,{atom,1,a}} = parse("a").
plus_test() ->
    {ok,{"+",{integer,1,1},{integer,1,1}}} = parse("1 + 1").
minus_test() ->
    {ok,{"-",0,{integer,1,1}}} = parse("-1"),
    {ok,{"+",{integer,1,1},{"-",0,{integer,1,1}}}} = parse("1 - 1").
mult_test() ->
    {ok,{"*",{integer,1,1},{integer,1,1}}} = parse("1 * 1").
div_test() ->
    {ok,{"/",{integer,1,1},{integer,1,1}}} = parse("1 / 1").
