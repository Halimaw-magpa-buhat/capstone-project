extends CanvasLayer

var progress =[]
var sceneName
var scene_load_status = 0

func ready():
	sceneName = "res://scenes/Level1.tscn"
	ResourceLoader.load_threaded_request(sceneName)
	
func _process(_delta):
		scene_load_status = ResourceLoader.load_threaded_get_status(sceneName,progress)
		$countdown.text = str(floor(progress[0]*100)) + "%"
		if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
			var _newScene = ResourceLoader.load_threaded_get(sceneName)


