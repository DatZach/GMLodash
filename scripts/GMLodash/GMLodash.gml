#macro _ gmLodashInstance()

function GMLodash() constructor {
	
	static VERSION = "1.0.0";
	
	/*** COLLECTION ***/
	
	static countBy = function countBy(collection, iteratee) {
		var cadapter = get_adapter_for(collection);
		var radapter = get_map_adapter_for(collection);
		var result = radapter.create(0);
		iteratee = get_iteratee(iteratee);
		
		for (var i = 0, isize = cadapter.size(collection); i < isize; ++i) {
			var ckey = cadapter.get(collection, i);
			ckey = iteratee(ckey);
			
			var count = radapter.get(result, ckey);
			count = count == undefined ? 1 : count + 1;
			radapter.set(result, ckey, count);
		}
		
		return result;
	};
	
	static forEach = function forEach(collection, iteratee) {
		var adapter = get_adapter_for(collection);
		var keys = adapter.keys(collection);
		
		for (var i = 0, isize = adapter.size(collection); i < isize; ++i) {
			var key = adapter.isMap ? keys[i] : i;
			var value = adapter.get(collection, key);
			if (iteratee(value, key, collection) == false)
				break;
		}
	};
	
	static forEachRight = function forEachRight(collection, iteratee) {
		var adapter = get_adapter_for(collection);
		var keys = adapter.keys(collection);
		
		for (var i = adapter.size(collection) - 1; i >= 0; --i) {
			var key = adapter.isMap ? keys[i] : i;
			var value = adapter.get(collection, key);
			if (iteratee(value, key, collection) == false)
				break;
		}
	};
	
	static every = function every(collection, iteratee) {
		var adapter = get_adapter_for(collection);
		var keys = adapter.keys(collection);
		iteratee = get_iteratee(iteratee);
		
		for (var i = adapter.size(collection) - 1; i >= 0; --i) {
			var key = adapter.isMap ? keys[i] : i;
			var value = adapter.get(collection, key);
			if (!iteratee(value, key, collection))
				return false;
		}
		
		return true;
	};

	static filter = function filter(collection, iteratee) {
		var cadapter = get_adapter_for(collection);
		var radapter = get_collection_adapter_for(collection)
		var result = radapter.create(0); // TODO Optimize by truncating instead of growing
		var keys = cadapter.keys(collection);
		iteratee = get_iteratee(iteratee);
		
		for (var i = 0, isize = cadapter.size(collection); i < isize; ++i) {
			var key = cadapter.isMap ? keys[i] : i
			var value = cadapter.get(collection, key);
			if (iteratee(value, key, collection))
				radapter.push(result, value);
		}
		
		return result;
	};
	
	static find = function find(collection, iteratee, fromIndex) {
		var adapter = get_adapter_for(collection);
		var keys = adapter.keys(collection);
		iteratee = get_iteratee(iteratee);
		
		fromIndex = fromIndex == undefined ? 0 : fromIndex;
		for (var i = fromIndex, isize = adapter.size(collection); i < isize; ++i) {
			var key = adapter.isMap ? keys[i] : i;
			var value = adapter.get(collection, key);
			if (iteratee(value, key, collection))
				return value;
		}
		
		return undefined;
	};
	
	static findLast = function findLast(collection, iteratee, fromIndex) {
		var adapter = get_adapter_for(collection);
		var keys = adapter.keys(collection);
		iteratee = get_iteratee(iteratee);
		
		fromIndex = fromIndex == undefined ? adapter.size(collection) - 1 : fromIndex;
		for (var i = fromIndex; i >= 0; --i) {
			var key = adapter.isMap ? keys[i] : i;
			var value = adapter.get(collection, key);
			if (iteratee(value, key, collection))
				return value;
		}
		
		return undefined;
	};
	
	static flatMap = function flatMap(collection, iteratee) {
		var cadapter = get_adapter_for(collection);
		var radapter = get_collection_adapter_for(collection);
		var keys = cadapter.keys(collection);
		var result = radapter.create(0);
		iteratee = get_iteratee(iteratee);

		for (var i = 0, isize = cadapter.size(collection); i < isize; ++i) {
			var key = cadapter.isMap ? keys[i] : i;
			var value = cadapter.get(collection, key);
			value = iteratee(value, key, collection);
			if (is_collection(value)) {
				var jadapter = get_adapter_for(value);
				for (var j = 0, jsize = jadapter.size(value); j < jsize; ++j) {
					var jvalue = jadapter.get(value, j);
					radapter.push(result, jvalue);
				}
			}
			else
				radapter.push(result, value);
		}
		
		return result;
	};
	
	static flatMapDeep = function flatMapDeep(collection, iteratee) {
		var adapter = get_adapter_for(collection);
		var result = adapter.create(0);
		iteratee = get_iteratee(iteratee);

		var stack = ds_stack_create();
		for (var i = 0, isize = adapter.size(collection); i < isize; ++i) {
			var value = adapter.get(collection, i);
			value = iteratee(value, i, collection);
			
			ds_stack_push(stack, value);
			while(!ds_stack_empty(stack)) {
				value = ds_stack_pop(stack);
				if (is_collection(value)) {
					var jadapter = get_adapter_for(value);
					for (var j = 0, jsize = jadapter.size(value); j < jsize; ++j) {
						var jvalue = jadapter.get(value, j);
						ds_stack_push(stack, jvalue);
					}
				}
				else
					adapter.push(result, value);
			}
		}
		
		ds_stack_destroy(stack);
		
		return result;
	};
	
	static flatMapDepth = function flatMapDepth(collection, iteratee, maxDepth) {
		var adapter = get_adapter_for(collection);
		var result = adapter.create(0);
		iteratee = get_iteratee(iteratee);
		maxDepth = maxDepth == undefined ? 1 : maxDepth;

		var stack = ds_stack_create();
		for (var i = 0, isize = adapter.size(collection); i < isize; ++i) {
			var value = adapter.get(collection, i);
			value = iteratee(value, i, collection);
			
			var curDepth = 1;
			ds_stack_push(stack, value);
			while(!ds_stack_empty(stack)) {
				value = ds_stack_pop(stack);
				if (curDepth <= maxDepth && is_collection(value)) {
					var jadapter = get_adapter_for(value);
					for (var j = 0, jsize = jadapter.size(value); j < jsize; ++j) {
						var jvalue = jadapter.get(value, j);
						ds_stack_push(stack, jvalue);
						++curDepth;
					}
				}
				else {
					adapter.push(result, value);
					--curDepth;
				}
			}
		}
		
		ds_stack_destroy(stack);
		
		return result;
	};
	
	static groupBy = function groupBy(collection, iteratee) {
		var cadapter = get_adapter_for(collection);
		var roadapter = get_map_adapter_for(collection);
		var riadapter = get_collection_adapter_for(collection);
		var keys = cadapter.keys(collection);
		var oresult = roadapter.create(0);
		iteratee = get_iteratee(iteratee);
		
		for (var i = 0, isize = cadapter.size(collection); i < isize; ++i) {
			var key = cadapter.isMap ? keys[i] : i;
			var value = cadapter.get(collection, key);
			key = iteratee(value, key, collection);
			
			var iresult = roadapter.get(oresult, key);
			if (iresult == undefined) {
				iresult = riadapter.create(1);
				riadapter.set(iresult, 0, value);
				roadapter.set(oresult, key, iresult);
			}
			else
				riadapter.push(iresult, value);
		}
		
		return oresult;
	};
	
	static includes = function includes(collection, value, fromIndex) {
		var adapter = get_adapter_for(collection);
		var keys = adapter.keys(collection);
		
		var i = fromIndex == undefined ? 0 : fromIndex;
		for (var isize = adapter.size(collection); i < isize; ++i) {
			var key = adapter.isMap ? keys[i] : i;
			var ivalue = adapter.get(collection, key);
			if (isEqual(ivalue, value))
				return true;
		}
		
		return false;
	};
	
	static keyBy = function keyBy(collection, iteratee) {
		var cadapter = get_adapter_for(collection);
		var radapter = get_map_adapter_for(collection);
		var keys = cadapter.keys(collection);
		var result = radapter.create(0);
		iteratee = get_iteratee(iteratee);
		
		for (var i = 0, isize = cadapter.size(collection); i < isize; ++i) {
			var key = cadapter.isMap ? keys[i] : i;
			var value = cadapter.get(collection, key);
			key = iteratee(value);
			
			radapter.set(result, key, value);
		}
		
		return result;
	};
	
	static map = function map(collection, iteratee) {
		var cadapter = get_adapter_for(collection);
		var radapter = get_collection_adapter_for(collection);
		var keys = cadapter.keys(collection);
		var isize = cadapter.size(collection);
		var result = radapter.create(isize);
		iteratee = get_iteratee(iteratee);
		
		for (var i = 0; i < isize; ++i) {
			var key = cadapter.isMap ? keys[i] : i;
			var value = cadapter.get(collection, key);
			value = iteratee(value, key, collection);
			radapter.set(result, i, value);
		}
		
		return result;
	};
	
	static partition = function partition(collection, iteratee) {
		var cadapter = get_adapter_for(collection);
		var radapter = get_collection_adapter_for(collection);
		var keys = cadapter.keys(collection);
		var matched = radapter.create(0);
		var unmatched = radapter.create(0);
		iteratee = get_iteratee(iteratee);
		
		for (var i = 0, isize = cadapter.size(collection); i < isize; ++i) {
			var key = cadapter.isMap ? keys[i] : i;
			var value = cadapter.get(collection, key);
			var dest = iteratee(value) ? matched : unmatched;
			radapter.push(dest, value);
		}
		
		// TODO Mark ds_*
		var result = radapter.create(0);
			radapter.push(result, unmatched);
			radapter.push(result, matched);
		return result;
	};
	
	static reduce = function reduce(collection, iteratee, accumulator) {
		var adapter = get_adapter_for(collection);
		var keys = adapter.keys(collection);
		var isize = adapter.size(collection);
		var i = 0;
		iteratee = get_iteratee(iteratee);
		
		var result = accumulator;
		if (result == undefined && isize > 0) {
			var key = adapter.isMap ? keys[i] : i;
			result = adapter.get(collection, key);
			++i;
		}
		
		for (; i < isize; ++i) {
			var key = adapter.isMap ? keys[i] : i;
			var value = adapter.get(collection, key);
			result = iteratee(result, value, key, collection);
		}
		
		return result;
	};
	
	static reduceRight = function reduceRight(collection, iteratee, accumulator) {
		var adapter = get_adapter_for(collection);
		var keys = adapter.keys(collection);
		var i = adapter.size(collection) - 1;
		iteratee = get_iteratee(iteratee);
		
		var result = accumulator;
		if (result == undefined && i >= 0) {
			var key = adapter.isMap ? keys[i] : i;
			result = adapter.get(collection, i);
			--i;
		}
		
		for (; i >= 0; --i) {
			var key = adapter.isMap ? keys[i] : i;
			var value = adapter.get(collection, key);
			result = iteratee(result, value, key, collection);
		}
		
		return result;
	};
	
	// TODO Remove?
	static sample = function sample(collection) {
		var adapter = get_adapter_for(collection);
		var isize = adapter.size(collection);
		if (isize == 0)
			return undefined;
		
		var keys = adapter.keys(collection);
		var key = irandom(isize - 1);
		key = adapter.isMap ? keys[key] : key;
		return adapter.get(collection, key);
	};
	
	// TODO Remove?
	static sampleSize = function sampleSize(collection, n) {
		var result = shuffle(collection, n);
		var adapter = get_adapter_for(result);
		adapter.resize(result, n);
		
		return result;
	};
	
	static shuffle = function shuffle(collection, n) {
		var cadapter = get_adapter_for(collection);
		var radapter = get_collection_adapter_for(collection);
		n = n == undefined ? cadapter.size(collection) : n;
		var result = radapter.create(n);
		var keys = cadapter.keys(collection);
		
		for (var i = 0; i < n; ++i) {
			var key = cadapter.isMap ? keys[i] : i;
			var value = cadapter.get(collection, key);
			radapter.set(result, i, value);
		}
		
		for (var i = 0; i < n; ++i) {
			var j = irandom_range(i, n - 1);
			var a = radapter.get(result, j);
			var b = radapter.get(result, i);
			
			radapter.set(result, i, a);
			radapter.set(result, j, b);
		}
		
		return result;
	};
	
	static size = function size(collection) {
		var adapter = get_adapter_for(collection);
		return adapter.size(collection);
	};
	
	static some = function some(collection, iteratee) {
		var adapter = get_adapter_for(collection);
		var keys = adapter.keys(collection);
		iteratee = get_iteratee(iteratee);
		
		for (var i = 0, isize = adapter.size(collection); i < isize; ++i) {
			var key = adapter.isMap ? keys[i] : i;
			var value = adapter.get(collection, key);
			if (iteratee(value, key, collection))
				return true;
		}
		
		return false;
	};
	
	/*** LANGUAGE ***/
	
	// TODO This needs to be VERY heavily optimized
	static isEqual = function isEqual(a, b) {
		if (a == undefined || b == undefined)
			return a == b;
		else if (is_collection(a) && is_collection(b)) {
			if (is_array(a) && is_array(b))
				return array_equals(a, b);
			else {
				var aadapter = get_adapter_for(a);
				var badapter = get_adapter_for(b);
				var asize = aadapter.size(a);
				var bsize = badapter.size(b);
				if (asize != bsize)
					return false;
				
				for(var i = 0; i < asize; ++i) {
					var avalue = aadapter.get(a, i);
					var bvalue = badapter.get(b, i);
					if (!isEqual(avalue, bvalue))
						return false;
				}
				
				return true;
			}
		}
		else if (is_map_list(a) && is_map_list(b)) {
			var aadapter = get_adapter_for(a);
			var badapter = get_adapter_for(b);
			var asize = aadapter.size(a);
			var bsize = badapter.size(b);
			if (asize != bsize)
				return false;
			
			var keys = aadapter.keys(a);
			for (var i = 0; i < asize; ++i) {
				var key = keys[i];
				var avalue = aadapter.get(a, key);
				var bvalue = badapter.get(b, key);
				
				if (!isEqual(avalue, bvalue))
					return false;
			}
			
			return true;
		}
		else if (is_string(a) && is_string(b))
			return a == b;
		else if (is_real(a) && is_real(b)) {
			if (a == b)
				return true;
			else if (is_nan(a) || is_nan(b))
				return is_nan(a) == is_nan(b);
			else if (is_infinity(a) || is_infinity(b))
				return is_infinity(a) == is_infinity(b) && sign(a) == sign(b);
			else if (ds_exists(a, ds_type_grid) && ds_exists(b, ds_type_grid)) {
				var awidth = ds_grid_width(a);
				var bwidth = ds_grid_width(b);
				if (awidth != bwidth)
					return false;
			
				var aheight = ds_grid_height(a);
				var bheight = ds_grid_height(b);
				if (aheight != bheight)
					return false;
			
				for (var yy = 0; yy < aheight; ++yy) {
					for (var xx = 0; xx < awidth; ++xx) {
						if (!isEqual(a[# xx, yy], b[# xx, yy]))
							return false;
					}
				}
			
				return true;
			}
			else if (ds_exists(a, ds_type_stack) && ds_exists(b, ds_type_stack)) {
				var asize = ds_stack_size(a);
				var bsize = ds_stack_size(b);
				if (asize != bsize)
					return false;
			
				return ds_stack_write(a) == ds_stack_write(b);
			}
			else if (ds_exists(a, ds_type_queue) && ds_exists(b, ds_type_queue)) {
				var asize = ds_queue_size(a);
				var bsize = ds_queue_size(b);
				if (asize != bsize)
					return false;
			
				return ds_queue_write(a) == ds_queue_write(b);
			}
			else if (ds_exists(a, ds_type_priority) && ds_exists(b, ds_type_priority)) {
				var asize = ds_queue_size(a);
				var bsize = ds_queue_size(b);
				if (asize != bsize)
					return false;
			
				return ds_priority_write(a) == ds_priority_write(b);
			}
		}
		else if (is_ptr(a) && is_ptr(b))
			return a == b;

		// TODO More types?
		
		return false;
	};
	
	static toString = function toString(value) {
		if (is_real(value)) {
			if (ds_exists(value, ds_type_list)) {
				var result = "[ ";
				for (var i = 0, isize = ds_list_size(value); i < isize; ++i) {
					result += toString(value[| i]);
					if (i < isize - 1)
						result += ",";
				}
				
				result += " ]";
				return result;
			}
			else if (ds_exists(value, ds_type_map)) {
				var result = "{ ";
				var key = ds_map_find_first(value);
				for (var i = 0, isize = ds_map_size(value); i < isize; ++i) {
					result += string(key) + " : " + toString(value[? key]);
					if (i < isize - 1)
						result += ", ";
					
					key = ds_map_find_next(value, key);
				}
				
				result += " }";
				return result;
			}
		}
		
		return string(value);
	};
	
	static toArray = function toArray(collection, trackChildren) {
		if (collection == undefined)
			return [];
		
		var adapter = get_adapter_for(collection);
		var result = array_create(adapter.size(collection));
		trackChildren = trackChildren == undefined ? true : trackChildren;
		
		for (var i = adapter.size(collection) - 1; i >= 0; --i) {
			var value = adapter.get(collection, i);
			
			if (trackChildren && is_real(value)) {
				if (ds_exists(value, ds_type_list))
					value = toArray(value, trackChildren);
				else if (ds_exists(value, ds_type_map))
					value = toStruct(value, trackChildren);
			}
			
			result[i] = value;
		}
		
		return result;
	};
	
	static toList = function toList(collection, trackChildren) {
		var result = ds_list_create();
		trackChildren = trackChildren == undefined ? true : trackChildren;
		
		if (collection == undefined)
			return result;
		
		var adapter = get_adapter_for(collection);
		for (var i = 0, isize = adapter.size(collection); i < isize; ++i) {
			var value = adapter.get(collection, i);
			if (!trackChildren)
				ds_list_add(result, value);
			else if (is_real(value)) {
				ds_list_add(result, value);
				if (ds_exists(value, ds_type_list))
					ds_list_mark_as_list(result, ds_list_size(result) - 1);
				else if (ds_exists(value, ds_type_map))
					ds_list_mark_as_map(result, ds_list_size(result) - 1);
			}
			else if (is_array(value)) {
				ds_list_add(result, key, toList(value, trackChildren));
				ds_list_mark_as_list(result, ds_list_size(result) - 1);
			}
			else if (is_struct(value)) {
				ds_map_add(result, key, toMap(value, trackChildren));
				ds_list_mark_as_map(result, ds_list_size(result) - 1);
			}
			else
				ds_map_add(result, key, value);
		}
		
		return result;
	};
	
	static toMap = function toMap(struct, trackChildren) {
		var result = ds_map_create();
		trackChildren = trackChildren == undefined ? true : trackChildren;
		
		if (struct == undefined)
			return result;
		
		var adapter = get_adapter_for(struct);
		var keys = adapter.keys(struct);
		for (var i = 0, isize = adapter.size(struct); i < isize; ++i) {
			var key = keys[i];
			var value = adapter.get(struct, key);
			if (!trackChildren)
				ds_map_add(result, key, value);
			else if (is_real(value)) {
				if (ds_exists(value, ds_type_list))
					ds_map_add_list(result, key, value);
				else if (ds_exists(value, ds_type_map))
					ds_map_add_map(result, key, value);
				else
					ds_map_add(result, key, value);
			}
			else if (is_array(value))
				ds_map_add(result, key, toList(value, trackChildren));
			else if (is_struct(value))
				ds_map_add(result, key, toMap(value, trackChildren));
			else
				ds_map_add(result, key, value);
		}
		
		return result;
	};
	
	static toStruct = function toStruct(map, trackChildren) {
		var result = {};
		trackChildren = trackChildren == undefined ? true : trackChildren;
		
		if (map == undefined)
			return result;
		
		var adapter = get_adapter_for(map);
		var keys = adapter.keys(map);
		for (var i = 0, isize = adapter.size(map); i < isize; ++i) {
			var key = keys[i];
			var value = adapter.get(map, key);
			
			if (trackChildren && is_real(value)) {
				if (ds_exists(value, ds_type_list))
					value = toArray(value, trackChildren);
				else if (ds_exists(value, ds_type_map))
					value = toStruct(value, trackChildren);
			}
			
			variable_struct_set(result, key, value);
		}
		
		return result;
	};
	
	static join = function join(collection, seperator) {
		var adapter = get_adapter_for(collection);
		var result = "";
		seperator = seperator == undefined ? "," : seperator;
		
		var stack = ds_stack_create();
		for (var i = 0, isize = adapter.size(collection); i < isize; ++i) {
			var value = adapter.get(collection, i);
			ds_stack_push(stack, [value, isize - 1]);
			while(!ds_stack_empty(stack)) {
				var args = ds_stack_pop(stack);
				value = args[0];
				var limit = args[1];
				
				if (is_collection(value)) {
					var jadapter = get_adapter_for(value);
					for (var jsize = jadapter.size(value), j = jsize - 1; j >= 0; --j) {
						var jvalue = jadapter.get(value, j);
						ds_stack_push(stack, [jvalue, jsize]);
					}
				}
				else {
					result += string(value);
					if (i < limit)
						result += seperator;
				}
			}
		}
		
		ds_stack_destroy(stack);
		return result;
	};
	
	/*** UTILITY ***/
	
	static identity = function identity(x) {
		return x;
	};

	/*** PRIVATE ***/
	
	static _stringAdapter = {
		__type: "string",
		isCollection: true,
		isMap: false,
		
		create: function (size) { return ""; },
		size: function (str) { return string_length(str); },
		get: function (str, i) { return string_char_at(str, i + 1); },
		set: function (str, i, value) { 
			throw "not supported"; },
		push: function (str, value) { str += value; },
		resize: function (str, size) { 
			throw "not supported"; },
		keys: function (str) { return undefined; }
	};
	
	static _arrayAdapter = {
		__type: "array",
		isCollection: true,
		isMap: false,
		
		create: function (size) { return array_create(size); },
		size: function (array) { return array_length(array); },
		get: function (array, i) { return array[i]; },
		set: function (array, i, value) { array[@ i] = value; },
		push: function (array, value) { array[@ array_length(array)] = value; },
		resize: function (array, size) { array_resize(array, size); },
		keys: function (array) { return undefined; }
	};
	
	static _listAdapter = {
		__type: "list",
		isCollection: true,
		isMap: false,
		
		create: function (size) { return ds_list_create(); },
		size: function (list) { return ds_list_size(list); },
		get: function (list, i) { return ds_list_find_value(list, i); },
		set: function (list, i, value) { ds_list_set(list, i, value); },
		push: function (list, value) { ds_list_add(list, value); },
		resize: function (list, size) {
			while(ds_list_size(list) < size)
				ds_list_add(list, undefined);
			while(ds_list_size(list) > size)
				ds_list_delete(list, size);
		},
		keys: function (list) { return undefined; }
	};
	
	static _mapAdapter = {
		__type: "string",
		isCollection: false,
		isMap: true,
		
		create: function (size) { return ds_map_create(); },
		size: function (map) { return ds_map_size(map); },
		get: function (map, key) { return map[? key]; },
		set: function (map, key, value) { map[? key] = value; },
		push: function (map, value) { ds_map_add(map, ds_map_size(map), value); },
		resize: function (map, size) { throw "not supported"; },
		keys: function (map) {
			var isize = ds_map_size(map);
			var result = array_create(isize);
			var key = ds_map_find_first(map);
			for (var i = 0; i < isize; ++i) {
				result[i] = key;
				key = ds_map_find_next(map, key);
			}
			return result;
		}
	};
	
	static _structAdapter = {
		__type: "struct",
		isCollection: false,
		isMap: true,
		
		create: function (size) { return {}; },
		size: function (struct) { return variable_struct_names_count(struct); },
		get: function (struct, key) { return variable_struct_get(struct, key); },
		set: function (struct, key, value) { variable_struct_set(struct, key, value); },
		push: function (struct, value) { variable_struct_set(struct, variable_struct_names_count(struct), value); },
		resize: function (struct, size) { 
			throw "not supported"; },
		keys: function (struct) { return variable_struct_get_names(struct); }
	};
	
	function get_adapter_for(type) {
		if (is_array(type))
			return _arrayAdapter;
		if (is_struct(type))
			return _structAdapter;
		if (is_string(type))
			return _stringAdapter;
		if (ds_exists(type, ds_type_list))
			return _listAdapter;
		if (ds_exists(type, ds_type_map))
			return _mapAdapter;
		throw "Unknown collection -> collection adapter for type: " + typeof(type);
	}
	
	function get_collection_adapter_for(type) {
		if (is_array(type))
			return _arrayAdapter;
		if (is_struct(type))
			return _arrayAdapter;
		if (is_string(type))
			return _arrayAdapter;
		if (ds_exists(type, ds_type_list))
			return _listAdapter;
		if (ds_exists(type, ds_type_map))
			return _listAdapter;
		throw "Unknown map -> collection adapter for type: " + typeof(type);
	}
	
	function get_map_adapter_for(type) {
		if (is_array(type))
			return _structAdapter;
		if (is_struct(type))
			return _structAdapter;
		if (is_string(type))
			return _structAdapter;
		if (ds_exists(type, ds_type_list))
			return _mapAdapter;
		if (ds_exists(type, ds_type_map))
			return _mapAdapter;
		throw "Unknown collection -> map adapter for type: " + typeof(type);
	}
	
	function is_collection(value) {
		return is_array(value)
			|| (is_real(value) && ds_exists(value, ds_type_list));
	}
	
	function is_map_list(value) {
		return is_struct(value)
			|| (is_real(value) && ds_exists(value, ds_type_map));
	}
	
	function get_iteratee(value) {
		if (value == undefined)
			return identity;
		
		if (is_method(value))
			return value;
		
		if (is_struct(value)) {
			return method({
				value: value
			}, function (x) {
				var keys = variable_struct_get_names(value);
				for (var i = 0, isize = array_length(keys); i < isize; ++i) {
					var key = keys[i];
					var xvalue = variable_struct_get(x, key);
					var vvalue = variable_struct_get(value, key);
					if (!_.isEqual(xvalue, vvalue))
						return false;
				}
				
				return true;
			});
		}
		
		if (is_array(value)) {
			return method({
				value: value
			}, function (x) {
				return _.isEqual(variable_struct_get(x, value[0]), value[1]);
			});
		}
		
		if (is_string(value)) {
			return method({
				value: value
			}, function (x) {
				return variable_struct_get(x, value);
			});
		}
		
		throw "Unsupported iteratee type";
	}
}

#macro ds_map_create gmlodash_ds_map_create
#macro __ds_map_create ds_map_create
#macro ds_list_create gmlodash_ds_list_create
#macro __ds_list_create ds_list_create
#macro ds_stack_create gmlodash_ds_stack_create
#macro __ds_stack_create ds_stack_create
#macro ds_grid_create gmlodash_ds_grid_create
#macro __ds_grid_create ds_grid_create
#macro ds_queue_create gmlodash_ds_queue_create
#macro __ds_queue_create ds_queue_create
#macro ds_priority_create gmlodash_ds_priority_create
#macro __ds_priority_create ds_priority_create
#macro ds_exists gmlodash_ds_exists
#macro __ds_exists ds_exists

function gmlodash_ds_map_create() {
	gml_pragma("forceinline");
	return __ds_map_create() + ds_type_map / 128.0;
}

function gmlodash_ds_list_create() {
	gml_pragma("forceinline");
	return __ds_list_create() + ds_type_list / 128.0;
}

function gmlodash_ds_stack_create() {
	gml_pragma("forceinline");
	return __ds_stack_create() + ds_type_stack / 128.0;
}

function gmlodash_ds_grid_create(w, h) {
	gml_pragma("forceinline");
	return __ds_grid_create(w, h) + ds_type_grid / 128.0;
}

function gmlodash_ds_queue_create() {
	gml_pragma("forceinline");
	return __ds_queue_create() + ds_type_queue / 128.0;
}

function gmlodash_ds_priority_create() {
	gml_pragma("forceinline");
	return __ds_priority_create() + ds_type_priority / 128.0;
}

function gmlodash_ds_exists(index, type) {
	if (is_nan(index) || is_infinity(index)) // GMBUG ds_exists(NaN, x) == true
		return false;
	if (index mod 1 != type / 128.0)
		return false;
		
	return __ds_exists(index, type);
}

function gmLodashInstance() {
	static instance = new GMLodash();
	return instance;
}