assert = require 'assert'
bufferConverter = require '../source/index.coffee'


describe 'Buffer Converter', ->
	testString = 'This is a test'
	characterArray = testString.split('')
	buffer = new Buffer testString
	arrayBuffer = new ArrayBuffer 14
	view = new Uint8Array arrayBuffer

	for character, index in characterArray
		view[index] = testString.charCodeAt index

	it 'converts a Buffer to an ArrayBuffer', ->
		assert.deepEqual(
			bufferConverter.toArrayBuffer(buffer),
			arrayBuffer
		)

	it 'converts an ArrayBuffer to a Buffer', ->
		assert.deepEqual(
			bufferConverter.toBuffer(arrayBuffer),
			buffer
		)
