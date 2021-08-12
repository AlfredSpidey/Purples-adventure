extends KinematicBody2D

onready var rayE = get_node("rayE")
onready var rayD = get_node("rayD")
onready var sprite = get_node("sprite")
var fim = false
signal fim
var vivo = true
signal morreu 
signal moeda
var left
var right
var up
var punch

#-------------------------------------

const GRAVITY = 1100.0 


const FLOOR_ANGLE_TOLERANCE = 40
const WALK_FORCE = 600
const WALK_MIN_SPEED = 10
const WALK_MAX_SPEED = 300
const STOP_FORCE = 1300
const JUMP_SPEED = 700
const JUMP_MAX_AIRBORNE_TIME = 0.2

const SLIDE_STOP_VELOCITY = 1.0 
const SLIDE_STOP_MIN_TRAVEL = 1.0 

var velocity = Vector2()
var on_air_time = 100
var jumping = false
var punching = false


var prev_jump_pressed = false


func _fixed_process(delta):
	
	var force = Vector2(0, GRAVITY)
	
	var walk_left = (Input.is_action_pressed("move_left") or left) and vivo
	var walk_right = (Input.is_action_pressed("move_right") or right or fim) and vivo
	var jump = (Input.is_action_pressed("jump") or up) and vivo
	var soco = (Input.is_action_pressed("soco") or punch) and vivo
	
	
	var stop = true
	
	if (walk_left):
		if (velocity.x <= WALK_MIN_SPEED and velocity.x > -WALK_MAX_SPEED):
			force.x -= WALK_FORCE
			stop = false
	elif (walk_right):
		if (velocity.x >= -WALK_MIN_SPEED and velocity.x < WALK_MAX_SPEED):
			force.x += WALK_FORCE
			stop = false
	
	if (stop):
		var vsign = sign(velocity.x)
		var vlen = abs(velocity.x)
		
		vlen -= STOP_FORCE*delta
		if (vlen < 0):
			vlen = 0
		
		velocity.x = vlen*vsign
	

	velocity += force*delta
	

	var motion = velocity*delta
	

	motion = move(motion)
	
	var floor_velocity = Vector2()
	
	if (is_colliding()):
		
		var n = get_collision_normal()
		
		if (rad2deg(acos(n.dot(Vector2(0, -1)))) < FLOOR_ANGLE_TOLERANCE):
		
			on_air_time = 0
			floor_velocity = get_collider_velocity()
		
		if (on_air_time == 0 and force.x == 0 and get_travel().length() < SLIDE_STOP_MIN_TRAVEL and abs(velocity.x) < SLIDE_STOP_VELOCITY and get_collider_velocity() == Vector2()):
		
			
			revert_motion()
			velocity.y = 0.0
		else:
			
			motion = n.slide(motion)
			velocity = n.slide(velocity)
			
			move(motion)
	
	if (floor_velocity != Vector2()):
		
		move(floor_velocity*delta)
	
	if (jumping and velocity.y > 0):
	
		jumping = false
	
	if (on_air_time < JUMP_MAX_AIRBORNE_TIME and jump and not prev_jump_pressed and not jumping):
		
		pular()
		
	
	on_air_time += delta
	prev_jump_pressed = jump
	
	var no_chao = rayE.is_colliding() or rayD.is_colliding()
	
	if walk_right:
		sprite.set_flip_h(false)
	if walk_left:
		sprite.set_flip_h(true)
	if (walk_right or walk_left) and no_chao:
		sprite.play()
		sprite.set_animation("walking")
	elif (walk_right or walk_left):
		sprite.play()
		sprite.set_animation("jump")
		sprite.set_frame(6)
	elif (soco):
		soco()
	
	elif not (walk_right or walk_left) and no_chao :
		sprite.play()
		sprite.set_animation("parada")
	elif jumping:
		sprite.play()
		sprite.set_animation("jump")
	elif not vivo:
		sprite.play()
		sprite.set_animation("dead")
	
	if get_pos().y > 900:
		morrer()

func _ready():
	set_fixed_process(true)


func _on_pes_body_enter( body ):
	if not vivo: return
	pular()
	body.esmagar()

func soco():
	
	sprite.play()
	sprite.set_animation("punching")
	
	


func pular():
	velocity.y = -JUMP_SPEED
	jumping = true
	sprite.set_animation("jump")
	get_node("jumpSound").play()

	

func _on_corpo_body_enter( body ):
	if not vivo: return
	morrer()

func morrer():
	if not vivo: return
	vivo = false
	velocity.y = -500
	get_node("shape").set_trigger(true)
	emit_signal("morreu")
	sprite.set_animation("dead")


func _on_cabeca_body_enter( body ):
	if not vivo: return
	if body.has_method("destruir"):
		body.destruir()


func _on_touchLeft_pressed():
	left = true


func _on_touchRight_pressed():
	right = true


func _on_touchUp_pressed():
	up = true


func _on_touchLeft_released():
	left = false


func _on_touchRight_released():
	right = false


func _on_touchUp_released():
	up = false

func _on_punch_pressed():
	punch = true


func _on_punch_released():
	punch = false



func reviver():
	velocity = Vector2(0, 0)
	get_node("shape").set_trigger(false)
	get_node("camera").make_current()
	sprite.set_animation("walking")
	vivo = true
	fim = false

func _on_fim_body_enter( body ):
	fim = true
	emit_signal("fim")

func moeda():
	emit_signal("moeda")
	get_node("moedaSound").play()
	user_data_manager.set_data("coins", (user_data_manager.get_data("coins")+1))
	user_data_manager.save_data()

func _on_gameTime_timeout():
	morrer()






func _on_soco_body_enter( body ):
	if not vivo: return
	if((Input.is_action_pressed("soco") or punch) and vivo):
		if body.has_method("esmagar"):
			body.esmagar()
	








