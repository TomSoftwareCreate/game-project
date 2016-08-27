
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

var mat;
var stuff_mat;

func _ready():
	stuff_mat = FixedMaterial.new();
	stuff_mat.set_parameter(FixedMaterial.PARAM_DIFFUSE, Color(0,0,1));
	
	mat = FixedMaterial.new();
	mat.set_parameter(FixedMaterial.PARAM_DIFFUSE, Color(0.7,0.7,0.7))
	
	my_set_material(get_node("p1"), mat)
	
	add_stuff("p1","helmet")
	hide_stuff("p1","torso")
	
	add_stuff("p2","boots")
	hide_stuff("p2","lower_legs")
	
	add_stuff("p3","helmet")
	hide_stuff("p3","lower_legs")
	add_stuff("p3","boots")
	
	get_node("p1/AnimationPlayer").play("loop_bow");
	get_node("p2/AnimationPlayer").play("loop_walk");
	get_node("p3/AnimationPlayer").play("loop_bow");
	pass
	
#--------------------------
	
func my_set_material(var node, var mat):
	for child in node.get_children():
		my_set_material(child, mat);
		
	if (node extends MeshInstance) :
		node.get_mesh().surface_set_material(0, mat);
		
#-------------------------

func add_stuff(var here, var what):
	var root = load("res://scenes/test/" + what + ".scn").instance();	
	var mi = MeshInstance.new();
	mi.set_mesh(root.get_node("Armature/Skeleton/" + what).get_mesh());
	mi.get_mesh().surface_set_material(0, stuff_mat);
	get_node(here).get_node("Armature/Skeleton").add_child(mi);
	mi.set_skeleton_path("..");
	
#-------------------------

func hide_stuff(var here, var what):
	get_node(here).get_node("Armature/Skeleton/" + what).set_hidden(true)
	