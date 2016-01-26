# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

	typeChanged = ($s) ->
		#セレクターの内容が変更された
		#$insert_area = $s.parentNode.querySelector('.insert_area')
	
		$par = $s.parent().parent()
		$insert_area = $par.children '.insert_area'
		
		#セレクター内のinsert areaを変更
		if $insert_area
			typeSwitch($insert_area, $s.val())
		else
			console.log "Error"
		
	typeSwitch = ($area, $type) ->
		#switch
		switch $type
			when 'checkbox'
				console.log('checkbox')
				makeCheckbox $area
			when 'multiple_choice'
				console.log('multiple')
				makeCheckbox $area
			when 'text_area'
				console.log('text')
				makeTextarea $area
			when 'number_field'
				console.log('number')
			else
				console.log('Unknown Type...')
	
	makeOption = ($area) ->
		console.log("add option")
		$outer = $("<div>").addClass 'option'
		
		$("<input>").attr({
			name: 'option[]',
			type: 'text',
			class: 'option_text'
		}).appendTo $outer

		$remove_button = $("<div>").addClass 'option_remove'
		$remove_button.html 'remove'
		$($remove_button.appendTo $outer).click ->
			console.log $(@).parent().remove()
		
		$area.append $outer

	makeCheckbox = ($area) ->
		#checkboxを作るよ
		console.log 'make checkbox'
		console.log $area
		if ($area.find '.add_option_button').length != 0
			#すでにボタンがあった場合はスルー
			return console.log 'Checkbox is already exist...'
		$area.empty()
		$bu = $("<div>").addClass 'add_option_button'
		
		$area.append $bu

		$($area.find '.add_option_button:last').html('Add Option')
		makeOption $area
		makeOption $area
		
		$('.add_option_button:last').click ->
			makeOption $(@).parent()
	
	makeQuestion = ->
		$selector = $('.question_header:last').clone(true)
		
		$f = $('<div>').addClass 'field question'
		$f.append $selector
		
		$('.question:last').after $f

		$ins = $('<div>').addClass 'insert_area'
		$('.question_header:last').after $ins
		makeCheckbox $('.insert_area:last')

	deleteQuestion = ($area) ->
		console.log $('.question')
		if $('.question').length <= 1
			return alert 'これ以上質問を削除できません。'
		if !confirm('この質問を削除してよろしいですか？')
			return console.log 'Canseled...'

		console.log 'Delete question'
		$area.remove()

	makeTextarea = ($area) ->
		console.log 'make textarea'
		console.log $area
		#text_area作るよ
		$area.empty()
		$area.append($('<div>').html('Text Area'))

	
	#init
	$(".question_type").change ->
		typeChanged $(@)

	$('#add_question').click ->
		makeQuestion()

	$('.question_delete_button').click ->
		deleteQuestion $(@).closest('.question')

	typeChanged $('select')
	
	makeQuestion()

	
$ ->
	ready()

$(document).on('page:load', ready)
