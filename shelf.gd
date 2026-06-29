extends Furniture

@onready var glass = $EmptyGlass
@onready var glass2 = $EmptyGlass2
var has_glass=true

func _process(delta: float) -> void:
	if len(gives) == 0 && has_glass:
		has_glass=false
		self.remove_child(glass)
		self.remove_child(glass2)
		
