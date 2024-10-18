@tool
extends LineEditValidate

@export var password_field_path: NodePath: set = set_password_field_path

var password_field: LineEdit


func _ready() -> void:
	await self.ready
	password_field = get_node(password_field_path)
	if not password_field:
		printerr("%s: Missing Password Field Path3D NodePath" % [get_path()])


func _get_configuration_warnings() -> PackedStringArray:
	var warnings = PackedStringArray()
	if not password_field:
		warnings.append("You must set the Password Field")
	return warnings

func _validate(text: String) -> bool:
	if not password_field:
		return false
	return password_field.text == text


func set_password_field_path(value: NodePath) -> void:
	password_field_path = value
	if not password_field:
		return
	password_field = get_node(password_field_path)
