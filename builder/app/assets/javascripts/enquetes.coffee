# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	typeChanged = ($s) ->
		#セレクターの内容が変更された
		#$insert_area = $s.parentNode.querySelector('.insert_area')
	
		$par = $s.parent()
		console.log $s
		$insert_area = $par.children '.insert_area'
		
		$ins = $ 'select'
		console.log $ins.parent()

		#セレクター内のinsert areaを変更
		if $insert_area
			typeSwitch($insert_area, $s.val())
		else
			console.log "Error"
		
	typeSwitch = ($area, $type) ->
		#switch
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
		$outer = $("<div>").addClass 'option'
		
		$("<input>").attr({
			type: 'text',
			class: 'option_text'
		}).appendTo $outer

		$remove_button = $("<div>").addClass 'option_remove'
		$remove_button.html 'remove'
		$($remove_button.appendTo $outer).click ->
			console.log $(@).parent().remove()
		
		console.log $remove_button
		
		$area.append $outer

	makeCheckbox = ($area) ->
		#checkboxを作るよ
		if ($area.find '.add_option_button').length != 0
			#すでにボタンがあった場合はスルー
			return console.log 'already checkbox'
		console.log('make chackbox')
		###
		$bu =(document.createElement("div"))
		$bu.setAttribute('class','add_option_button')
		$bu.textContent = 'Add Option'
		$b = $area.appendChild $bu
		console.log $hoge = $area.querySelector '.add_option_button'
		###
		
		$bu = $("<div>").addClass 'add_option_button'
		
		$area.append $bu
		console.log $area.find '.add_option_button'
		$($area.find '.add_option_button').html('Add Option')
		makeOption $area

		$('.add_option_button:last').click ->
			makeOption $(@).parent()

	$("#question_type").change ->
		typeChanged $(@)

