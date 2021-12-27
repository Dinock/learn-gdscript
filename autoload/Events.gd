# Global signal bus registered as an auto-loaded node. Allows us to emit events
# different nodes listen to without having to bubble signals through long chains
# of UI nodes.
extends Node

signal lesson_started(lesson)
signal lesson_completed(lesson)
signal quiz_completed(quiz_index)
signal practice_started(practice)
signal practice_completed(practice)
signal course_completed(course)

signal settings_requested
signal report_form_requested
