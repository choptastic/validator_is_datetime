-module (validator_is_datetime).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
		render_action/1,
		validate/2
	]).

-spec render_action(#is_datetime{}) -> script().
render_action(R = #is_datetime{}) ->
	TriggerPath = R#is_datetime.trigger,
	TargetPath = R#is_datetime.target,
	AttachTo = R#is_datetime.attach_to,
	Text = wf:js_escape(R#is_datetime.text),
	validator_custom:render_action(#custom{
		trigger=TriggerPath,
		target=TargetPath,
		function=fun validate/2,
		text=Text,
		tag=R,
		attach_to=AttachTo
	}).

validate(_Rec, Value) ->
	%% If qdate crashes when parsing, then this is not a valid date or time, so
	%% return false.
	try qdate:to_unixtime(Value) of
		_ -> true
	catch
		_:_ -> false
	end.
