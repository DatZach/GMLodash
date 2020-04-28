function concat() {
	var result = "";
	for (var i = 0; i < argument_count; ++i)
		result += string(argument[i]);

	return result;
}

function string_starts_with(value, target, position) {
	var i = position == undefined ? 0 : position;
	return string_copy(value, i + 1, string_length(target)) == target;
};
	
function string_ends_with(value, target, position) {
	var targetLen = string_length(target);
		
	var i;
	if (position == undefined) {
		var valueLen = string_length(value);
		i = max(1, valueLen - targetLen);
	}
	else
		i = position;
		
	return string_copy(value, i, targetLen) == target;
}
	
function string_split(value, separator, limit) {
	var result = [];
	var str = "";
		
	var sepLen = string_length(separator);
	var i = 1;
	var j = 0;
	var isize = string_length(value);
	var jsize = limit == undefined ? $7fffffff : limit;
	for (; i < isize && j < jsize; ++i) {
		var delim = string_copy(value, i, sepLen);
		if (delim == separator) {
			result[j++] = str;
			str = "";
		}
		else {
			str += string_char_at(value, i);
			result[j] = str;
		}
	}
		
	return result;
}
	
function string_trim(value) {
	var l = 1;
	var r = string_length(value);
		
	repeat (r) {
		var o = string_ord_at(value, l);
		if (!(o > 8 && o < 14) && o != 32)
			break;
			
		++l;
	}
		
	repeat (r - l) {
		var o = string_ord_at(value, r);
		if (!(o > 8 && o < 14) && o != 32)
			break;
			
		--r;
	}
		
	return string_copy(value, l, r - l + 1);
}
