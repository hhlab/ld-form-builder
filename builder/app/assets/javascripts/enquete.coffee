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
			value: 'option'
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
		#number_field作るよ
		console.log 'make number field'
		$area.empty()

		$area.append($('<label>').html('数値入力'))
		$num_area = $('<div>').addClass 'number_area'
		
		$num_area.append($('<label>').html('最小値'))
		$('<input>').attr({
			class: 'number_field number_min',
			type: 'number',
			value: 1
		}).appendTo $num_area
		$num_area.append('</br>')
		$num_area.append($('<label>').html('最大値'))
		$('<input>').attr({
			class: 'number_field number_max',
			type: 'number',
			value: 5
		}).appendTo $num_area
		$num_area.append('</br>')
		###
		$num_area.append($('<label>').html('間隔'))
		$('<input>').attr({
			class: 'number_field number_interval',
			type: 'number'
			value: 1
		}).appendTo $num_area
		$num_area.append('</br>')
		###
		$slider = $('<input>').attr({
			class: 'number_slider',
			type: 'range',
			max: 5,
			min: 1,
			step: 1,
			value: 3
		})
		$slider.appendTo $num_area
		
		$('<label>').attr({
			class: 'slider_value'
		}).html('3').appendTo $num_area

		$num_area.appendTo $area
		
		$area.find('input').each ->
			$(@).change ->
				console.log $(@).hasClass 'number_min'
				value = $(@).val()
				if $(@).hasClass 'number_min'
					$(@).parent().find('.number_slider').attr min: value
				else if $(@).hasClass 'number_max'
					$(@).parent().find('.number_slider').attr max: value
				else if $(@).hasClass 'number_interval'
					$(@).parent().find('.number_slider').attr step: value

				$(@).parent().find('.slider_value').html $(@).parent().find('.number_slider').val()
				
	sendJSONData = ->
		flag = true
		$.each $('.field input'), (i,input) ->
			console.log input.value
			if !input.value
				alert '未入力の項目があります。'
				flag = false
		
		if !flag
			return false

		title = $('#enquete_title').val()
		#alert title
		str = '{"title": "' + title + '",'

		url = $('#enquete_url').val()
		#alert url
		str += '"url": "' + url + '",'

		str += '"question": ['

		$.each $('.question'), (i, field) ->
			if i!=0
				str += ', '
			type = $(@).find('select').val()
			str += '{'
			str += '"title": "' + $(@).find('.question_title').val() + '", '
			str += '"type": "' + type + '"'
			switch type
				when 'checkbox'
					str += ', "options": ['
					$.each $(@).find('.option_text'), (i, option) ->
						if i!=0
							str += ","
						str += '"' + option.value + '"'
					str += "]"
				when 'multiple_choice'
					str += ', "options": ['
					$.each $(@).find('.option_text'), (i, option) ->
						if i!=0
							str += ","
						str += '"' + option.value + '"'
					str += "]"
				when 'text_area'
					break
				when 'number_field'
					str += ', "min": ' +$(@).find('.number_min').val() + ', '
					str += '"max": ' +$(@).find('.number_max').val() + ''
				else
					alert 'Type error...'
			str += '}'
		str += ']}'

		$('#json_data').val str
		#alert str
		return flag

	#init
	$(".question_type").change ->
		typeChanged $(@)

	$('#add_question').click ->
		makeQuestion()

	$('.question_delete_button').click ->
		deleteQuestion $(@).closest('.question')

	$('form').submit ->
		sendJSONData() 
		
	state = window.location.href.split('/').pop()	
	if state=='new'
		typeChanged $('select')
		makeQuestion()
	else if state == 'edit'
		console.log 'Editing now'
		
		fo = gon.fo
		$.each fo, (i,obj) ->
			console.log i,obj
			if i=='items' || i=='options'
				$.each obj,(i0, obj0) ->
					console.log i0, obj0
		i = 0
		while i < fo.items.length
			console.log fo.items[i]
			if i!=0
				makeQuestion()
			if fo.items[i].title
				$('.question_title:last').val fo.items[i].title
			else
				$('.question_title:last').val 'Title'
			switch fo.items[i].type
				when "LD::Form::Checkbox"
					$('select:last').val "checkbox"
					typeChanged $('select:last')
					$('.insert_area:last .option').remove()
					path = fo.items[i].url.path
					$.each fo.options, (n, op) ->
						if path==op.refered_from.items[0].path
							makeOption($('.insert_area:last'))
							$('.option_text:last').val op.label
				when "LD::Form::MultipleChoice"
					$('select:last').val "multiple_choice"
					typeChanged $('select:last')
					$('.insert_area:last .option').remove()
					path = fo.items[i].url.path
					$.each fo.options, (n, op) ->
						if path==op.refered_from.items[0].path
							makeOption($('.insert_area:last'))
							$('.option_text:last').val op.label
				when "LD::Form::TextArea"
					$('select:last').val "text_area"
					typeChanged $('select:last')
				when "LD::Form::NumberField"
					$('select:last').val "number_field"
					typeChanged $('select:last')

			i += 2

		u = gon.fo.url
		link = u.scheme + '://' + u.host + u.path
		$('#enquete_url').val u.scheme + '://' + u.host + u.path
		$('#enquete_title').val gon.title

$ ->
	ready()

#$(document).on('page:load', ready)
