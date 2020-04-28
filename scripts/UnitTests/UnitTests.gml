(function () {
	global.unitTests = function unitTests() {
		// _.isEqual
		assert_equal(1, 1);
		assert_not_equal(1, 2);
		assert_not_equal(1, "foo");
		assert_not_equal(1, false);
		assert_not_equal(1, undefined);
		assert_not_equal(1, pointer_null);
		assert_not_equal(1, NaN);
		assert_not_equal(1, infinity);
		assert_not_equal(1, [1]);
		assert_not_equal(1, {a:1});
		assert_not_equal(1, list(1));
		assert_not_equal(1, map({a:1}));
		assert_not_equal(1, grid([[1,2],[2,1]]));
		assert_not_equal(1, stack(1));
		assert_not_equal(1, queue(1));
		assert_not_equal(1, priority(1));

		assert_equal("foo", "foo");
		assert_not_equal("foo", "Foo");
		assert_not_equal("foo", "bar");
		assert_not_equal("foo", 1);
		assert_not_equal("foo", false);
		assert_not_equal("foo", undefined);
		assert_not_equal("foo", pointer_null);
		assert_not_equal("foo", NaN);
		assert_not_equal("foo", infinity);
		assert_not_equal("foo", [1]);
		assert_not_equal("foo", {a:1});
		assert_not_equal("foo", list(1));
		assert_not_equal("foo", map({a:1}));
		assert_not_equal("foo", grid([[1,2],[2,1]]));
		assert_not_equal("foo", stack(1));
		assert_not_equal("foo", queue(1));
		assert_not_equal("foo", priority(1));
		
		assert_equal(true, true);
		assert_equal(true, 1);
		assert_not_equal(true, false);
		assert_not_equal(true, "foo");
		assert_not_equal(true, undefined);
		assert_not_equal(true, pointer_null);
		assert_not_equal(true, NaN);
		assert_not_equal(true, infinity);
		assert_not_equal(true, [1]);
		assert_not_equal(true, {a:1});
		assert_not_equal(true, list(1));
		assert_not_equal(true, map({a:1}));
		assert_not_equal(true, grid([[1,2],[2,1]]));
		assert_not_equal(true, stack(1));
		assert_not_equal(true, queue(1));
		assert_not_equal(true, priority(1));
		
		assert_equal(undefined, undefined);
		assert_not_equal(undefined, 2);
		assert_not_equal(undefined, "foo");
		assert_not_equal(undefined, false);
		assert_not_equal(undefined, pointer_null);
		assert_not_equal(undefined, NaN);
		assert_not_equal(undefined, infinity);
		assert_not_equal(undefined, [1]);
		assert_not_equal(undefined, {a:1});
		assert_not_equal(undefined, list(1));
		assert_not_equal(undefined, map({a:1}));
		assert_not_equal(undefined, grid([[1,2],[2,1]]));
		assert_not_equal(undefined, stack(1));
		assert_not_equal(undefined, queue(1));
		assert_not_equal(undefined, priority(1));

		assert_equal(pointer_null, pointer_null);
		assert_not_equal(pointer_null, 2);
		assert_not_equal(pointer_null, "foo");
		assert_not_equal(pointer_null, false);
		assert_not_equal(pointer_null, undefined);
		assert_not_equal(pointer_null, NaN);
		assert_not_equal(pointer_null, infinity);
		assert_not_equal(pointer_null, [1]);
		assert_not_equal(pointer_null, {a:1});
		assert_not_equal(pointer_null, list(1));
		assert_not_equal(pointer_null, map({a:1}));
		assert_not_equal(pointer_null, grid([[1,2],[2,1]]));
		assert_not_equal(pointer_null, stack(1));
		assert_not_equal(pointer_null, queue(1));
		assert_not_equal(pointer_null, priority(1));
		
		assert_equal(NaN, NaN);
		assert_not_equal(NaN, 2);
		assert_not_equal(NaN, "foo");
		assert_not_equal(NaN, false);
		assert_not_equal(NaN, undefined);
		assert_not_equal(NaN, pointer_null);
		assert_not_equal(NaN, infinity);
		assert_not_equal(NaN, [1]);
		assert_not_equal(NaN, {a:1});
		assert_not_equal(NaN, list(1));
		assert_not_equal(NaN, map({a:1}));
		assert_not_equal(NaN, grid([[1,2],[2,1]]));
		assert_not_equal(NaN, stack(1));
		assert_not_equal(NaN, queue(1));
		assert_not_equal(NaN, priority(1));
		
		assert_equal(infinity, infinity);
		assert_not_equal(infinity, -infinity);
		assert_not_equal(infinity, 2);
		assert_not_equal(infinity, "foo");
		assert_not_equal(infinity, false);
		assert_not_equal(infinity, undefined);
		assert_not_equal(infinity, pointer_null);
		assert_not_equal(infinity, NaN);
		assert_not_equal(infinity, [1]);
		assert_not_equal(infinity, {a:1});
		assert_not_equal(infinity, list(1));
		assert_not_equal(infinity, map({a:1}));
		assert_not_equal(infinity, grid([[1,2],[2,1]]));
		assert_not_equal(infinity, stack(1));
		assert_not_equal(infinity, queue(1));
		assert_not_equal(infinity, priority(1));
		
		assert_equal([1,2,3], [1,2,3]);
		assert_equal([1,2,3], list(1,2,3));
		assert_not_equal([1,2,3], [3,2,1]);
		assert_not_equal([1,2,3], [1,2]);
		assert_not_equal([1,2,3], [1,2,3,4]);
		assert_not_equal([1,2,3], list(3,2,1));
		assert_not_equal([1,2,3], list(1,2));
		assert_not_equal([1,2,3], list(1,2,3,4));
		assert_not_equal([1,2,3], 2);
		assert_not_equal([1,2,3], "foo");
		assert_not_equal([1,2,3], false);
		assert_not_equal([1,2,3], undefined);
		assert_not_equal([1,2,3], pointer_null);
		assert_not_equal([1,2,3], NaN);
		assert_not_equal([1,2,3], infinity);
		assert_not_equal([1,2,3], {a:1});
		assert_not_equal([1,2,3], list(1));
		assert_not_equal([1,2,3], map({a:1}));
		assert_not_equal([1,2,3], grid([[1,2],[2,1]]));
		assert_not_equal([1,2,3], stack(1));
		assert_not_equal([1,2,3], queue(1));
		assert_not_equal([1,2,3], priority(1));
		
		assert_equal({a:1,b:2}, {a:1,b:2});
		assert_equal({a:1,b:1}, {b:1,a:1});
		assert_equal({a:1,b:1}, map({b:1,a:1}));
		assert_equal({a:{b:1},c:2}, {a:{b:1},c:2});
		assert_equal({a:[1,2],b:"foo"}, {a:[1,2],b:"foo"});
		assert_equal({a:[1,2]}, {a:list(1,2)});
		assert_equal({a:[1,2]}, map({a:list(1,2)}));
		assert_equal({a:[1,2]}, map({a:[1,2]}));
		assert_equal(map({b:1,a:1}), {a:1,b:1});
		assert_equal({a:list(1,2)}, {a:[1,2]});
		assert_equal(map({a:list(1,2)}), {a:[1,2]});
		assert_equal(map({a:[1,2]}), {a:[1,2]});
		assert_not_equal({a:{b:1},c:2}, {a:{b:1,d:3},c:2});
		assert_not_equal({a:1}, 1);
		assert_not_equal({a:"foo"}, "foo");
		assert_not_equal({a:false}, false);
		assert_not_equal({a:undefined}, undefined);
		assert_not_equal({a:pointer_null}, pointer_null);
		assert_not_equal({a:NaN}, NaN);
		assert_not_equal({a:infinity}, infinity);
		assert_not_equal({a:[1]}, [1]);
		assert_not_equal({a:list(1)}, list(1));
		assert_not_equal({a:map({a:1})}, map({a:1}));
		assert_not_equal({a:grid([[1,2],[2,1]])}, grid([[1,2],[2,1]]));
		assert_not_equal({a:stack(1)}, stack(1));
		assert_not_equal({a:queue(1)}, queue(1));
		assert_not_equal({a:priority(1)}, priority(1));

		assert_equal(list(1,2,3), list(1,2,3));
		assert_equal(list(1,2,3), [1,2,3]);
		assert_not_equal(list(1,2,3), [3,2,1]);
		assert_not_equal(list(1,2,3), [1,2]);
		assert_not_equal(list(1,2,3), [1,2,3,4]);
		assert_not_equal(list(1,2,3), list(3,2,1));
		assert_not_equal(list(1,2,3), list(1,2));
		assert_not_equal(list(1,2,3), list(1,2,3,4));
		assert_not_equal(list(1,2,3), 2);
		assert_not_equal(list(1,2,3), "foo");
		assert_not_equal(list(1,2,3), false);
		assert_not_equal(list(1,2,3), undefined);
		assert_not_equal(list(1,2,3), pointer_null);
		assert_not_equal(list(1,2,3), NaN);
		assert_not_equal(list(1,2,3), infinity);
		assert_not_equal(list(1,2,3), {a:1});
		assert_not_equal(list(1,2,3), map({a:1}));
		assert_not_equal(list(1,2,3), grid([[1,2],[2,1]]));
		assert_not_equal(list(1,2,3), stack(1));
		assert_not_equal(list(1,2,3), queue(1));
		assert_not_equal(list(1,2,3), priority(1));
		
		assert_equal(map({a:1,b:2}), map({a:1,b:2}));
		assert_equal(map({a:1,b:1}), map({b:1,a:1}));
		assert_equal(map({b:1,a:1}), {a:1,b:1});
		assert_equal(map({a:{b:1},c:2}), map({a:{b:1},c:2}));
		assert_equal(map({a:[1,2],b:"foo"}), map({a:[1,2],b:"foo"}));
		assert_equal(map({a:[1,2]}), map({a:list(1,2)}));
		assert_equal(map({a:list(1,2)}), {a:[1,2]});
		assert_equal(map({a:[1,2]}), {a:[1,2]});
		assert_equal({a:1,b:1}, map({b:1,a:1}));
		assert_equal(map({a:list(1,2)}), map({a:[1,2]}));
		assert_equal({a:[1,2]}, map({a:list(1,2)}));
		assert_equal({a:[1,2]}, map({a:[1,2]}));
		assert_not_equal(map({a:{b:1},c:2}), {a:{b:1,d:3},c:2});
		assert_not_equal(map({a:1}), 1);
		assert_not_equal(map({a:"foo"}), "foo");
		assert_not_equal(map({a:false}), false);
		assert_not_equal(map({a:undefined}), undefined);
		assert_not_equal(map({a:pointer_null}), pointer_null);
		assert_not_equal(map({a:NaN}), NaN);
		assert_not_equal(map({a:infinity}), infinity);
		assert_not_equal(map({a:[1]}), [1]);
		assert_not_equal(map({a:list(1)}), list(1));
		assert_not_equal(map({a:map({a:1})}), map({a:1}));
		assert_not_equal(map({a:grid([[1,2],[2,1]])}), grid([[1,2],[2,1]]));
		assert_not_equal(map({a:stack(1)}), stack(1));
		assert_not_equal(map({a:queue(1)}), queue(1));
		assert_not_equal(map({a:priority(1)}), priority(1));
		
		assert_equal(grid([[1,2],[2,1]]), grid([[1,2],[2,1]]));
		// TODO Nested DSs
		assert_not_equal(grid([[2]]), 2);
		assert_not_equal(grid([["foo"]]), "foo");
		assert_not_equal(grid([[false]]), false);
		assert_not_equal(grid([[undefined]]), undefined);
		assert_not_equal(grid([[pointer_null]]), pointer_null);
		assert_not_equal(grid([[NaN]]), NaN);
		assert_not_equal(grid([[infinity]]), infinity);
		assert_not_equal(grid([[[1]]]), [1]);
		assert_not_equal(grid([[{a:1}]]), {a:1});
		assert_not_equal(grid([[list(1)]]), list(1));
		assert_not_equal(grid([[map({a:1})]]), map({a:1}));
		assert_not_equal(grid([[stack(1)]]), stack(1));
		assert_not_equal(grid([[queue(1)]]), queue(1));
		assert_not_equal(grid([[priority(1)]]), priority(1));
		
		assert_equal(stack(1,2,3), stack(1,2,3));
		assert_not_equal(stack(1,2,3), stack(3,2,1));
		assert_not_equal(stack(1,2,3), stack(1,2));
		assert_not_equal(stack(1,2), stack(1,2,3));
		assert_not_equal(stack(2), 2);
		assert_not_equal(stack("foo"), "foo");
		assert_not_equal(stack(false), false);
		assert_not_equal(stack(undefined), undefined);
		assert_not_equal(stack(pointer_null), pointer_null);
		assert_not_equal(stack(NaN), NaN);
		assert_not_equal(stack(infinity), infinity);
		assert_not_equal(stack(1), [1]);
		assert_not_equal(stack({a:1}), {a:1});
		assert_not_equal(stack(1), list(1));
		assert_not_equal(stack(map({a:1})), map({a:1}));
		assert_not_equal(stack(grid([[1,2],[2,1]])), grid([[1,2],[2,1]]));
		assert_not_equal(stack(queue(1)), queue(1));
		assert_not_equal(stack(priority(1)), priority(1));
		
		assert_equal(queue(1,2,3), queue(1,2,3));
		assert_not_equal(queue(1,2,3), queue(3,2,1));
		assert_not_equal(queue(1,2,3), queue(1,2));
		assert_not_equal(queue(1,2), queue(1,2,3));
		assert_not_equal(queue(2), 2);
		assert_not_equal(queue("foo"), "foo");
		assert_not_equal(queue(false), false);
		assert_not_equal(queue(undefined), undefined);
		assert_not_equal(queue(pointer_null), pointer_null);
		assert_not_equal(queue(NaN), NaN);
		assert_not_equal(queue(infinity), infinity);
		assert_not_equal(queue(1), [1]);
		assert_not_equal(queue({a:1}), {a:1});
		assert_not_equal(queue(1), list(1));
		assert_not_equal(queue(map({a:1})), map({a:1}));
		assert_not_equal(queue(grid([[1,2],[2,1]])), grid([[1,2],[2,1]]));
		assert_not_equal(queue(stack(1)), stack(1));
		assert_not_equal(queue(priority(1)), priority(1));
		
		assert_equal(priority(1,2,3), priority(1,2,3));
		assert_not_equal(priority(1,2,3), priority(3,2,1));
		assert_not_equal(priority(1,2,3), priority(1,2));
		assert_not_equal(priority(1,2), priority(1,2,3));
		assert_not_equal(priority(2), 2);
		assert_not_equal(priority("foo"), "foo");
		assert_not_equal(priority(false), false);
		assert_not_equal(priority(undefined), undefined);
		assert_not_equal(priority(pointer_null), pointer_null);
		assert_not_equal(priority(NaN), NaN);
		assert_not_equal(priority(infinity), infinity);
		assert_not_equal(priority(1), [1]);
		assert_not_equal(priority({a:1}), {a:1});
		assert_not_equal(priority(1), list(1));
		assert_not_equal(priority(map({a:1})), map({a:1}));
		assert_not_equal(priority(grid([[1,2],[2,1]])), grid([[1,2],[2,1]]));
		assert_not_equal(priority(stack(1)), stack(1));
		assert_not_equal(priority(queue(1)), queue(1));
		
		// _.countBy
		assert_equal(
			_.countBy([1,1,2,2]),
			struct([1,2],[2,2]));
		//assert_equal(
		//	_.countBy({a:1,b:1,c:2}),
		//	struct([1,2],[2,1]));
		assert_equal(
			_.countBy([6.1, 4.2, 6.3], function (x) { return floor(x); }),
			struct([4, 1], [6, 2]));
		assert_equal(
			_.countBy(list(6.1, 4.2, 6.3), function (x) { return floor(x); }),
			map(struct([4, 1], [6, 2])));
		assert_equal(
			_.countBy(["one","two","three"], function (x) { return string_length(x); }),
			struct([3, 2], [5, 1]));
		assert_equal(
			_.countBy("hello, world!"),
			struct(["h",1],["e",1],["l",3],["o",2],[",",1],[" ",1],["w",1],["r",1],["d",1],["!",1]));
		// NOTE We're going to only test type-matching here because internally it all uses
		//		the same infrastructure, and I'm lazy.
		assert_equal(typeof(_.countBy([])), "struct");
		assert_equal(typeof(_.countBy("")), "struct");
		assert_equal(ds_exists(_.countBy(list()), ds_type_map), true); // TODO typeof return "map"?

		// _.forEach
		a = 0;
		collection = [1,2,3,4];
		_.forEach(collection, function (x, i, c) {
			assert_equal(c, collection);
			assert_equal(x, i + 1);
			++a;
			if (x == 3)
				return true;
		});
		assert_equal(a, 3);
		a = 0;
		collection = list(1,2,3,4);
		_.forEach(collection, function (x, i, c) {
			assert_equal(c, collection);
			assert_equal(x, i + 1);
			++a;
			if (x == 3)
				return true;
		});
		assert_equal(a, 3);
		a = 0;
		collection = "Hello, World!";
		_.forEach(collection, function (x, i, c) {
			assert_equal(c, collection);
			assert_equal(x, string_char_at(collection, i + 1));
			++a;
			if (x == ",")
				return true;
		});
		assert_equal(a, 6);
		a = 0;
		collection = {a:1,b:2,c:3,d:4};
		_.forEach(collection, function (x, i, c) {
			assert_equal(c, collection);
			assert_equal(x, variable_struct_get(collection, i));
			++a;
			if (i == "c")
				return true;
		});
		assert_equal(a, 3);
		//a = 0;
		//collection = map({a:1,b:2,c:3,d:4});
		//_.forEach(collection, function (x, i, c) {
		//	assert_equal(c, collection);
		//	assert_equal(x, variable_struct_get(collection, i));
		//	++a;
		//	if (i == "c")
		//		return true;
		//});
		//assert_equal(a, 3);
		
		// _.forEachRight
		
		// _.every
		assert_equal(
			_.every([1,2,3,4], function (x) { return x < 5; }),
			true);
		assert_equal(
			_.every([1,2,3,4], function (x) { return x < 2; }),
			false);
		assert_equal(
			_.every(list(1,2,3,4), function (x) { return x < 5; }),
			true);
		assert_equal(
			_.every("Hello, World!", function (x) { return ord(x) >= $30 && ord(x) <= $39; }),
			false);
		assert_equal(
			_.every("1234", function (x) { return ord(x) >= $30 && ord(x) <= $39; }),
			true);
		assert_equal(
			_.every({a:1,b:2,c:3}, function (v, k, c) { return ord(k) == $60 + v; }),
			true);
		assert_equal(
			_.every(map({a:1,b:2,c:3}), function (v, k, c) { return ord(k) == $60 + v; }),
			true);
		assert_equal(
			_.every([{a:true},{a:true}], "a"),
			true);
		assert_equal(
			_.every([{a:true},{a:false}], "a"),
			false);
		assert_equal(
			_.every([{a:true},{a:false}], "a"),
			false);
		assert_equal(
			_.every([{a:1234,b:false,c:"foo"},{a:1234,b:true,c:"foo"}], {a:1234}),
			true);
		assert_equal(
			_.every([{a:1234,b:false,c:"foo"},{a:1234,b:true,c:"foo"}], {b:true}),
			false);
		assert_equal(
			_.every([{a:1234,b:false,c:"foo"},{a:1234,b:true,c:"foo"}], {a:1234,c:"foo"}),
			true);
		assert_equal(
			_.every([{a:1234,b:false,c:"foo"},{a:1234,b:true,c:"foo"}], {a:1234,c:"bar"}),
			false);
		
		// _.filter
		assert_equal(
			_.filter([1,2,3,4], function (x) { return x <= 2; }),
			[1,2]);
		assert_equal(
			_.filter(list(1,2,3,4), function (x) { return x <= 2; }),
			[1,2]);
		assert_equal(
			_.filter("Hello, World!", function (x) { return x == "l"; }),
			["l","l","l"]);
		// NOTE Execution order not guarenteed
		//assert_equal(
		//	_.filter({a:1,b:2,c:3,d:4}, function (x) { return x <= 2; }),
		//	[1,2]);
		assert_equal(
			_.filter({a:1,b:2,c:3,d:4}, function (v, k) { return k == "c"; }),
			[3]);
		assert_equal(
			_.filter(map({a:1,b:2,c:3,d:4}), function (x) { return x == 2; }),
			[2]);
			
		// _.find
		var users = [
			{ user: "barney", age: 36, active: true },
			{ user: "fred", age: 40, active: false },
			{ user: "pebbles", age: 1, active: true }
		];
		
		assert_equal(
			_.find(users, function (x) { return x.active; }),
			users[0]);
		assert_equal(
			_.find(users, function (x) { return x.age > 50; }),
			undefined);
		assert_equal(
			_.find([1,2,3,4], function (x) { return x <= 2; }),
			1);
		assert_equal(
			_.find([1,2,3,4], function (x) { return x <= 2; }, 1),
			2);
		assert_equal(
			_.find(list(1,2,3,4), function (x) { return x == 2; }),
			2);
		assert_equal(
			_.find("Hello, World!", function (x) { return x == "W"; }),
			"W");
		assert_equal(
			_.find(users[0], function (x) { return x == "barney"; }),
			users[0].user);
		assert_equal(
			_.find(map(users[0]), function (x) { return x == "barney"; }),
			users[0].user);
		assert_equal(
			_.find(users, ["user","fred"]),
			users[1]);
			
		// _.findLast
		assert_equal(
			_.findLast(users, function (x) { return x.active; }),
			users[2]);
		assert_equal(
			_.findLast(users, function (x) { return x.age > 30; }),
			users[1]);
		assert_equal(
			_.findLast(users, function (x) { return x.age > 50; }),
			undefined);
		assert_equal(
			_.findLast(list(1,2,3,4), function (x) { return x == 2; }),
			2);
		assert_equal(
			_.findLast([1,2,3,4], function (x) { return x <= 2; }, 0),
			1);
		assert_equal(
			_.findLast("Hello, World!", function (x, i) { return i > 0; }),
			"!");
		// NOTE The runtime does not gaurentee property order, so this is techinically
		//		undefined behavior
		//assert_equal(
		//	_.findLast({a:1,b:2,c:3,d:4}, function (v, k) { return k != "a"; }),
		//	4);
		//assert_equal(
		//	_.findLast(map({a:1,b:2,c:3,d:4}), function (v, k) { return k != "a"; }),
		//	4);
	
		// _.flatMap
		assert_equal(
			_.flatMap([[1,2],[3,4],5,[[6]]]),
			[1,2,3,4,5,[6]]);
		assert_equal(
			_.flatMap([[1,2],[3,4]], function(x) { return [x[0]*2,x[1]*2]; }),
			[2,4,6,8]);
		assert_equal(
			_.flatMap(list(list(1,2),list(3,4),5)),
			list(1,2,3,4,5));
		assert_equal(
			_.flatMap(list([1,2],[3,4],5)),
			list(1,2,3,4,5));
		assert_equal(
			_.flatMap([list(1,2),list(3,4),5]),
			list(1,2,3,4,5));
		assert_equal(
			_.flatMap("wow"),
			["w","o","w"]);
		// NOTE Works, but runtime doesn't guarentee order
		//		[ 1,{ e : 4 },3,2 ] != [ 1,2,3,{ e : 4 } ]
		//assert_equal(
		//	_.flatMap({a:1,b:2,c:[3],d:{e:4}}),
		//	[1,2,3,{e:4}]);
		//assert_equal(
		//	_.flatMap(map({a:1,b:2,c:[3],d:{e:4}})),
		//	[1,2,3,{e:4}]);
		//assert_equal(
		//	_.flatMap(map({a:1,b:2,c:[3],d: map({e:4})})),
		//	[1,2,3,{e:4}]);

		// _.flatMapDeep
		assert_equal(_.flatMapDeep([1,2], function (x) { return [[[x, x]]]; }),
			[1,1,2,2]);

		// _.flatMapDepth
		assert_equal(_.flatMapDepth([1,2], function (x) { return [[[x, x]]]; }, 2),
			[[1,1],[2,2]]);
			
		// _.groupBy
		assert_equal(
			_.groupBy([6.1, 4.2, 6.3], function (x) { return floor(x); }),
			struct([4,[4.2]],[6,[6.1,6.3]]));
		assert_equal(
			_.groupBy([6.1, 4.2, 6.3], function (x) { return floor(x); }),
			struct([4,[4.2]],[6,[6.1,6.3]]));
		assert_equal(
			_.groupBy(list(6.1, 4.2, 6.3), function (x) { return floor(x); }),
			struct([4,[4.2]],[6,[6.1,6.3]]));
		assert_equal(
			_.groupBy("wow"),
			{w:["w","w"],o:["o"]});
		assert_equal(
			_.groupBy({a:1,b:2,c:3,d:2}),
			struct([1,[1]],[2,[2,2]],[3,[3]]));
		assert_equal(
			_.groupBy(map({a:1,b:2,c:3,d:2})),
			struct([1,[1]],[2,[2,2]],[3,[3]]));
		
		// _.includes
		assert_equal(
			_.includes([1,2,3,4], 3),
			true);
		assert_equal(
			_.includes([1,2,3,4], 2, 1),
			true);
		assert_equal(
			_.includes([1,2,3,4], 2, 2),
			false);
		assert_equal(
			_.includes(list(1,2,3,4), 3),
			true);
		assert_equal(
			_.includes([1,2,3,4], 5),
			false);
		assert_equal(
			_.includes("Hello, World!", "o"),
			true);
		assert_equal(
			_.includes("Hello, World!", "H", 1),
			false);
		// BUG Should work
		//assert_equal(
		//	_.includes("Hello, World!", "World"),
		//	true);
		assert_equal(
			_.includes({a:1,b:2,c:3}, 2),
			true);
		assert_equal(
			_.includes(map({a:1,b:2,c:3}), 2),
			true);
		
		// _.keyBy
		assert_equal(
			_.keyBy([{dir:"left",code:97},{dir:"right",code:100}], function (x) { return chr(x.code); }),
			{a:{dir:"left",code:97},d:{dir:"right",code:100}});
		assert_equal(
			_.keyBy(list({dir:"left",code:97},{dir:"right",code:100}), function (x) { return chr(x.code); }),
			struct(["a",{dir:"left",code:97}],["d",{dir:"right",code:100}]));
		assert_equal(
			_.keyBy("hello"),
			{h:"h",e:"e",l:"l",o:"o"});
		
		// _.map
		assert_equal(
			_.map([1,2,3,4], function (x) { return x*2; }),
			[2,4,6,8]);
		assert_equal(
			_.map(list(1,2,3,4), function (x) { return x*2; }),
			list(2,4,6,8));
		assert_equal(
			_.map("hello"),
			["h","e","l","l","o"]);
		assert_equal(
			_.map("hello", function (x) { return chr($60 + (ord(x) - $60 + 13) % 26); }),
			["u","r","y","y","b"]);
		// GMBUG Prop order
		//assert_equal(
		//	_.map({a:1,b:2,c:3,d:4}, function (x) { return x*2; }),
		//	[2,4,6,8]);
		//assert_equal(
		//	_.map(map({a:1,b:2,c:3,d:4}), function (x) { return x*2; }),
		//	list(2,4,6,8));
		
		// _.partition
		var users = [
			{ user: "barney", age: 36, active: true },
			{ user: "fred", age: 40, active: false },
			{ user: "pebbles", age: 1, active: true }
		];
		
		assert_equal(
			_.partition(users, function (x) { return x.active; }),
			[[users[1]], [users[0], users[2]]]);
		assert_equal(
			_.partition([1,2,3]),
			[[],[1,2,3]]);
		
		// _.reduce()
		assert_equal(
			_.reduce([1,2,3,4], function (sum, n) { return sum + n; }, 0),
			10);
		assert_equal(
			_.reduce([1,2,3,4], function (sum, n) { return sum + n; }, 10),
			20);
		assert_equal(
			_.reduce([1,2,3,4]),
			1);
		assert_equal(
			_.reduce([1,2,3,4], _.identity, 4321),
			4321);
		assert_equal(
			_.reduce(list(1,2,3,4), function (sum, n) { return sum + n; }, 0),
			10);
		// NOTE Execution order not guarenteed
		//assert_equal(
		//	_.reduce({a:1,b:2,c:1}, function (result, value, key) {
		//		var sub;
		//		if (!variable_struct_exists(result, value)) {
		//			sub = [];
		//			variable_struct_set(result, value, sub);
		//		}
		//		else
		//			sub = variable_struct_get(result, value);
				
		//		sub[@ array_length(sub)] = key; 
		//		return result;
		//	}, {}),
		//	struct([1,["a","c"]],[2,["b"]]));
		assert_equal(
			_.reduce(map({a:1,b:2}), function (result, value, key) {
				var sub;
				if (!ds_map_exists(result, value)) {
					sub = [];
					ds_map_set(result, value, sub);
				}
				else
					sub = ds_map_find_value(result, value);
				
				sub[@ array_length(sub)] = key; 
				return result;
			}, ds_map_create()),
			map(struct([1,["a"]],[2,["b"]])));
		assert_equal(
			_.reduce("hello"),
			"h");
		
		// _.reduceRight
		assert_equal(
			_.reduceRight([1,2,3,4], function (sum, n) { return sum + n; }, 0),
			10);
		assert_equal(
			_.reduceRight([1,2,3,4], function (sum, n) { return sum + n; }, 10),
			20);
		assert_equal(
			_.reduceRight([1,2,3,4]),
			4);
		assert_equal(
			_.reduceRight([1,2,3,4], _.identity, 4321),
			4321);
		assert_equal(
			_.reduceRight([[0,1],[2,3],[4,5]], function (flat, arr) {
				for(var i = 0, isize = array_length(arr); i < isize; ++i)
					flat[@ array_length(flat)] = arr[i];
				return flat;
			}, []),
			[4,5,2,3,0,1]);
		// NOTE Execution order not guarenteed
		//assert_equal(
		//	_.reduceRight({a:1,b:2,c:1}, function (result, value, key) {
		//		var sub;
		//		if (!variable_struct_exists(result, value)) {
		//			sub = [];
		//			variable_struct_set(result, value, sub);
		//		}
		//		else
		//			sub = variable_struct_get(result, value);
				
		//		sub[@ array_length(sub)] = key; 
		//		return result;
		//	}, {}),
		//	struct([1,["c","a"]],[2,["b"]]));
		assert_equal(
			_.reduceRight("hello"),
			"o");
		
		// _.sample
		// NOTE We can reliably unit test randomness by setting the seed prior
		random_set_seed(1234321);
		assert_equal(_.sample([1,2,3,4]), 2);
		assert_equal(_.sample(list(1,2,3,4)), 3);
		assert_equal(_.sample({a:1,b:2,c:3,d:4}), 3);
		assert_equal(_.sample(map({a:1,b:2,c:3,d:4})), 1);
		assert_equal(_.sample("hello"), "l");
		
		// _.shuffle
		random_set_seed(1234321);
		assert_equal(_.shuffle([1,2,3,4]), [2,4,3,1]);
		assert_equal(_.shuffle([1,2,3,4], 3), [1,2,3]);
		assert_equal(_.shuffle(list(1,2,3,4)), list(1,2,4,3));
		assert_equal(_.shuffle("hello"), ["o","e","l","l","h"]);
		assert_equal(_.shuffle({a:1,b:2,c:3,d:4}), [2,4,1,3]);
		assert_equal(_.shuffle(map({a:1,b:2,c:3,d:4})), list(3,1,2,4));
		
		// _.size
		assert_equal(_.size([1,2,3,4]), 4);
		assert_equal(_.size(list(1,2,3,4)), 4);
		assert_equal(_.size("hello"), 5);
		assert_equal(_.size({a:1,b:2,c:3,d:4}), 4);
		assert_equal(_.size(map({a:1,b:2,c:3,d:4})), 4);
		
		// _.some
		assert_equal(_.some([1,2,3,4], function (x) { return x == 4; }), true);
		assert_equal(_.some([1,2,3,4], function (x) { return x == 5; }), false);
		assert_equal(_.some(list(1,2,3,4), function (x) { return x == 4; }), true);
		assert_equal(_.some({a:1,b:2,c:3,d:4}, function (x) { return x == 4; }), true);
		assert_equal(_.some({a:1,b:2,c:3,d:4}, function (v, k) { return k == "c"; }), true);
		assert_equal(_.some(map({a:1,b:2,c:3,d:4}), function (x) { return x == 4; }), true);
		assert_equal(_.some("wow", function (x) { return x == "o"; }), true);
		
		// _.toString
		assert_equal(_.toString([1,2,3]), "[ 1,2,3 ]");
		assert_equal(_.toString(list(1,2,3)), "[ 1,2,3 ]");
		// NOTE Execution order not guarenteed
		//assert_equal(_.toString({a:1,b:2,c:3}), "{ a : 1, c : 3, b : 2 }");
		//assert_equal(_.toString(map({a:1,b:2,c:3})), "{ b : 2, c : 3, a : 1 }");
		// BUG
		//assert_equal(_.toString([1,2,list(3,4)]), "[ 1,2,[ 3,4 ] ]");
		// TODO More tests
		
		// _.toArray
		// TODO
		
		// _.toList
		// TODO
		
		// _.toMap
		// TODO
		
		// _.toStruct
		// TODO
		
		// _.join
		assert_equal(_.join([1,2,3,4]), "1,2,3,4");
		assert_equal(_.join([1,2,3,4], " and "), "1 and 2 and 3 and 4");
		assert_equal(_.join(list(1,2,3,4)), "1,2,3,4");
		assert_equal(_.join([1,2,[3,4,list(5)]]), "1,2,3,4,5");
		
		show_debug_message(80 * "-");
		show_debug_message("ALL UNIT TESTS PASSED!");
		show_debug_message(80 * "-");
		game_end();
	}

	// UNIT TEST LIBRARY
	function assert_equal(a, b) {
		assert(_.isEqual(a, b),
			string(a) + " != " + string(b));
	}

	function assert_not_equal(a, b) {
		assert(!_.isEqual(a, b),
			string(a) + " == " + string(b));
	}

	function assert(condition, message) {
		if (!condition)
			show_error(message, true);
	}

	function profile(trials, iterations, callback) {
		var avg = 0;
		repeat(trials) {
			var t1 = get_timer();
			repeat(iterations)
				callback();
			var t2 = get_timer();
			avg += t2 - t1;
		}
	
		show_debug_message(string(avg / trials / 1000) + "ms");
	}
	
	function struct() {
		var result = {};
		for(var i = 0; i < argument_count; ++i) {
			var pair = argument[i];
			variable_struct_set(result, pair[0], pair[1]);
		}
		
		return result;
	}

	function list() {
		var result = ds_list_create();
		for(var i = 0; i < argument_count; ++i)
			ds_list_add(result, argument[i]);
		return result;
	}

	function map(struct) {
		var result = ds_map_create();
		var keys = variable_struct_get_names(struct);
		var count = array_length(keys);
	
		for (var i = 0; i < count; ++i) {
			var key = keys[i];
			// GMBUG Names are always strings, even if internally another type
			if (string_digits(key) == key)
				key = real(key);
			
			var value = variable_struct_get(struct, key);
		
			ds_map_add(result, key, value);
		}
	
		return result;
	}

	function grid(array) {
		var width = array_length(array);
		var height = array_length(array[0]);
	
		var result = ds_grid_create(width, height);
		for(var yy = 0; yy < height; ++yy) {
			for(var xx = 0; xx < width; ++xx)
				ds_grid_set(result, xx, yy, array[xx][yy]);
		}
	
		return result;
	}

	function stack() {
		var result = ds_stack_create();
		for (var i = 0; i < argument_count; ++i)
			ds_stack_push(result, argument[i]);
	
		return result;
	}

	function queue() {
		var result = ds_queue_create();
		for (var i = 0; i < argument_count; ++i)
			ds_queue_enqueue(result, argument[i]);
	
		return result;
	}

	function priority() {
		var result = ds_priority_create();
		for (var i = 0; i < argument_count; ++i)
			ds_priority_add(result, argument[i], i);
	
		return result;
	}
	
	// GMBUG This is moved to Room1 creation code cause the
	//       debugger doesn't attach here
	//unitTests();
})();
