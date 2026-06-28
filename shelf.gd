extends Furniture

@onready var glass = $EmptyGlass
var has_glass=true

func _process(delta: float) -> void:
	if len(gives) == 0 && has_glass:
		has_glass=false
		self.remove_child(glass)
		
