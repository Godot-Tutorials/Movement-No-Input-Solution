extends Sprite

var gameWidth: int = OS.get_window_size().x
var gameHeight: int = OS.get_window_size().y
var spriteWidth: int = get_texture().get_width()
var spriteHeight: int = get_texture().get_height()

var halfSpriteHeight: int = spriteHeight / 2
var lowerLimit: int = gameHeight + halfSpriteHeight

export var currentSpeed: float = 100.0
export var acceleration: float = 300.0
export var maxSpeed: float = 1500.0

func _enter_tree():
	positionTopCenter()

func _physics_process(delta: float) -> void:
	moveDown(delta)
	if(currentSpeed < maxSpeed):
		addAcceleration(delta)
	
	if(position.y > lowerLimit):
		resetFall()
		pass

func addAcceleration(delta: float) -> void:
	currentSpeed += delta * acceleration

func moveRight(delta: float) -> void:
	position.x += currentSpeed * delta

func moveLeft(delta: float) -> void:
	position.x -= currentSpeed * delta

func moveUp(delta: float) -> void:
	position.y -= currentSpeed * delta

func moveDown(delta: float) -> void:
	position.y += currentSpeed * delta

func resetFall() -> void:
	position.y = 0 - halfSpriteHeight







func positionTopCenter() -> void:
	self.position.x = gameWidth / 2
	self.position.y = spriteHeight / 2

func positionBottomCenter() -> void:
	self.position.x = gameWidth / 2
	self.position.y = gameHeight - (spriteHeight / 2)

func positionLeftCenter() -> void:
	self.position.x = spriteWidth / 2
	self.position.y = gameHeight / 2

func positionRightCenter() -> void:
	self.position.x = gameWidth - (spriteWidth / 2)
	self.position.y = gameHeight / 2

func positionMiddle() -> void:
	self.position.x = gameWidth / 2
	self.position.y = gameHeight / 2
