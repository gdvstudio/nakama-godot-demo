# Interface to create a new character. Allows you to pick a color from a palette and set the
# character's name.
extends Panel

signal new_character_requested(name, color)

@onready var create_button := $VBoxContainer/CreateButton
@onready var name_field := $VBoxContainer/HBoxContainer/LineEdit
@onready var color_selector := $VBoxContainer/Color/ColorSelector

var value: bool = false  # Inicializa el valor según sea necesario
func set_enabled(enabled: bool) -> void:
	visible = enabled  # Cambia la visibilidad según el estado habilitado

	if not create_button:
		await self.ready
	create_button.disabled = not value
	name_field.editable = value


func open() -> void:
	visible = true  # Muestra el panel
	# Aquí puedes agregar más lógica para abrir el panel, como animaciones o inicializaciones
	color_selector.focus_first_swatch()


func request_character_creation() -> void:
	if name_field.text.length() == 0:
		return
	emit_signal("new_character_requested", name_field.text, color_selector.color)
	close()
# Método para cerrar el panel
func close() -> void:
	visible = false  # Cambia la visibilidad para ocultar el panel
	# Puedes agregar más lógica aquí si es necesario

func _on_CreateButton_pressed() -> void:
	request_character_creation()


func _on_LineEdit_text_entered(_new_text: String) -> void:
	request_character_creation()
