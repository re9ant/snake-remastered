extends Node2D

@export var snakeBodyContainer : Node2D
@export var snakeBodyScene : PackedScene

var speed = 3
var currMoveDir = Vector2(0, 1)
var bodyOffset = 130
var currBodies = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currBodies = 0
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var horizontalIp = round(Input.get_axis("ui_left", "ui_right"))
	var verticalIp = round(Input.get_axis("ui_down", "ui_up"))
	
	if(abs(horizontalIp) > 0):
		currMoveDir = Vector2(1, 0) if (horizontalIp > 0) else Vector2(-1, 0)
	if(abs(verticalIp) > 0):
		currMoveDir = Vector2(0, -1) if (verticalIp > 0) else Vector2(0, 1)
		
	updateSnakePos()
	if(Input.is_action_just_pressed("ui_accept")):
		addSnakeBody()
	pass

func addSnakeBody() -> void:
	currBodies += 1
	var spawnedBody = snakeBodyScene.instantiate() as Sprite2D
	snakeBodyContainer.add_child(spawnedBody)
	var spawnPos = global_position
	spawnPos -= currMoveDir * (bodyOffset * currBodies)
	spawnedBody.global_position = spawnPos
	print(spawnPos)
	pass

func updateSnakePos() -> void:
	position += currMoveDir * speed
	pass
