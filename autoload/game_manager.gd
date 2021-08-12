extends Node
var _default_user_data = {
        score1 = 0,
		score2 = 0,
		score3 = 0,
		score4 = 0,
		score5 = 0,
		world = 1,
		coins = 0,
		hearts = 0

}
func _ready():
        user_data_manager.connect(user_data_manager.LOADED,self,"init")
        user_data_manager.connect(user_data_manager.VERSION_MISMATCH,self,"_user_data_version_mismatch")
        user_data_manager.load_data(_default_user_data,"0.0.1");

func _user_data_version_mismatch(loaded_version,loaded_data):
    #    Check loaded_version, parse loaded_data and update the savedata
    #    UserDataManager.save_corrected_data(corrected_data)
    #    Then update the new version
    #    UserDataManager.update_version("0.0.2")
        init()
func init():
        print("INIT")
        pass
