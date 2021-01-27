extends Area2D
class_name BulletBoss

var speed: float = 500

func _physics_process(delta):
	position.y += speed * delta


func _on_Bullet_area_entered(area):
	if area.is_in_group("damageable"):
		area.damage(10)
		queue_free()



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
