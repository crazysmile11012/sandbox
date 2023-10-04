extends Node
var world_enviroment: WorldEnvironment
var light: DirectionalLight3D

#################################################
# GODOTSTEAM EXAMPLE PROJECT v3.0
#################################################
var IS_ON_STEAM: bool = false
var IS_ON_STEAM_DECK: bool = false
var IS_ONLINE: bool = false
var IS_OWNED: bool = false
var STEAM_ID: int = 0
var STEAM_USERNAME: String = "No one"

func _ready() -> void:
	print("Starting the GodotSteam Example project...")
	_initialize_Steam()

	if IS_ON_STEAM_DECK:
		get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (true) else Window.MODE_WINDOWED
	else:
		get_window().mode = Window.MODE_MAXIMIZED if (true) else Window.MODE_WINDOWED
		
##     # Application Id
	discord_sdk.app_id = 1099618430065324082
##     # this is boolean if everything worked
	print("Discord working: " + str(discord_sdk.get_is_discord_working()))
##     # Set the first custom text row of the activity here
	discord_sdk.details = "sandbox game"
##     # Set the second custom text row of the activity here
	discord_sdk.state = "Creating A Construct"
##     # Image key for small image from "Art Assets" from the Discord Developer website
	discord_sdk.large_image = "game"
##     # Tooltip text for the large image
	discord_sdk.large_image_text = "join us!"
##     # Image key for large image from "Art Assets" from the Discord Developer website
	discord_sdk.small_image = "boss"
##     # Tooltip text for the small image
	discord_sdk.small_image_text = "become a epic builder boss"
##     # "02:41 elapsed" timestamp for the activity
	discord_sdk.start_timestamp = int(Time.get_unix_time_from_system())
##     # "59:59 remaining" timestamp for the activity
	discord_sdk.end_timestamp = int(Time.get_unix_time_from_system()) + 3600
##     # Always refresh after changing the values!
	discord_sdk.refresh() 

func _initialize_Steam() -> void:
	if Engine.has_singleton("Steam"):
		var INIT: Dictionary = Steam.steamInit(false)
		# If the status isn't one, print out the possible error and quit the program
		if INIT['status'] != 1:
			print("[STEAM] Failed to initialize: "+str(INIT['verbal'])+" Shutting down...")
			get_tree().quit()

		# Is the user actually using Steam; if false, the app assumes this is a non-Steam version
		IS_ON_STEAM = true
		# Checking if the app is on Steam Deck to modify certain behaviors
		IS_ON_STEAM_DECK = Steam.isSteamRunningOnSteamDeck()
		# Acquire information about the user
		IS_ONLINE = Steam.loggedOn()
		IS_OWNED = Steam.isSubscribed()
		STEAM_ID = Steam.getSteamID()
		STEAM_USERNAME = Steam.getPersonaName()

		# Check if account owns the game
		if IS_OWNED == false:
			print("[STEAM] User does not own this game")
			# Uncomment this line to close the game if the user does not own the game
	#		get_tree().quit()


# Process all Steamworks callbacks
func _process(_delta: float) -> void:
	if IS_ON_STEAM:
		Steam.run_callbacks()



