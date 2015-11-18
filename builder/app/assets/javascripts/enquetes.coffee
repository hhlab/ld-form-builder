# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	typeChanged = ($s) ->
		$insert_area = $s.parentNode.querySelector('.insert_area')
		#alert('type is changed...')
		typeSwitch($insert_area, $s.value)

		
	typeSwitch = ($area, $type) ->
		switch $type
			when 'checkbox'
				makeCheckbox $area
			when 'multiple_choice'
				console.log('multiple')
			when 'text_area'
				console.log('text')
			when 'number_field'
				console.log('number')
			else
				console.log('Unknown Type...')
	
	makeOption = ($area) ->  
		console.log("add option")

	makeCheckbox = ($area) ->
		console.log('make chackbox')
		$bu =(document.createElement("div"))
		$bu.setAttribute('class','add_option_button')
		$bu.textContent = 'Add Option'
		$b = $area.appendChild $bu
		console.log $b
		console.log $(".insert_area")
		$(".insert_area").click ->
				console.log @
				makeOption $(@)

	$("#question_type").change ->
		typeChanged(this)

