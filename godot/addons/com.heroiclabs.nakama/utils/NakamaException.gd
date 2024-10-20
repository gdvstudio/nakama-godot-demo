extends RefCounted

# An exception generated during a request.
# Usually contains at least an error message.
class_name NakamaException

var status_code : int = -1: set = _no_set
var grpc_status_code : int = -1: set = _no_set
var message : String = "": set = _no_set
var canceled : bool = false: set = _no_set

func _no_set(_p):
	pass

func _init(p_message : String = "", p_status_code : int = -1, p_grpc_status_code : int = -1, p_cancelled : bool = false):
	status_code = p_status_code
	grpc_status_code = p_grpc_status_code
	message = p_message
	canceled = p_cancelled

func _to_string() -> String:
	return "NakamaException(StatusCode={%s}, Message='{%s}', GrpcStatusCode={%s})" % [status_code, message, grpc_status_code]
