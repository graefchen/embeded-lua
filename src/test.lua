print("[LUA] Hello CPP!")

a = 10 * 20 / 2
a = math.pow(a, 5)

function multiplyer(a , b)
	print("[LUA] Multiply "..a.." * "..b)
	return a * b
end

function doin(a, b, c)
	print("[LUA] doin " .. a .. " * (" .. b .. " * " .. c.. ")");
	return mult3(a, b, c)
end
