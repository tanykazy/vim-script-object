function object#object()
	return s:object()
endfunction

function object#create(...)
	let l:original = get(a:, 1, s:object())
	return s:create(l:original)
endfunction

function object#extends(original, ...)
	return s:extend(a:original, a:000)
endfunction

function s:object()
	let l:object = {}
	let l:ext = {}
	let l:ext.create = funcref('s:create', [l:object])
	let l:ext.extends = funcref('s:extends', [l:object])
	return s:extend(l:object, [l:ext])
endfunction

function s:create(original)
	return deepcopy(a:original)
endfunction

function s:extends(original, ...)
	return s:extend(a:original, a:000)
endfunction

function s:extend(original, objects)
	for l:object in a:objects
		call extend(a:original, l:object)
	endfor
	return a:original
endfunction
