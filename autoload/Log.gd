extends Node

enum LEVEL {
  TRACE = 10,
  DEBUG = 20,
  INFO = 30,
  WARN = 40,
  ERROR = 50,
  FATAL = 60,
};

var _js_available := OS.has_feature("JavaScript")
var GDQUEST: JavaScriptObject

func write(level: int, properties: Dictionary, message: String) -> void:
	if not _js_available:
		prints({ "properties": properties, "message": message })
		return
	var props = JavaScript.create_object("Object", {})
	for key in properties:
		props[key] = properties[key]
	match(level):
		LEVEL.FATAL:
			# warning-ignore:unsafe_property_access
			GDQUEST.log.fatal(props, message)
		LEVEL.ERROR:
			# warning-ignore:unsafe_property_access
			GDQUEST.log.error(props, message)
		LEVEL.WARN:
			# warning-ignore:unsafe_property_access
			GDQUEST.log.warn(props, message)
		LEVEL.INFO:
			# warning-ignore:unsafe_property_access
			GDQUEST.log.info(props, message)
		LEVEL.DEBUG:
			# warning-ignore:unsafe_property_access
			GDQUEST.log.debug(props, message)
		_:
			# warning-ignore:unsafe_property_access
			GDQUEST.log.trace(props, message)


func _init() -> void:
	if not _js_available:
		return
	GDQUEST = JavaScript.get_interface("GDQUEST")


func trace(properties: Dictionary, message: String) -> void:
	write(LEVEL.TRACE, properties, message)

func debug(properties: Dictionary, message: String) -> void:
	write(LEVEL.DEBUG, properties, message)

func info(properties: Dictionary, message: String) -> void:
	write(LEVEL.INFO, properties, message)

func warn(properties: Dictionary, message: String) -> void:
	write(LEVEL.WARN, properties, message)

func error(properties: Dictionary, message: String) -> void:
	write(LEVEL.ERROR, properties, message)

func fatal(properties: Dictionary, message: String) -> void:
	write(LEVEL.FATAL, properties, message)
