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
				makeNumberfield $area
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
		$area.append($('<label>').html('テキスト入力'))
	
	makeNumberfield = ($area) ->
		console.log 'make number field'
		$area.empty()

		$area.append($('<label>').html('数値入力'))
		$num_area = $('<div>').addClass 'number_area'
		
		$num_area.append($('<label>').html('最小値'))
		$('<input>').attr({
			class: 'number_field number_min',
			type: 'number'
		}).appendTo $num_area
		$num_area.append('</br>')
		$num_area.append($('<label>').html('最大値'))
		$('<input>').attr({
			class: 'number_field number_max',
			type: 'number'
		}).appendTo $num_area
	
		$num_area.appendTo $area
	
	#init
	$(".question_type").change ->
		typeChanged $(@)

	$('#add_question').click ->
		makeQuestion()

	$('.question_delete_button').click ->
		deleteQuestion $(@).closest('.question')

	$('#new_enquete').submit ->
		flag = true
		$.each $('.field input'), (i,input) ->
			console.log input.value
			if !input.value
				alert '未入力の項目があります。'
				flag = false
		
		if !flag
			return false

		title = $('#enquete_title').val()
		alert title
		str = '{title: ' + title + ','

		$.each $('.question'), (i, field) ->
			if i!=0
				str += ', '
			type = $(@).find('select').val()
			str += 'question: {'
			str += "title: '" + $(@).find('.question_title').val() + "', "
			str += "type: '" + type + "'"
			switch type
				when 'checkbox'
					str += ", options: "
					$.each $(@).find('.option_text'), (i, option) ->
						alert option.value
						if i!=0
							str += ","
						str += "'" + option.value + "'"
				when 'mutiple_choice'
					if i!=0
					  str += ","
					str += "'" + option.value + "'"
				when 'text_area'
					break
				when 'number_field'
					str += ", mix: " +$(@).find('.number_min').val() + ", "
					str += "max: " +$(@).find('.number_max').val()
			str += '}'
		str += '}'

		$('#json_data').val str
		alert str
		return flag
		
		
		
	typeChanged $('select')
	
	makeQuestion()

	
$ ->
	ready()

$(document).on('page:load', ready)
