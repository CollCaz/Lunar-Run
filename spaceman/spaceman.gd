extends CharacterBody2D

# tutorial spaceman, can'

signal  died

const ACC = 4000.0
const SPEED = 200.0
const JUMP_VELOCITY = -300.0

@export var cheating := false

var current_sprite : Sprite2D
var alive := true

@onready var timer = %OxyTimer
@onready var AniPlayer = %AnimationPlayer
@onready var SpriteRun = %Run
@onready var SpriteIdle = %Idle
@onready var SpriteDeath = %Death

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	set_as_current_sprite(SpriteIdle)
	AniPlayer.play("Idle")

func _process(_delta):
	# Kill
	if position.y > 1000:
		kill()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if alive:
		
		if is_on_floor() and direction == 0:
			set_as_current_sprite(SpriteIdle)
			AniPlayer.play("Idle")

		# Play falling animation when Spaceman is falling
		if velocity.y > 0:
			set_as_current_sprite(SpriteRun)
			AniPlayer.play("Fall")
		# Show running sprite when running
		if direction != 0 and is_on_floor():
			
			# print(direction)
			set_as_current_sprite(SpriteRun)
			AniPlayer.play("Jump")
		
		# Flip Spaceman
		if velocity.x > 0:
			flip_sprites(false)
		elif velocity.x < 0:
			flip_sprites(true)


		if direction and is_on_floor():
			velocity.x = move_toward(velocity.x, SPEED * direction, ACC * delta)
			# if (direction * velocity.x) > 0:
				# velocity.y = JUMP_VELOCITY * 0.6
			# else:
				# velocity.y = -abs(velocity.x)
			
			velocity.y = -abs(velocity.x)
			
		elif is_on_floor():
				
			velocity.x = move_toward(velocity.x, 0, ACC * 0.05 * delta)
		
		elif direction:
			velocity.x = move_toward(velocity.x, SPEED * direction, delta * SPEED * 0.1)

		# Handle Jump.
		if Input.is_action_pressed("ui_accept") and is_on_floor():
			set_as_current_sprite(SpriteRun)
			AniPlayer.play("Jump")
			velocity.y = JUMP_VELOCITY

	move_and_slide()


func set_as_current_sprite(sprite : Sprite2D) -> void:
	for child in $Animations.get_children():
		if child != sprite:
			child.hide()
		else:
			child.show()
			current_sprite = child

func flip_sprites(true_or_false : bool) -> void:
	for child in $Animations.get_children():
		child.flip_h = true_or_false



func _on_oxy_timer_timeout():
	if !cheating:
		alive = false
		set_as_current_sprite(SpriteDeath)
		AniPlayer.play("Death")
		$CollisionShape2D.disabled = true

func kill() -> void:
	get_tree().reload_current_scene()
