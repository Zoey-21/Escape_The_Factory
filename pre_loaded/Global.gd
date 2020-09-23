extends Node

var level_ended = false
var can_tele = true
var boss_start = false

var spawn_light
var light
var player
var playershothit
var playerhit
var enedistroy
var bullets
var playerfire
var portalopen
var enespawn
var portal
var level
var shotdespawn
var eneshoot
var next_tele = 0

func regaster_player(in_player):#player position input
	player = in_player
	
func play_playershothit(playing):
	playershothit = playing
	
func play_playerhit(playing):
	playerhit = playing
	
func play_enedistroy(playing):
	enedistroy = playing

func play_playerfire(playing):
	playerfire = playing
	
func play_portalopen(playing):
	portalopen = playing
	
func play_enespawn(playing):
	enespawn = playing
	
func level_end(portals):
	portal = portals
	
func play_shotdespawn(playing):
	shotdespawn = playing
	
func play_eneshoot(playing):
	eneshoot = playing
