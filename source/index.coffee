module.exports.toArrayBuffer = (buffer) ->
	if Buffer and Buffer.isBuffer buffer

		arrayBuffer = new ArrayBuffer buffer.length
		view = new Uint8Array arrayBuffer
		index = 0

		while index < buffer.length
			view[index] = buffer[index]
			index++

		return arrayBuffer

	else if buffer instanceof ArrayBuffer
		return buffer

	else
		throw new Error "Can not convert #{typeof buffer} to ArrayBuffer!"


module.exports.toBuffer = (arrayBuffer) ->
	if arrayBuffer instanceof ArrayBuffer
		buffer = new Buffer arrayBuffer.byteLength
		view = new Uint8Array arrayBuffer
		index = 0

		while index < buffer.length
			buffer[index] = view[index]
			index++

		return buffer

	else if Buffer and Buffer.isBuffer arrayBuffer
		return arrayBuffer

	else
		throw new Error "Can not convert #{typeof arrayBuffer} to Buffer!"
