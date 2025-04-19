extends Sprite2D

@export var speed = 75

var velocity = Vector2()

var stun = false

@export var hp = 3
@export var knockback = 600
@export var screen_shake = 120
@export var point_value = 10

@onready var current_color = modulate

var blood_particles = preload("res://src/scenes/Player&Blood/blood_particles.tscn")

func _process(delta: float) -> void:
	if hp <= 0:
		if Global.camera != null:
			Global.camera.screen_shake(screen_shake, 0.2)
		
		Global.points += point_value
		if Global.node_creation_parent != null:
			var blood_particles_instance = Global.instance_node(blood_particles, global_position, Global.node_creation_parent)
			blood_particles_instance.rotation = (global_position - Global.player.global_position).angle()
			blood_particles_instance.modulate = Color.from_hsv(current_color.h, 0.75, current_color.v)
		HitSound.stop()
		DieSound.play()
		queue_free()

func basic_movement_towards_player(delta):
	if Global.player != null and stun == false:
		velocity = global_position.direction_to(Global.player.global_position)
		global_position += velocity * speed * delta
	elif stun:
		velocity = lerp(velocity, Vector2(0, 0), 0.3)
		global_position += velocity * delta

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy_damager") and stun == false:
		modulate = Color.WHITE
		velocity = -velocity * knockback
		HitSound.play()
		hp -= area.get_parent().damage
		stun = true
		$Stun_timer.start()
		area.get_parent().queue_free()

func _on_stun_timer_timeout() -> void:
	modulate = current_color
	stun = false
