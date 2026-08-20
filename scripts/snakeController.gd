extends Node2D

enum Direction{
	LEFT,
	RIGHT,
	UP,
	DOWN
}

@export var snakeBody : Sprite2D

var speed = 3
var currDir = Direction.UP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var horizontalIp = round(Input.get_axis("ui_left", "ui_right"))
	var verticalIp = round(Input.get_axis("ui_down", "ui_up"))
	
	if(abs(horizontalIp) > 0):
		currDir = Direction.RIGHT if (horizontalIp > 0) else Direction.LEFT
	if(abs(verticalIp) > 0):
		currDir = Direction.UP if (verticalIp > 0) else Direction.DOWN
	updateSnakePos()
	pass

func addSnakeBody() -> void:
	#snakeBody
	pass

func updateSnakePos() -> void:
	match currDir:
		Direction.LEFT:
			position.x -= speed
			pass
		Direction.RIGHT:
			position.x += speed
			pass
		Direction.UP:
			position.y -= speed
			pass
		Direction.DOWN:
			position.y += speed
			pass
	pass
