--!optimize 2
--!native
--[[
		INFORMATION
				
	Creator: @Valkzius
	Name: GammaNum
	Version: 1.05 - 9_15_2025
	Description: large number library for numbers up to 10↑↑2^1024 optimized for speed
	please give credit if used
	
		Function List and Custom Function Area below
		Constants are at the very bottom (use scroll bar)
	
	Remember to scroll down
		
CONVERSION:
	.new(s,l,e)             => creates gammanum equal to s * (10^^l)^e
	^^ s must equal 0, 1, or -1, l must be non-negative
	.fromNumber(number)     => converts number to gammanum
	.fromScientific(m,e)    => creates gammanum equal to m*10^e
	.fromString(string)     => converts string to gammanum 
	^^ please be aware this function is much slower than other conversions
	.totuple(n)             => converts n to the sign,layer,exponent
	.tobuffer(n)            => converts n to a buffer (gammanum)
	.createCheckless(s,l,e) => converts s,l,e to a gammanum without correcting the values
	^^ giving incorrect values and then passing them to other functions could cause incorrect results
	
COMPARISON:
	.eq(n1, n2)      => a == b
	.lt(n1, n2)      => a < b
	.gt(n1, n2)      => a > b
	.lte(n1, n2)     => a <= b
	.gte(n1, n2)     => a >= b
	
ARITHMETIC:
	.add(n1,n2)      => n1 + n2
	.sub(n1,n2)      => n1 - n2
	.mul(n1,n2)      => n1 * n2
	.div(n1,n2)      => n1 / n2
	.recip(n)        => 1 / n
	.intdiv(n1,n2)   => n1 // n2 -- division then floor ex. 33 // 4 = 8
	.mod(n1,n2)      => n1 % n2
	.pow(n1,n2)      => n1 ^ n2
	.root(n1,n2)     => n1 ^ (1 / n2)
	.sqrt(n)         => n ^ 0.5
	.pow2(n)         => 2 ^ n
	.pow10(n)        => 10 ^ n
	.exp(n)          => e ^ n (e = ~2.71828)
	.log(n1,n2)      => logarithm of n1 in base n2
	.log10(n)        => logarithm of n in base 10
	.abslog10(n)     => logarithm of |n| in base 10
	.log2(n)         => logarithm of n in base 2
	.ln(n)           => natural logarithm of n (base ~2.71828)
	.neg(n)          => -n
	.abs(n)          => |n| -- absolute value of n
	.tetr(n1,n2)     => n1↑↑n2 -- tetration of n1 to n2 (n2 must be an integer) ex. n1^n1^..^n1 with n2 n1's
	
EQUALS: 
	.addeq(n1,n2)    => n1 += n2
	.subeq(n1,n2)    => n1 -= n2
	.muleq(n1,n2)    => n1 *= n2
	.diveq(n1,n2)    => n1 /= n2
	.recipeq(n)      => n = 1 / n
	.intdiveq(n1,n2) => n1 //= n2 -- division then floor ex. 33 // 4 = 8
	.modeq(n1,n2)    => n1 %= n2
	.poweq(n1,n2)    => n1 ^= n2
	.rooteq(n1,n2)   => n1 ^= (1 / n2)
	.sqrteq(n)       => n ^= 0.5
	.pow2eq(n)       => n = 2 ^ n
	.pow10eq(n)      => n = 10 ^ n
	.expeq(n)        => n = e ^ n (e = ~2.71828)
	.logeq(n1,n2)    => n1 = logarithm of n1 in base n2
	.log10eq(n)      => n = logarithm of n in base 10
	.abslog10eq(n)   => n = logarithm of |n| in base 10
	.log2eq(n)       => n = logarithm of n in base 2
	.lneq(n)         => n = natural logarithm of n (base ~2.71828)
	.negeq(n)        => n = -n
	.abseq(n)        => n = |n| -- absolute value of n
	
	.set(n,s,l,e)    => sets n to a new gammanum using s,l,e
	.setFromNumber(n,number)    => sets n to a new gammanum from a number
	.copy(n1,n2)     => sets n1 to n2 (both must be gammanums)
	
ROUNDING:
	.floor(n)        => greatest integer less than n
	.round(n)        => closest integer to n
	.ceil(n)         => least integer greater than n
	.roundto(n1,n2)  => Round n1 to a multiple of n2
	
	.flooreq(n)      => n = greatest integer less than n
	.roundeq(n)      => n = closest integer to n
	.ceileq(n)       => n = least integer greater than n
	.roundtoeq(n1,n2)=> n = Round n1 to a multiple of n2

MISC:
	.sign(n)       => returns 1 if n is positive, -1 if negative, and 0 if n equals 0
	.isPositive(n) => returns true if n is positive, else false
	.isNegative(n) => returns true if n is negative, else false
	.isZero(n)     => returns true if n is zero, else false
	.isNumber(n)   => returns true if n is able to be represented by a number, else false
	
	.lbencode(n) => encodes n into something that could be stored in an OrderedDataStore
	.lbdecode(n) => decodes n from .lbencode()
	.b64encode(n) => encodes n into base64 without data loss
	.b64decode(n) => decodes n from .b64encode()
	.hexencode(n) => encodes n into hexadecimal without data loss (faster than b64 but is less compressed)
	.hexdecode(n) => decodes n from .hexencode()

	.random(n1,n2) => random number between n1 and n2
	.geosum(base,mul,start,last)    => sum of geometric series from start -> last	
	.geosumR(base,mul,start,amount) => end index of geometric series that starts from 'start' and sums to amount
	.gamma(n) => the gamma function | (n-1)!
	.fact(n)  => the factorial function | n!

STRING:
	.tostring(n,suffixtype) => converts using the suffix type given (defaults to .DefaultSuffixType below)
	.toScientific(n)        => converts n to scientific notation
	.toEngineer(n)          => converts n to engineer notation
	.toSuffix(n)            => converts n to suffix notation (ex. 3.5k)
	.toLayered(n)           => converts n to layered notation
	.std(s,l,e)             => converts s,l,e to a number then to a string
	.sci(s,l,e)             => converts s,l,e to scientific notation
	.eng(s,l,e)             => converts s,l,e to engineer notation
	.suf(s,l,e)             => converts s,l,e to suffix notation (ex. 3.5k)
	.lay(s,l,e)             => converts s,l,e to layered notation
	.suffix(i)              => suffix for given index ex. 3 would be b for billion
	.print(..)              => prints a list of gammanums without rounding (other types just get default tostring)
]]
local gn = {}
gn.SuffixTypes = {
	Scientific =     0 , -- scientific notation is always on
	Scientific3 =    1 , -- scientific notation starts at 1e3
	Scientific36 =   2 , -- scientific notation starts at 1e36
	Scientific306 =  3 , -- scientific notation starts at 1e306
	Scientific3006 = 4 , -- scientific notation starts at 1e3006
	Engineer = 	     5 , -- engineer notation is always on
	Engineer3 =      6 , -- engineer notation starts at 1e3
	Engineer36 =     7 , -- engineer notation starts at 1e36
	Engineer306 =    8 , -- engineer notation starts at 1e306
	Engineer3006 =   9 , -- engineer notation starts at 1e3006
	Layered =        10, -- layered notation is always on
}
--EDIT IF YOU WANT
gn.DefaultSuffixType = gn.SuffixTypes.Scientific306
gn.DefaultDigits = 0 -- default digits after the decimal with one digit before 
	--ex. 2: 4.53, 3 : 4.536, 4 : 4.5361
gn.DefaultTotalDigits = 2 -- default digits after the decimal with some digits before
	-- ex. 2: 4.53 or 45.3, 3 : 4.536 or 45.36 or 4.536, 4 : 4.5361 or 45.361 or 453.61 or 4536.1
gn.MaxEs = 3 -- maximum trailing Es for scientific() function (up to 20)
	-- ex. 4 trailing Es is "eeee"
--DONT EDIT BELOW
local log10_2 = math.log10(2)
local log10_2x2 = math.log10(log10_2)
local euler = math.exp(1)
local ln_10 = 1 / math.log(10)
local ln_10x2 = math.log10(ln_10)
local inf_limit = math.log10(1.7976931348623157e+308)
local l1_THRESHOLD = 15.653559774527022
local digitcuts = {}
local capthres = {}
local capvalue = {}
local capthresl10 = {}
local capvaluel10 = {}
for i=0,20 do
	digitcuts[i] = "%."..i.."f"
	capthres[i] = 10-0.5*math.pow(10,-i)
	capvalue[i] = 10-math.pow(10,-i)
	capthresl10[i] = math.log10(10-0.5*math.pow(10,-i))
	capvaluel10[i] = math.log10(10-math.pow(10,-i))
end
local pow10 = {}
for i=-20,20 do
	pow10[i] = math.pow(10,i)
end
local Etrail = {"e"}
for i=2,20 do
	Etrail[i] = Etrail[i-1].."e"
end
--CUSTOM FUNCTION AREA
--EXAMPLES:
--[[
	This is a description, read the source then make your own.
]]
function gn.ExampleOperation(input1)
	--convert the input into something we can easily use
	local s1,l1,e1 = gn.totuple(input1)
	--do what you want
	s1 = math.abs(s1)
	l1 += 1
	e1 = -e1
	--then convert it back and return it
	return gn.new(s1,l1,e1)
end
--[[
	This is a description, read the source then make your own.
]]
function gn.ExampleToString(input1)
	--convert the input into something we can easily use
	local s1,l1,e1 = gn.totuple(input1)
	--do what you want
	s1 = math.abs(s1)
	l1 += 1
	e1 = -e1
	--then convert it to a string and return it
	return s1.."_"..l1.."_"..e1
end





--START OF DEFAULT FUNCTIONS
--[[
	Converts input to sign,layer,exponent in a tuple
]]
function gn.totuple(input)
	if type(input) == "buffer" then
		return buffer.readi8(input,0),buffer.readf64(input,1),buffer.readf64(input,9)
	elseif type(input) == "number" then
		if input == 0 then
			return 0,0,0
		elseif input == nil then
			return 1,-1,1
		else
			local s = math.sign(input)
			input = math.abs(input)
			if input >= 1e10 or input <= 1e-10 then
				return s,1,math.log10(input)
			else
				return s,0,input
			end
		end
	else
		error("Wrong Type: totuple(), Input 1")
	end
end
--[[
	Converts input to sign,layer,exponent in a buffer
]]
function gn.tobuffer(input)
	if type(input) == "buffer" then
		return input
	elseif type(input) == "number" then
		local buf = buffer.create()
		if input == 0 then
			return buf
		elseif input == nil then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,-1)
			buffer.writef64(buf,9,1)
			return buf
		else
			buffer.writei8(buf,0,math.sign(input))
			input = math.abs(input)
			if input >= 1e10 or input <= 1e-10 then
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,math.log10(input))
				return buf
			else
				buffer.writef64(buf,9,input)
				return buf
			end
		end
	else
		error("Wrong Type: tobuffer(), Input 1")
	end
end
--[[
	Converts sign,layer,exponent to a buffer without checking
]]
function gn.createCheckless(s,l,e)
	local output = buffer.create(17)
	buffer.writei8(output,0,s)
	buffer.writef64(output,1,l)
	buffer.writef64(output,9,e)
	return output
end
--[[
	Prints gammanum and any type with tostring capabilities
]]
function gn.print(...)
	local args = {...}
	local str = ""
	for _, arg in args do
		if type(arg) == "buffer" then
			str ..= "{"..buffer.readi8(arg,0)..","..buffer.readf64(arg,1)..","..buffer.readf64(arg,9).."} "
		else
			str ..= tostring(arg).." "
		end
	end
	print(str:sub(1,-2))
end
--[[
	Returns Sign, Layer, Exponent of gammanum in a tuple
]]
function gn.show(n)
	return buffer.readi8(n,0), buffer.readf64(n,1), buffer.readf64(n,9)
end
--[[
	Returns Sign, Layer, Exponent of gammanum in a string
]]
function gn.showS(n)
	return "{"..buffer.readi8(n,0)..","..buffer.readf64(n,1)..","..buffer.readf64(n,9).."}"
end
--[[
	Creates gammanum from given Sign(s), Layer(l), Exponent(e)
	s: The Sign, must be 1 if positive, -1 if negative, and 0 if zero
	l: The Layer, number of e's before number (non-negative)
	e: The Exponent, number after the e
	number: s*1ee..(Layer times)..ee(Exponent)
	ex. 1,0,53 -> 53
	ex. -1,1,53 -> -1e53
	ex. 0,0,0 -> 0
	ex. 1,10,-17 -> 1e-eeeeeeeee17
]]
function gn.new(s,l,e)
	local buf = buffer.create(17)
	if s == 0 then
		return buf
	end
	s = math.sign(s)
	l = math.floor(l)
	if l < 0 then 
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,-1)
		buffer.writef64(buf,9,1)
		return buf
	elseif l == math.huge or math.abs(e) == math.huge then 
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,math.huge)
		buffer.writef64(buf,9,1)
		return buf
	elseif l == 0 and e == 0 then 
		return buf
	elseif l == 0 then
		if e < 0  then
			e = -e
			s = -s
		end
		buffer.writei8(buf,0,s)
		if e <= 1e-10 or e >= 1e10 then
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(e))
			return buf
		else
			buffer.writef64(buf,9,e)
			return buf
		end
	elseif math.abs(e) >= 1e10 then
		buffer.writei8(buf,0,s)
		buffer.writef64(buf,1,l+1)
		buffer.writef64(buf,9,math.sign(e)*math.log10(math.abs(e)))
		return buf
	elseif l == 1 and math.abs(e) < 10 then
		buffer.writei8(buf,0,s)
		buffer.writef64(buf,9,math.pow(10,e))
		return buf
	elseif math.abs(e) < 1 then
		if l >= 3 then
			buffer.writei8(buf,0,s)
			buffer.writef64(buf,1,l-2)
			e = math.sign(e) * math.pow(10, math.abs(e))
			buffer.writef64(buf,9,math.sign(e)*math.pow(10,math.abs(e)))
			return buf
		else
			buffer.writei8(buf,0,s)
			buffer.writef64(buf,9,math.pow(10,math.sign(e) * math.pow(10, math.abs(e))))
			return buf
		end
	elseif math.abs(e) < 10 then
		buffer.writei8(buf,0,s)
		buffer.writef64(buf,1,l-1)
		buffer.writef64(buf,9,math.sign(e)*math.pow(10,math.abs(e)))
		return buf
	else
		buffer.writei8(buf,0,s)
		buffer.writef64(buf,1,l)
		buffer.writef64(buf,9,e)
		return buf
	end
end
--[[
	Creates gammanum equal to m * 10 ^ e
]]
function gn.fromScientific(m,e)
	local buf = buffer.create(17)
	local s = math.sign(m)
	local scale = e + math.log10(math.abs(m))
	buffer.writei8(buf,0,s)
	if math.abs(scale) < 10 then
		buffer.writef64(buf,9,10^scale)
		return buf
	elseif math.abs(scale) >= 1e10 then
		buffer.writef64(buf,1,2)
		buffer.writef64(buf,9,math.sign(scale)*math.log10(math.abs(scale)))
		return buf
	else
		buffer.writef64(buf,1,1)
		buffer.writef64(buf,9,scale)
		return buf
	end
end
--[[
	Converts number to gammanum
]]
function gn.fromNumber(n)
	local buf = buffer.create(17)
	if n == 0 then
		return buf
	elseif n == nil or type(n) ~= "number" then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,-1)
		buffer.writef64(buf,9,1)
		return buf
	else
		buffer.writei8(buf,0,math.sign(n))
		n = math.abs(n)
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,buffer.readi8(buf,0)*math.log10(n))
			return buf
		else
			buffer.writef64(buf,9,n)
			return buf
		end
	end
end
--[[
	Converts string to gammanum
	'A;B': layer = A, exponent = B
	'AeB': layer = 1, exponent = B+log10(A)
	'A': layer = 0, exponent = A
	Make value negative by putting '-' in front
	*Please use .new() instead for efficiency
]]
function gn.fromString(str)
	local buf = buffer.create(17)
	if type(str) ~= "string" or str == "" then
		return buf
	elseif str:find(";") then
		local slice = str:split(";")
		local s = math.sign(tonumber(slice[1]))
		if s == 0 then s = 1 end 
		local l = math.abs(tonumber(slice[1]))
		local e = tonumber(slice[2])
		if l < 0 then 
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,-1)
			buffer.writef64(buf,9,1)
			return buf
		elseif l == math.huge or math.abs(e) == math.huge then 
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,math.huge)
			buffer.writef64(buf,9,1)
			return buf
		elseif s == 0 or (l == 0 and e == 0) then 
			return buf
		elseif l == 0 then
			if e < 0  then
				e = -e
				s = -s
			end
			buffer.writei8(buf,0,s)
			if e <= 1e-10 or e >= 1e10 then
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,math.log10(e))
				return buf
			else
				buffer.writef64(buf,9,e)
				return buf
			end
		elseif math.abs(e) >= 1e10 then
			buffer.writei8(buf,0,s)
			buffer.writef64(buf,1,l+1)
			buffer.writef64(buf,9,math.sign(e)*math.log10(math.abs(e)))
			return buf
		elseif l == 1 and math.abs(e) < 10 then
			buffer.writei8(buf,0,s)
			buffer.writef64(buf,9,math.pow(10,e))
			return buf
		elseif math.abs(e) < 1 then
			if l >= 3 then
				buffer.writei8(buf,0,s)
				buffer.writef64(buf,1,l-2)
				e = math.sign(e) * math.pow(10, math.abs(e))
				buffer.writef64(buf,9,math.sign(e)*math.pow(10,math.abs(e)))
				return buf
			else
				buffer.writei8(buf,0,s)
				buffer.writef64(buf,1,l-2)
				buffer.writef64(buf,9,math.pow(10,math.sign(e) * math.pow(10, math.abs(e))))
				return buf
			end
		elseif math.abs(e) < 10 then
			buffer.writei8(buf,0,s)
			buffer.writef64(buf,1,l-1)
			buffer.writef64(buf,9,math.sign(e)*math.pow(10,math.abs(e)))
			return buf
		else
			buffer.writei8(buf,0,s)
			buffer.writef64(buf,1,l)
			buffer.writef64(buf,9,e)
			return buf
		end
	elseif str:find("e") then
		local slice = str:split("e")
		local m = tonumber(slice[1])
		local s = math.sign(m)
		if s == 0 then
			return buf
		end
		local e = tonumber(slice[2]) + math.log10(math.abs(m))
		local es = math.sign(e)
		local ea = math.abs(e)
		buffer.writei8(buf,0,s)
		if ea >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,es*math.log10(ea))
			return buf
		elseif ea < 10 then
			buffer.writef64(buf,9,math.pow(10,e))
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,e)
			return buf
		end
	else
		local strl = str:lower()
		if strl == "inf" then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,math.huge)
			buffer.writef64(buf,9,1)
			return buf
		elseif strl == "nan" then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,-1)
			buffer.writef64(buf,9,1)
			return buf
		end
		local n = tonumber(str)
		if n == 0 then
			return buf
		elseif n == nil or type(n) ~= "number" then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,-1)
			buffer.writef64(buf,9,1)
			return buf
		else
			buffer.writei8(buf,0,math.sign(n))
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,buffer.readi8(buf,0)*math.log10(n))
				return buf
			else
				buffer.writef64(buf,9,n)
				return buf
			end
		end
	end
end
--[[
	Greatest integer less than n
]]
function gn.floor(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: floor(), Input 1")
	end
	local buf = buffer.create(17)
	if s == 0 then
		return buf
	elseif s == 1 then
		if l == 0 then
			local rou = math.floor(e)
			if rou == 0 then
				return buf
			else
				buffer.writei8(buf,0,1)
				buffer.writef64(buf,9,rou)
				return buf
			end
		elseif e < 0 then
			return buf
		elseif l == 1 and e <= l1_THRESHOLD then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(math.floor(10^e)))
			return buf
		else
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,l)
			buffer.writef64(buf,9,e)
			return buf
		end
	elseif l == 0 then
		buffer.writei8(buf,0,-1)
		local rou = math.ceil(e)
		if rou == 1e10 then
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,10)
			return buf
		else
			buffer.writef64(buf,9,rou)
			return buf
		end
	elseif e < 0 then
		buffer.writei8(buf,0,-1)
		buffer.writef64(buf,9,1)
		return buf
	elseif l == 1 and e <= l1_THRESHOLD then
		buffer.writei8(buf,0,-1)
		buffer.writef64(buf,1,1)
		buffer.writef64(buf,9,math.log10(math.ceil(10^e)))
		return buf
	else
		buffer.writei8(buf,0,-1)
		buffer.writef64(buf,1,l)
		buffer.writef64(buf,9,e)
		return buf
	end
end
--[[
	Least integer greater than n
]]
function gn.ceil(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: ceil(), Input 1")
	end
	local buf = buffer.create(17)
	if s == 0 then
		return buf
	elseif s == 1 then
		if l == 0 then
			buffer.writei8(buf,0,1)
			local rou = math.ceil(e)
			if rou == 1e10 then
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,10)
				return buf
			else
				buffer.writef64(buf,9,rou)
				return buf
			end
		elseif e < 0 then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,9,1)
			return buf
		elseif l == 1 and e <= l1_THRESHOLD then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(math.ceil(10^e)))
			return buf
		else
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,l)
			buffer.writef64(buf,9,e)
			return buf
		end
	elseif l == 0 then
		local rou = math.floor(e)
		if rou == 0 then
			return buf
		else
			buffer.writei8(buf,0,-1)
			buffer.writef64(buf,9,rou)
			return buf
		end
	elseif e < 0 then
		return buf
	elseif l == 1 and e <= l1_THRESHOLD then
		buffer.writei8(buf,0,-1)
		buffer.writef64(buf,1,1)
		buffer.writef64(buf,9,math.log10(math.floor(10^e)))
		return buf
	else
		buffer.writei8(buf,0,-1)
		buffer.writef64(buf,1,l)
		buffer.writef64(buf,9,e)
		return buf
	end
end
--[[
	Closest integer to n
]]
function gn.round(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: round(), Input 1")
	end
	local buf = buffer.create(17)
	if s == 0 then
		return buf
	elseif s == 1 then
		if l == 0 then
			local rou = math.round(e)
			if rou == 0 then
				return buf
			elseif rou == 1e10 then
				buffer.writei8(buf,0,1)
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,10)
				return buf
			else
				buffer.writei8(buf,0,1)
				buffer.writef64(buf,9,rou)
				return buf
			end
		elseif e < 0 then
			return buf
		elseif l == 1 and e <= l1_THRESHOLD then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(math.round(10^e)))
			return buf
		else
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,l)
			buffer.writef64(buf,9,e)
			return buf
		end
	elseif l == 0 then
		local rou = math.round(e)
		if rou == 0 then
			return buf
		elseif rou == 1e10 then
			buffer.writei8(buf,0,-1)
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,10)
			return buf
		else
			buffer.writei8(buf,0,-1)
			buffer.writef64(buf,9,rou)
			return buf
		end
	elseif e < 0 then
		return buf
	elseif l == 1 and e <= l1_THRESHOLD then
		buffer.writei8(buf,0,-1)
		buffer.writef64(buf,1,1)
		buffer.writef64(buf,9,math.log10(math.round(10^e)))
		return buf
	else
		buffer.writei8(buf,0,-1)
		buffer.writef64(buf,1,l)
		buffer.writef64(buf,9,e)
		return buf
	end
end
--[[
	Rounds n1 to nearest multiple of n2
]]
function gn.roundto(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: roundto(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = if l2 > 0 then -buffer.readf64(n2,9) else (1/buffer.readf64(n2,9))
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = -math.log10(n2)
			else
				l2 = 0
				e2 = 1/n2
			end
		end
	else
		error("Wrong Type: roundto(), Input 2")
	end
	local buf = buffer.create(17)
	local s,l,e
	if s1 == 0 or s2 == 0 then
		s = 0
		l = 0
		e = 0
	elseif l1 == 0 and l2 == 0 then
		local n = e1 * e2
		s = s1 * s2 * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l1 == l2 and e1 == -e2 then
		s = s1*s2
		l = 0
		e = 1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		s = s1*s2
		if l1 > l2 then
			l = l1
			e = e1
		elseif l1 < l2 then
			l = l2
			e = e2
		elseif math.abs(e1) > math.abs(e2) then
			l = l1
			e = e1
		else
			l = l2
			e = e2
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 + e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 + math.log10(e2)
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) + e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		s = s1 * s2
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				l = l1
				e = e1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s + e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e1s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e1s * 10 ^ a
					else
						l = 1
						e = e1s * a
					end
				else
					l = 2
					e = e1s * a
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				l = l2
				e = e2
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s + e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e2s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e2s * 10 ^ a
					else
						l = 1
						e = e2s * a
					end
				else
					l = 2
					e = e2s * a
				end
			end
		end
	end
	if s == 0 then
		s = 0
		l = 0
		e = 0
	elseif s == 1 then
		if l == 0 then
			e = math.round(e)
			if e == 0 then
				s = 0
			elseif e == 1e10 then
				s = 1
				e = 10
				l = 1
			else
				s = 1
			end
		elseif e < 0 then
			s = 0
			l = 0
			e = 0
		elseif l == 1 and e <= l1_THRESHOLD then
			s = 1
			l = 1
			e = math.log10(math.round(10^e))
		end
	elseif l == 0 then
		e = math.round(e)
		if e == 0 then
			s = 0
		elseif e == 1e10 then
			s = -1
			e = 10
			l = 1
		else
			s = -1
		end
	elseif e < 0 then
		s = 0
		l = 0
		e = 0
	elseif l == 1 and e <= l1_THRESHOLD then
		s = -1
		l = 1
		e = math.log10(math.round(10^e))
	end
	s1 = s
	l1 = l
	e1 = e
	if s1 == 0 or s2 == 0 then
		return buf
	elseif l1 == 0 and l2 == 0 then
		local n = e1 / e2
		buffer.writei8(buf,0,s1 * s2 * math.sign(n))
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(n))
			return buf
		else
			buffer.writef64(buf,9,n)
			return buf
		end
	elseif l1 == l2 and e1 == e2 then
		buffer.writei8(buf,0,s1*s2)
		buffer.writef64(buf,9,1)
		return buf
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		if l1 > l2 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		elseif l1 < l2 then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,-e2)
			return buf
		elseif math.abs(e1) > math.abs(e2) then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		else
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,-e2)
			return buf
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 - e2
		buffer.writei8(buf,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 - math.log10(e2)
		buffer.writei8(buf,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) - e2
		buffer.writei8(buf,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		buffer.writei8(n1,0,s1 * s2)
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				buffer.writef64(buf,1,l1)
				buffer.writef64(buf,9,e1)
				return buf
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s - e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(buf,1,3)
					buffer.writef64(buf,9,e1s * math.log10(a))
					return buf
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(buf,9,e1s * 10 ^ a)
						return buf
					end
					buffer.writef64(buf,1,1)
					buffer.writef64(buf,9,e1s * a)
					return buf
				else
					buffer.writef64(buf,1,2)
					buffer.writef64(buf,9,e1s * a)
					return buf
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				buffer.writef64(buf,1,l2)
				buffer.writef64(buf,9,e2)
				return buf
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s - e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(buf,1,3)
					buffer.writef64(buf,9,e2s * math.log10(a))
					return buf
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(buf,9,e2s * 10 ^ a)
						return buf
					end
					buffer.writef64(buf,1,1)
					buffer.writef64(buf,9,e2s * a)
					return buf
				else
					buffer.writef64(buf,1,2)
					buffer.writef64(buf,9,e2s * a)
					return buf
				end
			end
		end
	end
end
--[[
	n1 < n2
]]
function gn.lt(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: lt(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: lt(), Input 2")
	end
	if s1 ~= s2 then
		return s1 < s2
	end
	local l1s = if e1 > 0 then l1 else -l1
	local l2s = if e2 > 0 then l2 else -l2
	if l1s > l2s then
		return false
	elseif l1s < l2s then
		return true
	elseif e1 > e2 then
		return false
	else
		return true
	end
end
--[[
	n1 <= n2
]]
function gn.lte(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: lte(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: lte(), Input 2")
	end
	if s1 ~= s2 then
		return s1 < s2
	end
	local l1s = if e1 > 0 then l1 else -l1
	local l2s = if e2 > 0 then l2 else -l2
	if l1s > l2s then
		return false
	elseif l1s < l2s then
		return true
	elseif e1 <= e2 then
		return true
	else
		return false
	end
end
--[[
	n1 > n2
]]
function gn.gt(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: gt(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: gt(), Input 2")
	end
	if s1 ~= s2 then
		return s1 > s2
	end
	local l1s = if e1 > 0 then l1 else -l1
	local l2s = if e2 > 0 then l2 else -l2
	if l1s > l2s then
		return true
	elseif l1s < l2s then
		return false
	elseif e1 > e2 then
		return true
	else
		return false
	end
end
--[[
	n1 >= n2
]]
function gn.gte(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: gte(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: gte(), Input 2")
	end
	if s1 ~= s2 then
		return s1 > s2
	end
	local l1s = if e1 > 0 then l1 else -l1
	local l2s = if e2 > 0 then l2 else -l2
	if l1s > l2s then
		return true
	elseif l1s < l2s then
		return false
	elseif e1 >= e2 then
		return true
	else
		return false
	end
end
--[[
	n1 == n2
]]
function gn.eq(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: eq(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: eq(), Input 2")
	end
	return s1 == s2 and l1 == l2 and e1 == e2
end
--[[
	n1 + n2
	Sum of n1 and n2
]]
function gn.add(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: add(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: add(), Input 2")
	end
	local buf = buffer.create(17)
	if s1 == 0 then
		buffer.writei8(buf,0,s2)
		buffer.writef64(buf,1,l2)
		buffer.writef64(buf,9,e2)
		return buf
	elseif s2 == 0 then
		buffer.writei8(buf,0,s1)
		buffer.writef64(buf,1,l1)
		buffer.writef64(buf,9,e1)
		return buf
	elseif s1 == -s2 and l1 == l2 and e1 == e2 then
		return buf
	elseif l1 >= 2 or l2 >= 2 then
		local l1s = if e1 > 0 then l1 else -l1
		local l2s = if e2 > 0 then l2 else -l2
		if l1s > l2s then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		elseif l1s < l2s then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		elseif e1 > e2 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		else
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		end
	elseif l1 == 0 and l2 == 0 then
		local n = s1 * e1 + s2 * e2
		if n == 0 then
			return buf
		elseif n == nil or type(n) ~= "number" then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,-1)
			buffer.writef64(buf,9,1)
			return buf
		else
			buffer.writei8(buf,0,math.sign(n))
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,math.log10(n))
				return buf
			else
				buffer.writef64(buf,9,n)
				return buf
			end
		end
	elseif l1 == 1 and l2 == 0 then
		local oomdif = e1 - math.log10(e2)
		if math.abs(oomdif) >= 16 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		end
		local n = s2 + s1 * math.pow(10,oomdif)
		buffer.writei8(buf,0,math.sign(n))
		local a = math.log10(e2 * math.abs(n))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif l1 == 0 and l2 == 1 then
		local oomdif = e2 - math.log10(e1)
		if math.abs(oomdif) >= 16 then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		end
		local n = s1 + s2 * math.pow(10,oomdif)
		buffer.writei8(buf,0,math.sign(n))
		local a = math.log10(e1 * math.abs(n))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif e1 >= e2 then
		local oomdif = e1 - e2
		if oomdif >= 16 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		else
			local n = s2 + s1 * 10 ^ oomdif
			buffer.writei8(buf,0,math.sign(n))
			local a = e2 + math.log10(math.abs(n))
			if a >= 1e10 then
				buffer.writef64(buf,1,2)
				buffer.writef64(buf,9,math.log10(a))
				return buf
			elseif a < 10 then
				buffer.writef64(buf,9,10 ^ a)
				return buf
			else
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,a)
				return buf
			end
		end
	else
		local oomdif = e2 - e1
		if oomdif >= 16 then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		else
			local n = s1 + s2 * 10 ^ oomdif
			buffer.writei8(buf,0,math.sign(n))
			local a = e1 + math.log10(math.abs(n))
			if a >= 1e10 then
				buffer.writef64(buf,1,2)
				buffer.writef64(buf,9,math.log10(a))
				return buf
			elseif a < 10 then
				buffer.writef64(buf,9,10 ^ a)
				return buf
			else
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,a)
				return buf
			end
		end
	end
end
--[[
	n1 - n2
	Difference of n1 and n2
]]
function gn.sub(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: sub(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = -buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = -math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: sub(), Input 2")
	end
	local buf = buffer.create(17)
	if s1 == 0 then
		buffer.writei8(buf,0,s2)
		buffer.writef64(buf,1,l2)
		buffer.writef64(buf,9,e2)
		return buf
	elseif s2 == 0 then
		buffer.writei8(buf,0,s1)
		buffer.writef64(buf,1,l1)
		buffer.writef64(buf,9,e1)
		return buf
	elseif s1 == -s2 and l1 == l2 and e1 == e2 then
		return buf
	elseif l1 >= 2 or l2 >= 2 then
		local l1s = if e1 > 0 then l1 else -l1
		local l2s = if e2 > 0 then l2 else -l2
		if l1s > l2s then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		elseif l1s < l2s then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		elseif e1 > e2 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		else
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		end
	elseif l1 == 0 and l2 == 0 then
		local n = s1 * e1 + s2 * e2
		if n == 0 then
			return buf
		elseif n == nil or type(n) ~= "number" then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,-1)
			buffer.writef64(buf,9,1)
			return buf
		else
			buffer.writei8(buf,0,math.sign(n))
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,math.log10(n))
				return buf
			else
				buffer.writef64(buf,9,n)
				return buf
			end
		end
	elseif l1 == 1 and l2 == 0 then
		local oomdif = e1 - math.log10(e2)
		if math.abs(oomdif) >= 16 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		end
		local n = s2 + s1 * math.pow(10,oomdif)
		buffer.writei8(buf,0,math.sign(n))
		local a = math.log10(e2 * math.abs(n))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif l1 == 0 and l2 == 1 then
		local oomdif = e2 - math.log10(e1)
		if math.abs(oomdif) >= 16 then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		end
		local n = s1 + s2 * math.pow(10,oomdif)
		buffer.writei8(buf,0,math.sign(n))
		local a = math.log10(e1 * math.abs(n))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif e1 >= e2 then
		local oomdif = e1 - e2
		if oomdif >= 16 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		else
			local n = s2 + s1 * 10 ^ oomdif
			buffer.writei8(buf,0,math.sign(n))
			local a = e2 + math.log10(math.abs(n))
			if a >= 1e10 then
				buffer.writef64(buf,1,2)
				buffer.writef64(buf,9,math.log10(a))
				return buf
			elseif a < 10 then
				buffer.writef64(buf,9,10 ^ a)
				return buf
			else
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,a)
				return buf
			end
		end
	else
		local oomdif = e2 - e1
		if oomdif >= 16 then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		else
			local n = s1 + s2 * 10 ^ oomdif
			buffer.writei8(buf,0,math.sign(n))
			local a = e1 + math.log10(math.abs(n))
			if a >= 1e10 then
				buffer.writef64(buf,1,2)
				buffer.writef64(buf,9,math.log10(a))
				return buf
			elseif a < 10 then
				buffer.writef64(buf,9,10 ^ a)
				return buf
			else
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,a)
				return buf
			end
		end
	end
end
--[[
	n1 * n2
	Product of n1 and n2
]]
function gn.mul(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: mul(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: mul(), Input 2")
	end
	local buf = buffer.create(17)
	if s1 == 0 or s2 == 0 then
		return buf
	elseif l1 == 0 and l2 == 0 then
		local n = e1 * e2
		buffer.writei8(buf,0,s1 * s2 * math.sign(n))
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(n))
			return buf
		else
			buffer.writef64(buf,9,n)
			return buf
		end
	elseif l1 == l2 and e1 == -e2 then
		buffer.writei8(buf,0,s1*s2)
		buffer.writef64(buf,9,1)
		return buf
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		if l1 > l2 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		elseif l1 < l2 then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		elseif math.abs(e1) > math.abs(e2) then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		else
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 + e2
		buffer.writei8(buf,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 + math.log10(e2)
		buffer.writei8(buf,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) + e2
		buffer.writei8(buf,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		buffer.writei8(n1,0,s1 * s2)
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				buffer.writef64(buf,1,l1)
				buffer.writef64(buf,9,e1)
				return buf
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s + e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(buf,1,3)
					buffer.writef64(buf,9,e1s * math.log10(a))
					return buf
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(buf,9,e1s * 10 ^ a)
						return buf
					end
					buffer.writef64(buf,1,1)
					buffer.writef64(buf,9,e1s * a)
					return buf
				else
					buffer.writef64(buf,1,2)
					buffer.writef64(buf,9,e1s * a)
					return buf
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				buffer.writef64(buf,1,l2)
				buffer.writef64(buf,9,e2)
				return buf
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s + e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(buf,1,3)
					buffer.writef64(buf,9,e2s * math.log10(a))
					return buf
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(buf,9,e2s * 10 ^ a)
						return buf
					end
					buffer.writef64(buf,1,1)
					buffer.writef64(buf,9,e2s * a)
					return buf
				else
					buffer.writef64(buf,1,2)
					buffer.writef64(buf,9,e2s * a)
					return buf
				end
			end
		end
	end
end
--[[
	n1 / n2
	Quotient of n1 and n2
]]
function gn.div(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: div(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: div(), Input 2")
	end
	local buf = buffer.create(17)
	if s1 == 0 or s2 == 0 then
		return buf
	elseif l1 == 0 and l2 == 0 then
		local n = e1 / e2
		buffer.writei8(buf,0,s1 * s2 * math.sign(n))
		n = math.abs(n)
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(n))
			return buf
		else
			buffer.writef64(buf,9,n)
			return buf
		end
	elseif l1 == l2 and e1 == e2 then
		buffer.writei8(buf,0,s1*s2)
		buffer.writef64(buf,9,1)
		return buf
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		if l1 > l2 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		elseif l1 < l2 then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,-e2)
			return buf
		elseif math.abs(e1) > math.abs(e2) then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		else
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,-e2)
			return buf
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 - e2
		buffer.writei8(buf,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 - math.log10(e2)
		buffer.writei8(buf,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) - e2
		buffer.writei8(buf,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		buffer.writei8(n1,0,s1 * s2)
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				buffer.writef64(buf,1,l1)
				buffer.writef64(buf,9,e1)
				return buf
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s - e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(buf,1,3)
					buffer.writef64(buf,9,e1s * math.log10(a))
					return buf
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(buf,9,e1s * 10 ^ a)
						return buf
					end
					buffer.writef64(buf,1,1)
					buffer.writef64(buf,9,e1s * a)
					return buf
				else
					buffer.writef64(buf,1,2)
					buffer.writef64(buf,9,e1s * a)
					return buf
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				buffer.writef64(buf,1,l2)
				buffer.writef64(buf,9,-e2)
				return buf
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s - e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(buf,1,3)
					buffer.writef64(buf,9,e2s * math.log10(a))
					return buf
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(buf,9,e2s * 10 ^ a)
						return buf
					end
					buffer.writef64(buf,1,1)
					buffer.writef64(buf,9,e2s * a)
					return buf
				else
					buffer.writef64(buf,1,2)
					buffer.writef64(buf,9,e2s * a)
					return buf
				end
			end
		end
	end
end
--[[
	n1 // n2 (similar to floor(n1 / n2))
	Integer Quotient of n1 and n2
]]
function gn.intdiv(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: intdiv(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: intdiv(), Input 2")
	end
	local buf = buffer.create(17)
	local s,l,e
	if s1 == 0 or s2 == 0 then
		s = 0
		l = 0
		e = 0
	elseif l1 == 0 and l2 == 0 then
		local n = e1 / e2
		s = s1 * s2 * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l1 == l2 and e1 == e2 then
		s = s1*s2
		l = 0
		e = 1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		s = s1*s2
		if l1 > l2 then
			l = l1
			e = e1
		elseif l1 < l2 then
			l = l2
			e = -e2
		elseif math.abs(e1) > math.abs(e2) then
			l = l1
			e = e1
		else
			l = l2
			e = -e2
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 - e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 - math.log10(e2)
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) - e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		s = s1 * s2
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				l = l1
				e = e1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s - e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e1s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e1s * 10 ^ a
					else
						l = 1
						e = e1s * a
					end
				else
					l = 2
					e = e1s * a
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				l = l2
				e = e2
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s - e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e2s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e2s * 10 ^ a
					else
						l = 1
						e = e2s * a
					end
				else
					l = 2
					e = e2s * a
				end
			end
		end
	end
	if s == 0 then
		return buf
	elseif s == 1 then
		if l == 0 then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,9,math.floor(e))
			return buf
		elseif e < 0 then
			return buf
		elseif l == 1 and e <= l1_THRESHOLD then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(math.floor(10^e)))
			return buf
		else
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,l)
			buffer.writef64(buf,9,e)
			return buf
		end
	elseif l == 0 then
		buffer.writei8(buf,0,-1)
		buffer.writef64(buf,9,math.ceil(e))
		return buf
	elseif e < 0 then
		buffer.writei8(buf,0,-1)
		buffer.writef64(buf,9,1)
		return buf
	elseif l == 1 and e <= l1_THRESHOLD then
		buffer.writei8(buf,0,-1)
		buffer.writef64(buf,1,1)
		buffer.writef64(buf,9,math.log10(math.ceil(10^e)))
		return buf
	else
		buffer.writei8(buf,0,-1)
		buffer.writef64(buf,1,l)
		buffer.writef64(buf,9,e)
		return buf
	end
end
--[[
	n1 % n2
	Modulus of n1 and n2
]]
function gn.mod(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: mod(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: mod(), Input 2")
	end
	local buf = buffer.create(17)
	local s,l,e
	if s1 == 0 or s2 == 0 then
		s = 0
		l = 0
		e = 0
	elseif l1 == 0 and l2 == 0 then
		local n = e1 / e2
		s = s1 * s2 * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l1 == l2 and e1 == e2 then
		s = s1*s2
		l = 0
		e = 1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		s = s1*s2
		if l1 > l2 then
			l = l1
			e = e1
		elseif l1 < l2 then
			l = l2
			e = -e2
		elseif math.abs(e1) > math.abs(e2) then
			l = l1
			e = e1
		else
			l = l2
			e = -e2
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 - e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 - math.log10(e2)
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) - e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		s = s1 * s2
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				l = l1
				e = e1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s - e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e1s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e1s * 10 ^ a
					else
						l = 1
						e = e1s * a
					end
				else
					l = 2
					e = e1s * a
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				l = l2
				e = e2
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s - e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e2s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e2s * 10 ^ a
					else
						l = 1
						e = e2s * a
					end
				else
					l = 2
					e = e2s * a
				end
			end
		end
	end
	if s == 0 then
		s = 0
		l = 0
		e = 0
	elseif s == 1 then
		if l == 0 then
			s = 1
			l = 0
			e = math.floor(e)
		elseif e < 0 then
			s = 0
			l = 0
			e = 0
		elseif l == 1 and e <= l1_THRESHOLD then
			s = 1
			l = 1
			e = math.log10(math.floor(10^e))
		end
	elseif l == 0 then
		s = -1
		l = 0
		e = math.ceil(e)
	elseif e < 0 then
		s = -1
		l = 0
		e = 1
	elseif l == 1 and e <= l1_THRESHOLD then
		s = -1
		l = 1
		e = math.log10(math.ceil(10^e))
	end
	local s3,l3,e3 = s1,l1,e1
	s1 = s
	l1 = l
	e1 = e
	if l1 == 0 and l2 == 0 then
		local n = e1 * e2
		s = s1 * s2 * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l1 == l2 and e1 == -e2 then
		s = s1*s2
		l = 0
		e = 1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		s = s1*s2
		if l1 > l2 then
			l = l1
			e = e1
		elseif l1 < l2 then
			l = l2
			e = e2
		elseif math.abs(e1) > math.abs(e2) then
			l = l1
			e = e1
		else
			l = l2
			e = e2
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 + e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 + math.log10(e2)
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) + e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		s = s1 * s2
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				l = l1
				e = e1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s + e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e1s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e1s * 10 ^ a
					else
						l = 1
						e = e1s * a
					end
				else
					l = 2
					e = e1s * a
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				l = l2
				e = e2
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s + e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e2s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e2s * 10 ^ a
					else
						l = 1
						e = e2s * a
					end
				else
					l = 2
					e = e2s * a
				end
			end
		end
	end
	s1 = s3
	l1 = l3
	e1 = e3
	s2 = -s
	l2 = l
	e2 = e
	if s1 == 0 then
		buffer.writei8(buf,0,s2)
		buffer.writef64(buf,1,l2)
		buffer.writef64(buf,9,e2)
		return buf
	elseif s2 == 0 then
		buffer.writei8(buf,0,s1)
		buffer.writef64(buf,1,l1)
		buffer.writef64(buf,9,e1)
		return buf
	elseif s1 == -s2 and l1 == l2 and e1 == e2 then
		return buf
	elseif l1 >= 2 or l2 >= 2 then
		local l1s = if e1 > 0 then l1 else -l1
		local l2s = if e2 > 0 then l2 else -l2
		if l1s > l2s then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		elseif l1s < l2s then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		elseif e1 > e2 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		else
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		end
	elseif l1 == 0 and l2 == 0 then
		local n = s1 * e1 + s2 * e2
		if n == 0 then
			return buf
		elseif n == nil or type(n) ~= "number" then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,-1)
			buffer.writef64(buf,9,1)
			return buf
		else
			buffer.writei8(buf,0,math.sign(n))
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,math.log10(n))
				return buf
			else
				buffer.writef64(buf,9,n)
				return buf
			end
		end
	elseif l1 == 1 and l2 == 0 then
		local oomdif = e1 - math.log10(e2)
		if math.abs(oomdif) >= 16 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		end
		local n = s2 + s1 * math.pow(10,oomdif)
		buffer.writei8(buf,0,math.sign(n))
		local a = math.log10(e2 * math.abs(n))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif l1 == 0 and l2 == 1 then
		local oomdif = e2 - math.log10(e1)
		if math.abs(oomdif) >= 16 then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		end
		local n = s1 + s2 * math.pow(10,oomdif)
		buffer.writei8(buf,0,math.sign(n))
		local a = math.log10(e1 * math.abs(n))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif e1 >= e2 then
		local oomdif = e1 - e2
		if oomdif >= 16 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		else
			local n = s2 + s1 * 10 ^ oomdif
			buffer.writei8(buf,0,math.sign(n))
			local a = e2 + math.log10(math.abs(n))
			if a >= 1e10 then
				buffer.writef64(buf,1,2)
				buffer.writef64(buf,9,math.log10(a))
				return buf
			elseif a < 10 then
				buffer.writef64(buf,9,10 ^ a)
				return buf
			else
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,a)
				return buf
			end
		end
	else
		local oomdif = e2 - e1
		if oomdif >= 16 then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,e2)
			return buf
		else
			local n = s1 + s2 * 10 ^ oomdif
			buffer.writei8(buf,0,math.sign(n))
			local a = e1 + math.log10(math.abs(n))
			if a >= 1e10 then
				buffer.writef64(buf,1,2)
				buffer.writef64(buf,9,math.log10(a))
				return buf
			elseif a < 10 then
				buffer.writef64(buf,9,10 ^ a)
				return buf
			else
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,a)
				return buf
			end
		end
	end
end
--[[
	1 / n
	Reciprocal of n
]]
function gn.recip(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: recip(), Input 1")
	end
	local buf = buffer.create(17)
	buffer.writei8(buf,0,s)
	buffer.writef64(buf,1,l)
	buffer.writef64(buf,9, if l > 0 then -e else 1 / e)
	return buf
end
--[[
	|n|
	Absolute Value of n
]]
function gn.abs(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: abs(), Input 1")
	end
	local buf = buffer.create(17)
	buffer.writei8(buf,0,math.abs(s))
	buffer.writef64(buf,1,l)
	buffer.writef64(buf,9,e)
	return buf
end
--[[
	-n
	Negated n
]]
function gn.neg(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: neg(), Input 1")
	end
	local buf = buffer.create(17)
	buffer.writei8(buf,0,-s)
	buffer.writef64(buf,1,l)
	buffer.writef64(buf,9,e)
	return buf
end
--[[
	10^n
	Exponentiation of 10 and n
]]
function gn.pow10(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: pow10(), Input 1")
	end
	local buf = buffer.create(17)
	if l == 0 and e < 10 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,10^(s*e))
		return buf
	elseif e < 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	else
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,l+1)
		buffer.writef64(buf,9,s*e)
		return buf
	end
end
--[[
	log10(n)
	Logarithm of n in base 10
]]
function gn.log10(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: log10(), Input 1")
	end
	local buf = buffer.create(17)
	if s <= 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,-1)
		buffer.writef64(buf,9,1)
		return buf
	elseif l == 0 then
		buffer.writef64(buf,9,math.log10(e))
		buffer.writei8(buf,0,math.sign(buffer.readf64(buf,9)))
		buffer.writef64(buf,9,math.abs(buffer.readf64(buf,9)))
		return buf
	else
		buffer.writei8(buf,0,math.sign(e))
		buffer.writef64(buf,1,l-1)
		buffer.writef64(buf,9,math.abs(e))
		return buf
	end
end
--[[
	log10(|n|)
	Logarithm of the Absolute Value of n in base 10
]]
function gn.abslog10(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: abslog10(), Input 1")
	end
	local buf = buffer.create(17)
	if s == 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,-1)
		buffer.writef64(buf,9,1)
		return buf
	elseif l == 0 then
		buffer.writef64(buf,9,math.log10(e))
		buffer.writei8(buf,0,math.sign(buffer.readf64(buf,9)))
		buffer.writef64(buf,9,math.abs(buffer.readf64(buf,9)))
		return buf
	else
		buffer.writei8(buf,0,math.sign(e))
		buffer.writef64(buf,1,l-1)
		buffer.writef64(buf,9,math.abs(e))
		return buf
	end
end
--[[
	n1 ^ n2
	Exponentiation of n1 and n2
]]
function gn.pow(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: pow(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: pow(), Input 2")
	end
	local buf = buffer.create(17)
	--checks
	if s1 == 0 then
		return buf
	elseif (s1 == 1 and l1 == 0 and e1 == 1) or s2 == 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	elseif s2 == 1 and l2 == 0 and e2 == 1 then
		buffer.writei8(buf,0,s1)
		buffer.writef64(buf,1,l1)
		buffer.writef64(buf,9,e1)
		return buf
	end
	--abslog10
	if l1 == 0 then
		e1 = math.log10(e1)
		s1 = math.sign(e1)
		e1 = math.abs(e1)
	else
		s1 = math.sign(e1)
		l1 -= 1
		e1 = math.abs(e1)
	end
	--mul
	local s,l,e
	if l1 == 0 and l2 == 0 then
		local n = e1 * e2
		s = s1 * s2 * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l1 == l2 and e1 == -e2 then
		s = s1*s2
		l = 0
		e = 1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		s = s1*s2
		if l1 > l2 then
			l = l1
			e = e1
		elseif l1 < l2 then
			l = l2
			e = e2
		elseif math.abs(e1) > math.abs(e2) then
			l = l1
			e = e1
		else
			l = l2
			e = e2
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 + e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 + math.log10(e2)
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) + e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		s = s1 * s2
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				l = l1
				e = e1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s + e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e1s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e1s * 10 ^ a
					else
						l = 1
						e = e1s * a
					end
				else
					l = 2
					e = e1s * a
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				l = l2
				e = e2
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s + e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e2s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e2s * 10 ^ a
					else
						l = 1
						e = e2s * a
					end
				else
					l = 2
					e = e2s * a
				end
			end
		end
	end
	--pow10
	if l == 0 and e < 10 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,math.pow(10,s*e))
		return buf
	elseif e < 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	else
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,l+1)
		buffer.writef64(buf,9,s*e)
		return buf
	end
end
--[[
	n1 ^ (1 / n2)
	n2'th Root of n1
]]
function gn.root(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: pow(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: pow(), Input 2")
	end
	local buf = buffer.create(17)
	--checks
	if s1 == 0 then
		return buf
	elseif (s1 == 1 and l1 == 0 and e1 == 1) or s2 == 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	elseif s2 == 1 and l2 == 0 and e2 == 1 then
		buffer.writei8(buf,0,s1)
		buffer.writef64(buf,1,l1)
		buffer.writef64(buf,9,e1)
		return buf
	end
	--abslog10
	if l1 == 0 then
		e1 = math.log10(e1)
		s1 = math.sign(e1)
		e1 = math.abs(e1)
	else
		s1 = math.sign(e1)
		l1 -= 1
		e1 = math.abs(e1)
	end
	--div
	local s,l,e
	if l1 == 0 and l2 == 0 then
		local n = e1 / e2
		s = s1 * s2 * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l1 == l2 and e1 == e2 then
		s = s1*s2
		l = 0
		e = 1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		s = s1*s2
		if l1 > l2 then
			l = l1
			e = e1
		elseif l1 < l2 then
			l = l2
			e = -e2
		elseif math.abs(e1) > math.abs(e2) then
			l = l1
			e = e1
		else
			l = l2
			e = -e2
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 - e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 - math.log10(e2)
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) - e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		s = s1 * s2
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				l = l1
				e = e1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s - e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e1s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e1s * 10 ^ a
					else
						l = 1
						e = e1s * a
					end
				else
					l = 2
					e = e1s * a
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				l = l2
				e = e2
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s - e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e2s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e2s * 10 ^ a
					else
						l = 1
						e = e2s * a
					end
				else
					l = 2
					e = e2s * a
				end
			end
		end
	end
	--pow10
	if l == 0 and e < 10 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,math.pow(10,s*e))
		return buf
	elseif e < 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	else
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,l+1)
		buffer.writef64(buf,9,s*e)
		return buf
	end
end
--[[
	n ^ 0.5
	Square Root of n
]]
function gn.sqrt(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: sqrt(), Input 1")
	end
	local buf = buffer.create(17)
	--checks
	if s == 0 then
		return buf
	elseif s == 1 and l == 0 and e == 1 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	end
	--abslog10
	if l == 0 then
		e = math.log10(e)
		s = math.sign(e)
		e = math.abs(e)
	else
		s = math.sign(e)
		l -= 1
		e = math.abs(e)
	end
	--div
	if l == 0 then
		local n = e / 2
		s = s * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l == 1 then
		local a = e - log10_2
		s = s * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	end
	--pow10
	if l == 0 and e < 10 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,math.pow(10,s*e))
		return buf
	elseif e < 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	else
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,l+1)
		buffer.writef64(buf,9,s*e)
		return buf
	end
end
--[[
	2 ^ n
	Exponentiation of 2 and n
]]
function gn.pow2(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: pow2(), Input 1")
	end
	local buf = buffer.create(17)
	--checks
	if s == 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	elseif s == 1 and l == 0 and e == 1 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,2)
		return buf
	end
	--mul
	if l == 0 then
		local n = log10_2 * e
		s = s * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l == 1 then
		local a = e + log10_2x2
		s = s * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	end
	--pow10
	if l == 0 and e < 10 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,math.pow(10,s*e))
		return buf
	elseif e < 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	else
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,l+1)
		buffer.writef64(buf,9,s*e)
		return buf
	end
end
--[[
	e ^ n
	Exponentiation of e and n (e = ~2.71828)
]]
function gn.exp(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: exp(), Input 1")
	end
	local buf = buffer.create(17)
	--checks
	if s == 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	elseif s == 1 and l == 0 and e == 1 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,euler)
		return buf
	end
	--mul
	if l == 0 then
		local n = ln_10 * e
		s = s * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l == 1 then
		local a = e + ln_10x2
		s = s * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	end
	--pow10
	if l == 0 and e < 10 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,math.pow(10,s*e))
		return buf
	elseif e < 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	else
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,l+1)
		buffer.writef64(buf,9,s*e)
		return buf
	end
end
--[[
	Logarithm of n1 in base n2
]]
function gn.log(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: log(), Input 1")
	end
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: log(), Input 2")
	end
	local buf = buffer.create(17)
	--checks
	if s1 <= 0 or s2 <= 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,-1)
		buffer.writef64(buf,9,1)
		return buf
	elseif l1 == 0 and l2 == 0 then
		local n = math.log10(e1) / math.log10(e2)
		buffer.writei8(buf,0,math.sign(n))
		if math.abs(n) >= 1e10 or math.abs(n) <= 1e-10 then
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(math.abs(n)))
			return buf
		else
			buffer.writef64(buf,9,math.abs(n))
			return buf
		end
	end
	--log10s
	if l1 == 0 then
		e1 = math.log10(e1)
		s1 = math.sign(e1)
		e1 = math.abs(e1)
	else
		s1 = math.sign(e1)
		l1 -= 1
		e1 = math.abs(e1)
	end
	if l2 == 0 then
		e2 = math.log10(e2)
		s2 = math.sign(e2)
		e2 = math.abs(e2)
	else
		s2 = math.sign(e2)
		l2 -= 1
		e2 = math.abs(e2)
	end
	--div
	if l1 == 0 and l2 == 0 then
		local n = e1 / e2
		buffer.writei8(buf,0,s1 * s2 * math.sign(n))
		n = math.abs(n)
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(n))
			return buf
		else
			buffer.writef64(buf,9,n)
			return buf
		end
	elseif l1 == l2 and e1 == e2 then
		buffer.writei8(buf,0,s1*s2)
		buffer.writef64(buf,9,1)
		return buf
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		if l1 > l2 then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		elseif l1 < l2 then
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,-e2)
			return buf
		elseif math.abs(e1) > math.abs(e2) then
			buffer.writei8(buf,0,s1)
			buffer.writef64(buf,1,l1)
			buffer.writef64(buf,9,e1)
			return buf
		else
			buffer.writei8(buf,0,s2)
			buffer.writef64(buf,1,l2)
			buffer.writef64(buf,9,-e2)
			return buf
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 - e2
		buffer.writei8(buf,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 - math.log10(e2)
		buffer.writei8(buf,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) - e2
		buffer.writei8(buf,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		buffer.writei8(n1,0,s1 * s2)
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				buffer.writef64(buf,1,l1)
				buffer.writef64(buf,9,e1)
				return buf
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s - e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(buf,1,3)
					buffer.writef64(buf,9,e1s * math.log10(a))
					return buf
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(buf,9,e1s * 10 ^ a)
						return buf
					end
					buffer.writef64(buf,1,1)
					buffer.writef64(buf,9,e1s * a)
					return buf
				else
					buffer.writef64(buf,1,2)
					buffer.writef64(buf,9,e1s * a)
					return buf
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				buffer.writef64(buf,1,l2)
				buffer.writef64(buf,9,-e2)
				return buf
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s - e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(buf,1,3)
					buffer.writef64(buf,9,e2s * math.log10(a))
					return buf
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(buf,9,e2s * 10 ^ a)
						return buf
					end
					buffer.writef64(buf,1,1)
					buffer.writef64(buf,9,e2s * a)
					return buf
				else
					buffer.writef64(buf,1,2)
					buffer.writef64(buf,9,e2s * a)
					return buf
				end
			end
		end
	end
end
--[[
	Logarithm of n in base 2
]]
function gn.log2(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: log2(), Input 1")
	end
	local buf = buffer.create(17)
	--checks
	if s <= 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,-1)
		buffer.writef64(buf,9,1)
		return buf
	elseif l == 0 then
		local n = math.log10(e) / log10_2
		buffer.writei8(buf,0,math.sign(n))
		if math.abs(n) >= 1e10 or math.abs(n) <= 1e-10 then
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(math.abs(n)))
			return buf
		else
			buffer.writef64(buf,9,math.abs(n))
			return buf
		end
	end
	--log10s
	if l == 0 then
		e = math.log10(e)
		s = math.sign(e)
		e = math.abs(e)
	else
		s = math.sign(e)
		l -= 1
		e = math.abs(e)
	end
	--div
	if l == 0 then
		local n = e / log10_2
		buffer.writei8(buf,0,s * math.sign(n))
		n = math.abs(n)
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(n))
			return buf
		else
			buffer.writef64(buf,9,n)
			return buf
		end
	elseif l == 1 then
		local a = e - log10_2x2
		buffer.writei8(buf,0,s * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	else
		buffer.writei8(buf,0,s)
		buffer.writef64(buf,1,l)
		buffer.writef64(buf,9,-e)
		return buf
	end
end
--[[
	Logarithm of n in base e (~2.71828)
]]
function gn.ln(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: ln(), Input 1")
	end
	local buf = buffer.create(17)
	--checks
	if s <= 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,-1)
		buffer.writef64(buf,9,1)
		return buf
	elseif l == 0 then
		local n = math.log10(e) / ln_10
		buffer.writei8(buf,0,math.sign(n))
		if math.abs(n) >= 1e10 or math.abs(n) <= 1e-10 then
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(math.abs(n)))
			return buf
		else
			buffer.writef64(buf,9,math.abs(n))
			return buf
		end
	end
	--log10s
	if l == 0 then
		e = math.log10(e)
		s = math.sign(e)
		e = math.abs(e)
	else
		s = math.sign(e)
		l -= 1
		e = math.abs(e)
	end
	--div
	if l == 0 then
		local n = e / ln_10
		buffer.writei8(buf,0,s * math.sign(n))
		n = math.abs(n)
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,math.log10(n))
			return buf
		else
			buffer.writef64(buf,9,n)
			return buf
		end
	elseif l == 1 then
		local a = e - ln_10x2
		buffer.writei8(buf,0,s * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(buf,1,2)
			buffer.writef64(buf,9,math.log10(a))
			return buf
		elseif a < 10 then
			buffer.writef64(buf,9,10 ^ a)
			return buf
		else
			buffer.writef64(buf,1,1)
			buffer.writef64(buf,9,a)
			return buf
		end
	else
		buffer.writei8(buf,0,s)
		buffer.writef64(buf,1,l)
		buffer.writef64(buf,9,-e)
		return buf
	end
end
--[[
	n1↑↑n2 (n2 must be an integer)
	Tetration of n1 and n2
]]
function gn.tetr(n1,n2)
	local s1,l1,e1,s2,l2,e2
	if type(n1) == "buffer" then
		s1 = buffer.readi8(n1,0)
		l1 = buffer.readf64(n1,1)
		e1 = buffer.readf64(n1,9)
	elseif type(n1) == "number" then
		if n1 == 0 then
			s1 = 0
			l1 = 0
			e1 = 0
		elseif n1 == nil then
			s1 = 1
			l1 = -1
			e1 = 1
		else
			s1 = math.sign(n1)
			n1 = math.abs(n1)
			if n1 >= 1e10 or n1 <= 1e-10 then
				l1 = 1
				e1 = math.log10(n1)
			else
				l1 = 0
				e1 = n1
			end
		end
	else
		error("Wrong Type: tetr(), Input 1")
	end
	s2 = s1
	l2 = l1
	e2 = e1
	if type(n2) ~= "number" then
		error("Wrong Type: tetr(), Input 2")
	end
	local buf = buffer.create(17)
	--checks
	if n2 <= 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	elseif n2 == 1 then
		buffer.writei8(buf,0,s1)
		buffer.writef64(buf,1,l1)
		buffer.writef64(buf,9,e1)
		return buf
	elseif s1 == 0 then
		return buf
	elseif (s1 == 1 and l1 == 0 and e1 == 1) or s2 == 0 then
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,9,1)
		return buf
	elseif s2 == 1 and l2 == 0 and e2 == 1 then
		buffer.writei8(buf,0,s1)
		buffer.writef64(buf,1,l1)
		buffer.writef64(buf,9,e1)
		return buf
	end
	--abslog10
	if l1 == 0 then
		e1 = math.log10(e1)
		s1 = math.sign(e1)
		e1 = math.abs(e1)
	else
		s1 = math.sign(e1)
		l1 -= 1
		e1 = math.abs(e1)
	end
	local s,l,e
	for i=1,n2-1 do
		if l1 == 0 and l2 == 0 then
			local n = e1 * e2
			s = s1 * s2 * math.sign(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		elseif l1 == l2 and e1 == -e2 then
			s = s1*s2
			l = 0
			e = 1
		elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
			s = s1*s2
			if l1 > l2 then
				l = l1
				e = e1
			elseif l1 < l2 then
				s2 = 1
				l2 += n2-i
				e2 *= s
				break
			elseif math.abs(e1) > math.abs(e2) then
				l = l1
				e = e1
			else
				s2 = 1
				l2 += n2-i
				e2 *= s
				break
			end
		elseif l1 == 1 and l2 == 1 then
			local a = e1 + e2
			s = s1 * s2 * math.sign(a)
			if a >= 1e10 then
				l = 2
				e = math.log10(a)
			elseif a < 10 then
				l = 0
				e = 10 ^ a
			else
				l = 1
				e = a
			end
		elseif l1 == 1 and l2 == 0 then
			local a = e1 + math.log10(e2)
			s = s1 * s2 * math.sign(a)
			if a >= 1e10 then
				l = 2
				e = math.log10(a)
			elseif a < 10 then
				l = 0
				e = 10 ^ a
			else
				l = 1
				e = a
			end
		elseif l1 == 0 and l2 == 1 then
			local a = math.log10(e1) + e2
			s = s1 * s2 * math.sign(a)
			if a >= 1e10 then
				l = 2
				e = math.log10(a)
			elseif a < 10 then
				l = 0
				e = 10 ^ a
			else
				l = 1
				e = a
			end
		else
			local fe1 = e1
			local fe2 = e2
			if l1 == 1 then
				fe1 = math.sign(e1) * math.log10(math.abs(e1))
			elseif l2 == 1 then
				fe2 = math.sign(e2) * math.log10(math.abs(e2))
			end
			s = s1 * s2
			local e1s = math.sign(fe1)
			local e2s = math.sign(fe2)
			local e1a = math.abs(fe1)
			local e2a = math.abs(fe2)
			if e1a >= e2a then
				local oomdif = e1a - e2a
				if oomdif >= 16 then
					l = l1
					e = e1
				else
					local a = math.abs(e2a + math.log10(math.abs(e2s + e1s * 10 ^ oomdif)))
					if a >= 1e10 then
						l = 3
						e = e1s * math.log10(a)
					elseif a < 10 then
						a = 10 ^ a
						if a < 10 then
							e = e1s * 10 ^ a
						else
							l = 1
							e = e1s * a
						end
					else
						l = 2
						e = e1s * a
					end
				end
			else
				local oomdif = e2a - e1a
				if oomdif >= 16 then
					l = l2
					e = e2
				else
					local a = math.abs(e1a + math.log10(math.abs(e1s + e2s * 10 ^ oomdif)))
					if a >= 1e10 then
						l = 3
						e = e2s * math.log10(a)
					elseif a < 10 then
						a = 10 ^ a
						if a < 10 then
							e = e2s * 10 ^ a
						else
							l = 1
							e = e2s * a
						end
					else
						l = 2
						e = e2s * a
					end
				end
			end
		end
		--pow10
		if l == 0 and e < 10 then
			s2 = 1
			l2 = 0
			e2 = math.pow(10,s*e)
		elseif e < 0 then
			s2 = 1
			l2 = 0
			e2 = 1
		else
			s2 = 1
			l2 = l+1
			e2 = s*e
		end
	end
	buffer.writei8(buf,0,s2)
	buffer.writef64(buf,1,l2)
	buffer.writef64(buf,9,e2)
	return buf
end
--[[
	n1 += n2
	Sets n1 to Sum of n1 and n2
]]
function gn.addeq(n1,n2)
	if type(n1) ~= "buffer" then
		error("Wrong Type: addeq(), Input 1")
	end
	local s1,l1,e1,s2,l2,e2
	s1 = buffer.readi8(n1,0)
	l1 = buffer.readf64(n1,1)
	e1 = buffer.readf64(n1,9)
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: addeq(), Input 2")
	end
	if s1 == 0 then
		buffer.writei8(n1,0,s2)
		buffer.writef64(n1,1,l2)
		buffer.writef64(n1,9,e2)
		return n1
	elseif s2 == 0 then
		return n1
	elseif s1 == -s2 and l1 == l2 and e1 == e2 then
		buffer.writei8(n1,0,0)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,0)
		return n1
	elseif l1 >= 2 or l2 >= 2 then
		local l1s = if e1 > 0 then l1 else -l1
		local l2s = if e2 > 0 then l2 else -l2
		if l1s > l2s then
			return n1
		elseif l1s < l2s then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		elseif e1 > e2 then
			return n1
		else
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		end
	elseif l1 == 0 and l2 == 0 then
		local n = s1 * e1 + s2 * e2
		if n == 0 then
			buffer.writei8(n1,0,0)
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,0)
			return n1
		elseif n == nil or type(n) ~= "number" then
			buffer.writei8(n1,0,1)
			buffer.writef64(n1,1,-1)
			buffer.writef64(n1,9,1)
			return n1
		else
			buffer.writei8(n1,0,math.sign(n))
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				buffer.writef64(n1,1,1)
				buffer.writef64(n1,9,math.log10(n))
				return n1
			else
				buffer.writef64(n1,1,0)
				buffer.writef64(n1,9,n)
				return n1
			end
		end
	elseif l1 == 1 and l2 == 0 then
		local oomdif = e1 - math.log10(e2)
		if math.abs(oomdif) >= 16 then
			return n1
		end
		local n = s2 + s1 * math.pow(10,oomdif)
		buffer.writei8(n1,0,math.sign(n))
		local a = math.log10(e2 * math.abs(n))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif l1 == 0 and l2 == 1 then
		local oomdif = e2 - math.log10(e1)
		if math.abs(oomdif) >= 16 then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		end
		local n = s1 + s2 * math.pow(10,oomdif)
		buffer.writei8(n1,0,math.sign(n))
		local a = math.log10(e1 * math.abs(n))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif e1 >= e2 then
		local oomdif = e1 - e2
		if oomdif >= 16 then
			return n1
		else
			local n = s2 + s1 * 10 ^ oomdif
			buffer.writei8(n1,0,math.sign(n))
			local a = e2 + math.log10(math.abs(n))
			if a >= 1e10 then
				buffer.writef64(n1,1,2)
				buffer.writef64(n1,9,math.log10(a))
				return n1
			elseif a < 10 then
				buffer.writef64(n1,1,0)
				buffer.writef64(n1,9,10 ^ a)
				return n1
			else
				buffer.writef64(n1,1,1)
				buffer.writef64(n1,9,a)
				return n1
			end
		end
	else
		local oomdif = e2 - e1
		if oomdif >= 16 then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		else
			local n = s1 + s2 * 10 ^ oomdif
			buffer.writei8(n1,0,math.sign(n))
			local a = e1 + math.log10(math.abs(n))
			if a >= 1e10 then
				buffer.writef64(n1,1,2)
				buffer.writef64(n1,9,math.log10(a))
				return n1
			elseif a < 10 then
				buffer.writef64(n1,1,0)
				buffer.writef64(n1,9,10 ^ a)
				return n1
			else
				buffer.writef64(n1,1,1)
				buffer.writef64(n1,9,a)
				return n1
			end
		end
	end
end
--[[
	n1 -= n2
	Sets n1 to Difference of n1 and n2
]]
function gn.subeq(n1,n2)
	if type(n1) ~= "buffer" then
		error("Wrong Type: subeq(), Input 1")
	end
	local s1,l1,e1,s2,l2,e2
	s1 = buffer.readi8(n1,0)
	l1 = buffer.readf64(n1,1)
	e1 = buffer.readf64(n1,9)
	if type(n2) == "buffer" then
		s2 = -buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = -math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: subeq(), Input 2")
	end
	if s1 == 0 then
		buffer.writei8(n1,0,s2)
		buffer.writef64(n1,1,l2)
		buffer.writef64(n1,9,e2)
		return n1
	elseif s2 == 0 then
		return n1
	elseif s1 == -s2 and l1 == l2 and e1 == e2 then
		buffer.writei8(n1,0,0)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,0)
		return n1
	elseif l1 >= 2 or l2 >= 2 then
		local l1s = if e1 > 0 then l1 else -l1
		local l2s = if e2 > 0 then l2 else -l2
		if l1s > l2s then
			return n1
		elseif l1s < l2s then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		elseif e1 > e2 then
			return n1
		else
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		end
	elseif l1 == 0 and l2 == 0 then
		local n = s1 * e1 + s2 * e2
		if n == 0 then
			buffer.writei8(n1,0,0)
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,0)
			return n1
		elseif n == nil or type(n) ~= "number" then
			buffer.writei8(n1,0,1)
			buffer.writef64(n1,1,-1)
			buffer.writef64(n1,9,1)
			return n1
		else
			buffer.writei8(n1,0,math.sign(n))
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				buffer.writef64(n1,1,1)
				buffer.writef64(n1,9,math.log10(n))
				return n1
			else
				buffer.writef64(n1,1,0)
				buffer.writef64(n1,9,n)
				return n1
			end
		end
	elseif l1 == 1 and l2 == 0 then
		local oomdif = e1 - math.log10(e2)
		if math.abs(oomdif) >= 16 then
			return n1
		end
		local n = s2 + s1 * math.pow(10,oomdif)
		buffer.writei8(n1,0,math.sign(n))
		local a = math.log10(e2 * math.abs(n))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif l1 == 0 and l2 == 1 then
		local oomdif = e2 - math.log10(e1)
		if math.abs(oomdif) >= 16 then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		end
		local n = s1 + s2 * math.pow(10,oomdif)
		buffer.writei8(n1,0,math.sign(n))
		local a = math.log10(e1 * math.abs(n))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif e1 >= e2 then
		local oomdif = e1 - e2
		if oomdif >= 16 then
			return n1
		else
			local n = s2 + s1 * 10 ^ oomdif
			buffer.writei8(n1,0,math.sign(n))
			local a = e2 + math.log10(math.abs(n))
			if a >= 1e10 then
				buffer.writef64(n1,1,2)
				buffer.writef64(n1,9,math.log10(a))
				return n1
			elseif a < 10 then
				buffer.writef64(n1,1,0)
				buffer.writef64(n1,9,10 ^ a)
				return n1
			else
				buffer.writef64(n1,1,1)
				buffer.writef64(n1,9,a)
				return n1
			end
		end
	else
		local oomdif = e2 - e1
		if oomdif >= 16 then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		else
			local n = s1 + s2 * 10 ^ oomdif
			buffer.writei8(n1,0,math.sign(n))
			local a = e1 + math.log10(math.abs(n))
			if a >= 1e10 then
				buffer.writef64(n1,1,2)
				buffer.writef64(n1,9,math.log10(a))
				return n1
			elseif a < 10 then
				buffer.writef64(n1,1,0)
				buffer.writef64(n1,9,10 ^ a)
				return n1
			else
				buffer.writef64(n1,1,1)
				buffer.writef64(n1,9,a)
				return n1
			end
		end
	end
end
--[[
	n1 *= n2
	Sets n1 to Product of n1 and n2
]]
function gn.muleq(n1,n2)
	if type(n1) ~= "buffer" then
		error("Wrong Type: muleq(), Input 1")
	end
	local s1,l1,e1,s2,l2,e2
	s1 = buffer.readi8(n1,0)
	l1 = buffer.readf64(n1,1)
	e1 = buffer.readf64(n1,9)
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: muleq(), Input 2")
	end
	if s1 == 0 or s2 == 0 then
		return n1
	elseif l1 == 0 and l2 == 0 then
		local n = e1 * e2
		buffer.writei8(n1,0,s1 * s2 * math.sign(n))
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,math.log10(n))
			return n1
		else
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,n)
			return n1
		end
	elseif l1 == l2 and e1 == -e2 then
		buffer.writei8(n1,0,s1*s2)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,1)
		return n1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		if l1 > l2 then
			return n1
		elseif l1 < l2 then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		elseif math.abs(e1) > math.abs(e2) then
			return n1
		else
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 + e2
		buffer.writei8(n1,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 + math.log10(e2)
		buffer.writei8(n1,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) + e2
		buffer.writei8(n1,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		buffer.writei8(n1,0,s1 * s2)
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				buffer.writef64(n1,1,l1)
				buffer.writef64(n1,9,e1)
				return n1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s + e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(n1,1,3)
					buffer.writef64(n1,9,e1s * math.log10(a))
					return n1
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(n1,1,0)
						buffer.writef64(n1,9,e1s * 10 ^ a)
						return n1
					end
					buffer.writef64(n1,1,1)
					buffer.writef64(n1,9,e1s * a)
					return n1
				else
					buffer.writef64(n1,1,2)
					buffer.writef64(n1,9,e1s * a)
					return n1
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				buffer.writef64(n1,1,l2)
				buffer.writef64(n1,9,e2)
				return n1
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s + e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(n1,1,3)
					buffer.writef64(n1,9,e2s * math.log10(a))
					return n1
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(n1,1,0)
						buffer.writef64(n1,9,e2s * 10 ^ a)
						return n1
					end
					buffer.writef64(n1,1,1)
					buffer.writef64(n1,9,e2s * a)
					return n1
				else
					buffer.writef64(n1,1,2)
					buffer.writef64(n1,9,e2s * a)
					return n1
				end
			end
		end
	end
end
--[[
	n1 /= n2
	Sets n1 to Quotient of n1 and n2
]]
function gn.diveq(n1,n2)
	if type(n1) ~= "buffer" then
		error("Wrong Type: diveq(), Input 1")
	end
	local s1,l1,e1,s2,l2,e2
	s1 = buffer.readi8(n1,0)
	l1 = buffer.readf64(n1,1)
	e1 = buffer.readf64(n1,9)
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: diveq(), Input 2")
	end
	if s1 == 0 or s2 == 0 then
		return n1
	elseif l1 == 0 and l2 == 0 then
		local n = e1 / e2
		buffer.writei8(n1,0,s1 * s2 * math.sign(n))
		n = math.abs(n)
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,math.log10(n))
			return n1
		else
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,n)
			return n1
		end
	elseif l1 == l2 and e1 == e2 then
		buffer.writei8(n1,0,s1*s2)
		buffer.writef64(n1,9,1)
		return n1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		if l1 > l2 then
			return n1
		elseif l1 < l2 then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,-e2)
			return n1
		elseif math.abs(e1) > math.abs(e2) then
			return n1
		else
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,-e2)
			return n1
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 - e2
		buffer.writei8(n1,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 - math.log10(e2)
		buffer.writei8(n1,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) - e2
		buffer.writei8(n1,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		buffer.writei8(n1,0,s1 * s2)
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				buffer.writef64(n1,1,l1)
				buffer.writef64(n1,9,e1)
				return n1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s - e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(n1,1,3)
					buffer.writef64(n1,9,e1s * math.log10(a))
					return n1
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(n1,1,0)
						buffer.writef64(n1,9,e1s * 10 ^ a)
						return n1
					end
					buffer.writef64(n1,1,1)
					buffer.writef64(n1,9,e1s * a)
					return n1
				else
					buffer.writef64(n1,1,2)
					buffer.writef64(n1,9,e1s * a)
					return n1
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				buffer.writef64(n1,1,l2)
				buffer.writef64(n1,9,-e2)
				return n1
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s - e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(n1,1,3)
					buffer.writef64(n1,9,e2s * math.log10(a))
					return n1
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(n1,1,0)
						buffer.writef64(n1,9,e2s * 10 ^ a)
						return n1
					end
					buffer.writef64(n1,1,1)
					buffer.writef64(n1,9,e2s * a)
					return n1
				else
					buffer.writef64(n1,1,2)
					buffer.writef64(n1,9,e2s * a)
					return n1
				end
			end
		end
	end
end
--[[
	n1 //= n2 (similar to floor(n1 / n2))
	Sets n1 to Integer Quotient of n1 and n2
]]
function gn.intdiveq(n1,n2)
	if type(n1) ~= "buffer" then
		error("Wrong Type: intdiveq(), Input 1")
	end
	local s1,l1,e1,s2,l2,e2
	s1 = buffer.readi8(n1,0)
	l1 = buffer.readf64(n1,1)
	e1 = buffer.readf64(n1,9)
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: intdiveq(), Input 2")
	end
	local s,l,e
	if s1 == 0 or s2 == 0 then
		s = 0
		l = 0
		e = 0
	elseif l1 == 0 and l2 == 0 then
		local n = e1 / e2
		s = s1 * s2 * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l1 == l2 and e1 == e2 then
		s = s1*s2
		l = 0
		e = 1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		s = s1*s2
		if l1 > l2 then
			l = l1
			e = e1
		elseif l1 < l2 then
			l = l2
			e = -e2
		elseif math.abs(e1) > math.abs(e2) then
			l = l1
			e = e1
		else
			l = l2
			e = -e2
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 - e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 - math.log10(e2)
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) - e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		s = s1 * s2
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				l = l1
				e = e1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s - e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e1s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e1s * 10 ^ a
					else
						l = 1
						e = e1s * a
					end
				else
					l = 2
					e = e1s * a
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				l = l2
				e = e2
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s - e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e2s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e2s * 10 ^ a
					else
						l = 1
						e = e2s * a
					end
				else
					l = 2
					e = e2s * a
				end
			end
		end
	end
	if s == 0 then
		buffer.writei8(n1,0,0)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,0)
		return n1
	elseif s == 1 then
		if l == 0 then
			buffer.writei8(n1,0,1)
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,math.floor(e))
			return n1
		elseif e < 0 then
			buffer.writei8(n1,0,0)
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,0)
			return n1
		elseif l == 1 and e <= l1_THRESHOLD then
			buffer.writei8(n1,0,1)
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,math.log10(math.floor(10^e)))
			return n1
		else
			buffer.writei8(n1,0,1)
			buffer.writef64(n1,1,l)
			buffer.writef64(n1,9,e)
			return n1
		end
	elseif l == 0 then
		buffer.writei8(n1,0,-1)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,math.ceil(e))
		return n1
	elseif e < 0 then
		buffer.writei8(n1,0,-1)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,1)
		return n1
	elseif l == 1 and e <= l1_THRESHOLD then
		buffer.writei8(n1,0,-1)
		buffer.writef64(n1,1,1)
		buffer.writef64(n1,9,math.log10(math.ceil(10^e)))
		return n1
	else
		buffer.writei8(n1,0,-1)
		buffer.writef64(n1,1,l)
		buffer.writef64(n1,9,e)
		return n1
	end
end
--[[
	n1 ^= n2
	Sets n1 to Exponentiation of n1 and n2
]]
function gn.poweq(n1,n2)
	if type(n1) ~= "buffer" then
		error("Wrong Type: poweq(), Input 1")
	end
	local s1,l1,e1,s2,l2,e2
	s1 = buffer.readi8(n1,0)
	l1 = buffer.readf64(n1,1)
	e1 = buffer.readf64(n1,9)
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: poweq(), Input 2")
	end
	--checks
	if s1 == 0 then
		return n1
	elseif (s1 == 1 and l1 == 0 and e1 == 1) then
		return n1
	elseif s2 == 0 then
		buffer.writei8(n1,0,1)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,1)
		return n1
	elseif s2 == 1 and l2 == 0 and e2 == 1 then
		return n1
	end
	--abslog10
	if l1 == 0 then
		e1 = math.log10(e1)
		s1 = math.sign(e1)
		e1 = math.abs(e1)
	else
		s1 = math.sign(e1)
		l1 -= 1
		e1 = math.abs(e1)
	end
	--mul
	local s,l,e
	if l1 == 0 and l2 == 0 then
		local n = e1 * e2
		s = s1 * s2 * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l1 == l2 and e1 == -e2 then
		s = s1*s2
		l = 0
		e = 1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		s = s1*s2
		if l1 > l2 then
			l = l1
			e = e1
		elseif l1 < l2 then
			l = l2
			e = e2
		elseif math.abs(e1) > math.abs(e2) then
			l = l1
			e = e1
		else
			l = l2
			e = e2
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 + e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 + math.log10(e2)
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) + e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		s = s1 * s2
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				l = l1
				e = e1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s + e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e1s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e1s * 10 ^ a
					else
						l = 1
						e = e1s * a
					end
				else
					l = 2
					e = e1s * a
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				l = l2
				e = e2
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s + e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e2s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e2s * 10 ^ a
					else
						l = 1
						e = e2s * a
					end
				else
					l = 2
					e = e2s * a
				end
			end
		end
	end
	--pow10
	if l == 0 and e < 10 then
		buffer.writei8(n1,0,1)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,math.pow(10,s*e))
		return n1
	elseif e < 0 then
		buffer.writei8(n1,0,1)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,1)
		return n1
	else
		buffer.writei8(n1,0,1)
		buffer.writef64(n1,1,l+1)
		buffer.writef64(n1,9,s*e)
		return n1
	end
end
--[[
	n1 ^= n2
	Sets n1 to Exponentiation of n1 and n2
]]
function gn.rooteq(n1,n2)
	if type(n1) ~= "buffer" then
		error("Wrong Type: rooteq(), Input 1")
	end
	local s1,l1,e1,s2,l2,e2
	s1 = buffer.readi8(n1,0)
	l1 = buffer.readf64(n1,1)
	e1 = buffer.readf64(n1,9)
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: rooteq(), Input 2")
	end
	--checks
	if s1 == 0 then
		return n1
	elseif (s1 == 1 and l1 == 0 and e1 == 1) then
		return n1
	elseif s2 == 0 then
		buffer.writei8(n1,0,1)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,1)
		return n1
	elseif s2 == 1 and l2 == 0 and e2 == 1 then
		return n1
	end
	--abslog10
	if l1 == 0 then
		e1 = math.log10(e1)
		s1 = math.sign(e1)
		e1 = math.abs(e1)
	else
		s1 = math.sign(e1)
		l1 -= 1
		e1 = math.abs(e1)
	end
	--div
	local s,l,e
	if l1 == 0 and l2 == 0 then
		local n = e1 / e2
		s = s1 * s2 * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l1 == l2 and e1 == e2 then
		s = s1*s2
		l = 0
		e = 1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		s = s1*s2
		if l1 > l2 then
			l = l1
			e = e1
		elseif l1 < l2 then
			l = l2
			e = -e2
		elseif math.abs(e1) > math.abs(e2) then
			l = l1
			e = e1
		else
			l = l2
			e = -e2
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 - e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 - math.log10(e2)
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) - e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		s = s1 * s2
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				l = l1
				e = e1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s - e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e1s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e1s * 10 ^ a
					else
						l = 1
						e = e1s * a
					end
				else
					l = 2
					e = e1s * a
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				l = l2
				e = e2
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s - e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e2s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e2s * 10 ^ a
					else
						l = 1
						e = e2s * a
					end
				else
					l = 2
					e = e2s * a
				end
			end
		end
	end
	--pow10
	if l == 0 and e < 10 then
		buffer.writei8(n1,0,1)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,math.pow(10,s*e))
		return n1
	elseif e < 0 then
		buffer.writei8(n1,0,1)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,1)
		return n1
	else
		buffer.writei8(n1,0,1)
		buffer.writef64(n1,1,l+1)
		buffer.writef64(n1,9,s*e)
		return n1
	end
end
--[[
	n ^= 0.5
	Sets n to Square Root of n
]]
function gn.sqrteq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: sqrteq(), Input 1")
	end
	local s = buffer.readi8(n,0)
	local l = buffer.readf64(n,1)
	local e = buffer.readf64(n,9)
	--checks
	if s == 0 or (s == 1 and l == 0 and e == 1) then
		return n
	end
	--abslog10
	if l == 0 then
		e = math.log10(e)
		s = math.sign(e)
		e = math.abs(e)
	else
		s = math.sign(e)
		l -= 1
		e = math.abs(e)
	end
	--div
	if l == 0 then
		local n = e / 2
		s = s * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l == 1 then
		local a = e - log10_2
		s = s * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	end
	--pow10
	if l == 0 and e < 10 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,math.pow(10,s*e))
		return n
	elseif e < 0 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,1)
		return n
	else
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,l+1)
		buffer.writef64(n,9,s*e)
		return n
	end
end
--[[
	n = 2 ^ n
	Sets n to Exponentiation of 2 and n
]]
function gn.pow2eq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: pow2eq(), Input 1")
	end
	local s = buffer.readi8(n,0)
	local l = buffer.readf64(n,1)
	local e = buffer.readf64(n,9)
	--checks
	if s == 0 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,9,1)
		return n
	elseif s == 1 and l == 0 and e == 1 then
		buffer.writef64(n,9,2)
		return n
	end
	--mul
	if l == 0 then
		local n = log10_2 * e
		s = s * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l == 1 then
		local a = e + log10_2x2
		s = s * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	end
	--pow10
	if l == 0 and e < 10 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,math.pow(10,s*e))
		return n
	elseif e < 0 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,1)
		return n
	else
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,l+1)
		buffer.writef64(n,9,s*e)
		return n
	end
end
--[[
	n = e ^ n
	Sets n to Exponentiation of e and n (e = ~2.71828)
]]
function gn.expeq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: expeq(), Input 1")
	end
	local s = buffer.readi8(n,0)
	local l = buffer.readf64(n,1)
	local e = buffer.readf64(n,9)
	--checks
	if s == 0 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,9,1)
		return n
	elseif s == 1 and l == 0 and e == 1 then
		buffer.writef64(n,9,euler)
		return n
	end
	--mul
	if l == 0 then
		local n = ln_10 * e
		s = s * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l == 1 then
		local a = e + ln_10x2
		s = s * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	end
	--pow10
	if l == 0 and e < 10 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,math.pow(10,s*e))
		return n
	elseif e < 0 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,1)
		return n
	else
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,l+1)
		buffer.writef64(n,9,s*e)
		return n
	end
end
--[[
	n = 10 ^ n
	Sets n to Exponentiation of 10 and n
]]
function gn.pow10eq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: pow10eq(), Input 1")
	end
	local s = buffer.readi8(n,0)
	local l = buffer.readf64(n,1)
	local e = buffer.readf64(n,9)
	if l == 0 and e < 10 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,10^(s*e))
		return n
	elseif e < 0 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,1)
		return n
	else
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,l+1)
		buffer.writef64(n,9,s*e)
		return n
	end
end
--[[
	n = log10(n)
	Sets n to Logarithm of n in base 10
]]
function gn.log10eq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: log10eq(), Input 1")
	end
	local s = buffer.readi8(n,0)
	local l = buffer.readf64(n,1)
	local e = buffer.readf64(n,9)
	if s <= 0 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,-1)
		buffer.writef64(n,9,1)
		return n
	elseif l == 0 then
		buffer.writef64(n,9,math.log10(e))
		buffer.writei8(n,0,math.sign(buffer.readf64(n,9)))
		buffer.writef64(n,9,math.abs(buffer.readf64(n,9)))
		return n
	else
		buffer.writei8(n,0,math.sign(e))
		buffer.writef64(n,1,l-1)
		buffer.writef64(n,9,math.abs(e))
		return n
	end
end
--[[
	n = log10(|n|)
	Sets n to Logarithm of the Absolute Value of n in base 10
]]
function gn.abslog10eq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: abslog10eq(), Input 1")
	end
	local s = buffer.readi8(n,0)
	local l = buffer.readf64(n,1)
	local e = buffer.readf64(n,9)
	if s <= 0 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,-1)
		buffer.writef64(n,9,1)
		return n
	elseif l == 0 then
		buffer.writef64(n,9,math.log10(e))
		buffer.writei8(n,0,math.sign(buffer.readf64(n,9)))
		buffer.writef64(n,9,math.abs(buffer.readf64(n,9)))
		return n
	else
		buffer.writei8(n,0,math.sign(e))
		buffer.writef64(n,1,l-1)
		buffer.writef64(n,9,math.abs(e))
		return n
	end
end
--[[
	Sets n to Logarithm of n in base 2
]]
function gn.log2eq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: log2eq(), Input 1")
	end
	local s = buffer.readi8(n,0)
	local l = buffer.readf64(n,1)
	local e = buffer.readf64(n,9)
	--checks
	if s <= 0 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,-1)
		buffer.writef64(n,9,1)
		return n
	elseif l == 0 then
		local n = math.log10(e) / log10_2
		buffer.writei8(n,0,math.sign(n))
		if math.abs(n) >= 1e10 or math.abs(n) <= 1e-10 then
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,math.log10(math.abs(n)))
			return n
		else
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,math.abs(n))
			return n
		end
	end
	--log10s
	if l == 0 then
		e = math.log10(e)
		s = math.sign(e)
		e = math.abs(e)
	else
		s = math.sign(e)
		l -= 1
		e = math.abs(e)
	end
	--div
	if l == 0 then
		local n = e / log10_2
		buffer.writei8(n,0,s * math.sign(n))
		n = math.abs(n)
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,math.log10(n))
			return n
		else
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,n)
			return n
		end
	elseif l == 1 then
		local a = e - log10_2x2
		buffer.writei8(n,0,s * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n,1,2)
			buffer.writef64(n,9,math.log10(a))
			return n
		elseif a < 10 then
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,10 ^ a)
			return n
		else
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,a)
			return n
		end
	else
		buffer.writei8(n,0,s)
		buffer.writef64(n,1,l)
		buffer.writef64(n,9,-e)
		return n
	end
end
--[[
	Sets n to Logarithm of n in base e (~2.71828)
]]
function gn.lneq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: lneq(), Input 1")
	end
	local s = buffer.readi8(n,0)
	local l = buffer.readf64(n,1)
	local e = buffer.readf64(n,9)
	--checks
	if s <= 0 then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,-1)
		buffer.writef64(n,9,1)
		return n
	elseif l == 0 then
		local n = math.log10(e) / ln_10
		buffer.writei8(n,0,math.sign(n))
		if math.abs(n) >= 1e10 or math.abs(n) <= 1e-10 then
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,math.log10(math.abs(n)))
			return n
		else
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,math.abs(n))
			return n
		end
	end
	--log10s
	if l == 0 then
		e = math.log10(e)
		s = math.sign(e)
		e = math.abs(e)
	else
		s = math.sign(e)
		l -= 1
		e = math.abs(e)
	end
	--div
	if l == 0 then
		local n = e / ln_10
		buffer.writei8(n,0,s * math.sign(n))
		n = math.abs(n)
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,math.log10(n))
			return n
		else
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,n)
			return n
		end
	elseif l == 1 then
		local a = e - ln_10x2
		buffer.writei8(n,0,s * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n,1,2)
			buffer.writef64(n,9,math.log10(a))
			return n
		elseif a < 10 then
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,10 ^ a)
			return n
		else
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,a)
			return n
		end
	else
		buffer.writei8(n,0,s)
		buffer.writef64(n,1,l)
		buffer.writef64(n,9,-e)
		return n
	end
end
--[[
	Sets n1 to Logarithm of n1 in base n2
]]
function gn.logeq(n1,n2)
	if type(n1) ~= "buffer" then
		error("Wrong Type: logeq(), Input 1")
	end
	local s1,l1,e1,s2,l2,e2
	s1 = buffer.readi8(n1,0)
	l1 = buffer.readf64(n1,1)
	e1 = buffer.readf64(n1,9)
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: logeq(), Input 2")
	end
	--checks
	if s1 <= 0 or s2 <= 0 then
		buffer.writei8(n1,0,1)
		buffer.writef64(n1,1,-1)
		buffer.writef64(n1,9,1)
		return n1
	elseif l1 == 0 and l2 == 0 then
		local n = math.log10(e1) / math.log10(e2)
		buffer.writei8(n1,0,math.sign(n))
		if math.abs(n) >= 1e10 or math.abs(n) <= 1e-10 then
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,math.log10(math.abs(n)))
			return n1
		else
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,math.abs(n))
			return n1
		end
	end
	--log10s
	if l1 == 0 then
		e1 = math.log10(e1)
		s1 = math.sign(e1)
		e1 = math.abs(e1)
	else
		s1 = math.sign(e1)
		l1 -= 1
		e1 = math.abs(e1)
	end
	if l2 == 0 then
		e2 = math.log10(e2)
		s2 = math.sign(e2)
		e2 = math.abs(e2)
	else
		s2 = math.sign(e2)
		l2 -= 1
		e2 = math.abs(e2)
	end
	--div
	if l1 == 0 and l2 == 0 then
		local n = e1 / e2
		buffer.writei8(n1,0,s1 * s2 * math.sign(n))
		n = math.abs(n)
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,math.log10(n))
			return n1
		else
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,n)
			return n1
		end
	elseif l1 == l2 and e1 == e2 then
		buffer.writei8(n1,0,s1*s2)
		buffer.writef64(n1,9,1)
		return n1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		if l1 > l2 then
			buffer.writei8(n1,0,s1)
			buffer.writef64(n1,1,l1)
			buffer.writef64(n1,9,e1)
			return n1
		elseif l1 < l2 then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,-e2)
			return n1
		elseif math.abs(e1) > math.abs(e2) then
			buffer.writei8(n1,0,s1)
			buffer.writef64(n1,1,l1)
			buffer.writef64(n1,9,e1)
			return n1
		else
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,-e2)
			return n1
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 - e2
		buffer.writei8(n1,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 - math.log10(e2)
		buffer.writei8(n1,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) - e2
		buffer.writei8(n1,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		buffer.writei8(n1,0,s1 * s2)
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				buffer.writef64(n1,1,l1)
				buffer.writef64(n1,9,e1)
				return n1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s - e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(n1,1,3)
					buffer.writef64(n1,9,e1s * math.log10(a))
					return n1
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(n1,1,0)
						buffer.writef64(n1,9,e1s * 10 ^ a)
						return n1
					end
					buffer.writef64(n1,1,1)
					buffer.writef64(n1,9,e1s * a)
					return n1
				else
					buffer.writef64(n1,1,2)
					buffer.writef64(n1,9,e1s * a)
					return n1
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				buffer.writef64(n1,1,l2)
				buffer.writef64(n1,9,-e2)
				return n1
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s - e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(n1,1,3)
					buffer.writef64(n1,9,e2s * math.log10(a))
					return n1
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(n1,1,0)
						buffer.writef64(n1,9,e2s * 10 ^ a)
						return n1
					end
					buffer.writef64(n1,1,1)
					buffer.writef64(n1,9,e2s * a)
					return n1
				else
					buffer.writef64(n1,1,2)
					buffer.writef64(n1,9,e2s * a)
					return n1
				end
			end
		end
	end
end
--[[
	n1 %= n2
	Sets n1 to Modulus of n1 and n2
]]
function gn.modeq(n1,n2)
	if type(n1) ~= "buffer" then
		error("Wrong Type: modeq(), Input 1")
	end
	local s1,l1,e1,s2,l2,e2
	s1 = buffer.readi8(n1,0)
	l1 = buffer.readf64(n1,1)
	e1 = buffer.readf64(n1,9)
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = buffer.readf64(n2,9)
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = math.log10(n2)
			else
				l2 = 0
				e2 = n2
			end
		end
	else
		error("Wrong Type: modeq(), Input 2")
	end
	local s,l,e
	if s1 == 0 or s2 == 0 then
		s = 0
		l = 0
		e = 0
	elseif l1 == 0 and l2 == 0 then
		local n = e1 / e2
		s = s1 * s2 * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l1 == l2 and e1 == e2 then
		s = s1*s2
		l = 0
		e = 1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		s = s1*s2
		if l1 > l2 then
			l = l1
			e = e1
		elseif l1 < l2 then
			l = l2
			e = -e2
		elseif math.abs(e1) > math.abs(e2) then
			l = l1
			e = e1
		else
			l = l2
			e = -e2
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 - e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 - math.log10(e2)
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) - e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		s = s1 * s2
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				l = l1
				e = e1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s - e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e1s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e1s * 10 ^ a
					else
						l = 1
						e = e1s * a
					end
				else
					l = 2
					e = e1s * a
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				l = l2
				e = e2
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s - e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e2s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e2s * 10 ^ a
					else
						l = 1
						e = e2s * a
					end
				else
					l = 2
					e = e2s * a
				end
			end
		end
	end
	if s == 0 then
		s = 0
		l = 0
		e = 0
	elseif s == 1 then
		if l == 0 then
			s = 1
			l = 0
			e = math.floor(e)
		elseif e < 0 then
			s = 0
			l = 0
			e = 0
		elseif l == 1 and e <= l1_THRESHOLD then
			s = 1
			l = 1
			e = math.log10(math.floor(10^e))
		end
	elseif l == 0 then
		s = -1
		l = 0
		e = math.ceil(e)
	elseif e < 0 then
		s = -1
		l = 0
		e = 1
	elseif l == 1 and e <= l1_THRESHOLD then
		s = -1
		l = 1
		e = math.log10(math.ceil(10^e))
	end
	local s3,l3,e3 = s1,l1,e1
	s1 = s
	l1 = l
	e1 = e
	if l1 == 0 and l2 == 0 then
		local n = e1 * e2
		s = s1 * s2 * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l1 == l2 and e1 == -e2 then
		s = s1*s2
		l = 0
		e = 1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		s = s1*s2
		if l1 > l2 then
			l = l1
			e = e1
		elseif l1 < l2 then
			l = l2
			e = e2
		elseif math.abs(e1) > math.abs(e2) then
			l = l1
			e = e1
		else
			l = l2
			e = e2
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 + e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 + math.log10(e2)
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) + e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		s = s1 * s2
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				l = l1
				e = e1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s + e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e1s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e1s * 10 ^ a
					else
						l = 1
						e = e1s * a
					end
				else
					l = 2
					e = e1s * a
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				l = l2
				e = e2
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s + e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e2s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e2s * 10 ^ a
					else
						l = 1
						e = e2s * a
					end
				else
					l = 2
					e = e2s * a
				end
			end
		end
	end
	s1 = s3
	l1 = l3
	e1 = e3
	s2 = -s
	l2 = l
	e2 = e
	if s1 == 0 then
		buffer.writei8(n1,0,s2)
		buffer.writef64(n1,1,l2)
		buffer.writef64(n1,9,e2)
		return n1
	elseif s2 == 0 then
		buffer.writei8(n1,0,s1)
		buffer.writef64(n1,1,l1)
		buffer.writef64(n1,9,e1)
		return n1
	elseif s1 == -s2 and l1 == l2 and e1 == e2 then
		return n1
	elseif l1 >= 2 or l2 >= 2 then
		local l1s = if e1 > 0 then l1 else -l1
		local l2s = if e2 > 0 then l2 else -l2
		if l1s > l2s then
			buffer.writei8(n1,0,s1)
			buffer.writef64(n1,1,l1)
			buffer.writef64(n1,9,e1)
			return n1
		elseif l1s < l2s then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		elseif e1 > e2 then
			buffer.writei8(n1,0,s1)
			buffer.writef64(n1,1,l1)
			buffer.writef64(n1,9,e1)
			return n1
		else
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		end
	elseif l1 == 0 and l2 == 0 then
		local n = s1 * e1 + s2 * e2
		if n == 0 then
			return n1
		elseif n == nil or type(n) ~= "number" then
			buffer.writei8(n1,0,1)
			buffer.writef64(n1,1,-1)
			buffer.writef64(n1,9,1)
			return n1
		else
			buffer.writei8(n1,0,math.sign(n))
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				buffer.writef64(n1,1,1)
				buffer.writef64(n1,9,math.log10(n))
				return n1
			else
				buffer.writef64(n1,1,0)
				buffer.writef64(n1,9,n)
				return n1
			end
		end
	elseif l1 == 1 and l2 == 0 then
		local oomdif = e1 - math.log10(e2)
		if math.abs(oomdif) >= 16 then
			buffer.writei8(n1,0,s1)
			buffer.writef64(n1,1,l1)
			buffer.writef64(n1,9,e1)
			return n1
		end
		local n = s2 + s1 * math.pow(10,oomdif)
		buffer.writei8(n1,0,math.sign(n))
		local a = math.log10(e2 * math.abs(n))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif l1 == 0 and l2 == 1 then
		local oomdif = e2 - math.log10(e1)
		if math.abs(oomdif) >= 16 then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		end
		local n = s1 + s2 * math.pow(10,oomdif)
		buffer.writei8(n1,0,math.sign(n))
		local a = math.log10(e1 * math.abs(n))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif e1 >= e2 then
		local oomdif = e1 - e2
		if oomdif >= 16 then
			buffer.writei8(n1,0,s1)
			buffer.writef64(n1,1,l1)
			buffer.writef64(n1,9,e1)
			return n1
		else
			local n = s2 + s1 * 10 ^ oomdif
			buffer.writei8(n1,0,math.sign(n))
			local a = e2 + math.log10(math.abs(n))
			if a >= 1e10 then
				buffer.writef64(n1,1,2)
				buffer.writef64(n1,9,math.log10(a))
				return n1
			elseif a < 10 then
				buffer.writef64(n1,1,0)
				buffer.writef64(n1,9,10 ^ a)
				return n1
			else
				buffer.writef64(n1,1,1)
				buffer.writef64(n1,9,a)
				return n1
			end
		end
	else
		local oomdif = e2 - e1
		if oomdif >= 16 then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,e2)
			return n1
		else
			local n = s1 + s2 * 10 ^ oomdif
			buffer.writei8(n1,0,math.sign(n))
			local a = e1 + math.log10(math.abs(n))
			if a >= 1e10 then
				buffer.writef64(n1,1,2)
				buffer.writef64(n1,9,math.log10(a))
				return n1
			elseif a < 10 then
				buffer.writef64(n1,1,0)
				buffer.writef64(n1,9,10 ^ a)
				return n1
			else
				buffer.writef64(n1,1,1)
				buffer.writef64(n1,9,a)
				return n1
			end
		end
	end
end
--[[
	Sets n to a new gammanum from s,l,e
]]
function gn.set(n,s,l,e)
	if type(n) ~= "buffer" then
		error("Wrong Type: set(), Input 1")
	end
	s = math.sign(s)
	l = math.floor(l)
	if l < 0 then 
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,-1)
		buffer.writef64(n,9,1)
		return n
	elseif l == math.huge or math.abs(e) == math.huge then 
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,math.huge)
		buffer.writef64(n,9,1)
		return n
	elseif s == 0 or (l == 0 and e == 0) then 
		buffer.writei8(n,0,0)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,0)
		return n
	elseif l == 0 then
		if e < 0  then
			e = -e
			s = -s
		end
		buffer.writei8(n,0,s)
		if e <= 1e-10 or e >= 1e10 then
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,math.log10(e))
			return n
		else
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,e)
			return n
		end
	elseif math.abs(e) >= 1e10 then
		buffer.writei8(n,0,s)
		buffer.writef64(n,1,l+1)
		buffer.writef64(n,9,math.sign(e)*math.log10(math.abs(e)))
		return n
	elseif l == 1 and math.abs(e) < 10 then
		buffer.writei8(n,0,s)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,math.pow(10,e))
		return n
	elseif math.abs(e) < 1 then
		if l >= 3 then
			buffer.writei8(n,0,s)
			buffer.writef64(n,1,l-2)
			e = math.sign(e) * math.pow(10, math.abs(e))
			buffer.writef64(n,9,math.sign(e)*math.pow(10,math.abs(e)))
			return n
		else
			buffer.writei8(n,0,s)
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,math.pow(10,math.sign(e) * math.pow(10, math.abs(e))))
			return n
		end
	elseif math.abs(e) < 10 then
		buffer.writei8(n,0,s)
		buffer.writef64(n,1,l-1)
		buffer.writef64(n,9,math.sign(e)*math.pow(10,math.abs(e)))
		return n
	else
		buffer.writei8(n,0,s)
		buffer.writef64(n,1,l)
		buffer.writef64(n,9,e)
		return n
	end
end
--[[
	Sets n to a new gammanum from number
]]
function gn.setFromNumber(n,number)
	if type(n) ~= "buffer" then
		error("Wrong Type: setFromNumber(), Input 1")
	end
	if n == 0 then
		buffer.writei8(n,0,0)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,0)
		return n
	elseif number == nil or type(number) ~= "number" then
		buffer.writei8(n,0,1)
		buffer.writef64(n,1,-1)
		buffer.writef64(n,9,1)
		return n
	else
		buffer.writei8(n,0,math.sign(number))
		number = math.abs(number)
		if number >= 1e10 or number <= 1e-10 then
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,buffer.readi8(n,0)*math.log10(number))
			return n
		else
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,number)
			return n
		end
	end
end
--[[
	Sets n1 to n2
]]
function gn.copy(n1,n2)
	if type(n1) ~= "buffer" then
		error("Wrong Type: copy(), Input 1")
	end
	if type(n2) ~= "buffer" then
		error("Wrong Type: copy(), Input 2")
	end
	buffer.copy(n1,0,n2,0)
	return n1
end
--[[
	Sets n to Greatest integer less than n
]]
function gn.flooreq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: flooreq(), Input 1")
	end
	local s,l,e
	s = buffer.readi8(n,0)
	l = buffer.readf64(n,1)
	e = buffer.readf64(n,9)
	if s == 0 then
		return n
	elseif s == 1 then
		if l == 0 then
			local rou = math.floor(e)
			if rou == 0 then
				buffer.writei8(n,0,0)
				buffer.writef64(n,1,0)
				buffer.writef64(n,9,0)
				return n
			else
				buffer.writei8(n,0,1)
				buffer.writef64(n,1,0)
				buffer.writef64(n,9,rou)
				return n
			end
		elseif e < 0 then
			buffer.writei8(n,0,0)
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,0)
			return n
		elseif l == 1 and e <= l1_THRESHOLD then
			buffer.writei8(n,0,1)
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,math.log10(math.floor(10^e)))
			return n
		else
			buffer.writei8(n,0,1)
			buffer.writef64(n,1,l)
			buffer.writef64(n,9,e)
			return n
		end
	elseif l == 0 then
		buffer.writei8(n,0,-1)
		local rou = math.ceil(e)
		if rou == 1e10 then
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,10)
			return n
		else
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,rou)
			return n
		end
	elseif e < 0 then
		buffer.writei8(n,0,-1)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,1)
		return n
	elseif l == 1 and e <= l1_THRESHOLD then
		buffer.writei8(n,0,-1)
		buffer.writef64(n,1,1)
		buffer.writef64(n,9,math.log10(math.ceil(10^e)))
		return n
	else
		buffer.writei8(n,0,-1)
		buffer.writef64(n,1,l)
		buffer.writef64(n,9,e)
		return n
	end
end
--[[
	Sets n to Least integer greater than n
]]
function gn.ceileq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: ceileq(), Input 1")
	end
	local s,l,e
	s = buffer.readi8(n,0)
	l = buffer.readf64(n,1)
	e = buffer.readf64(n,9)
	if s == 0 then
		return n
	elseif s == 1 then
		if l == 0 then
			buffer.writei8(n,0,1)
			local rou = math.ceil(e)
			if rou == 1e10 then
				buffer.writef64(n,1,1)
				buffer.writef64(n,9,10)
				return n
			else
				buffer.writef64(n,1,0)
				buffer.writef64(n,9,rou)
				return n
			end
		elseif e < 0 then
			buffer.writei8(n,0,1)
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,1)
			return n
		elseif l == 1 and e <= l1_THRESHOLD then
			buffer.writei8(n,0,1)
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,math.log10(math.ceil(10^e)))
			return n
		else
			buffer.writei8(n,0,1)
			buffer.writef64(n,1,l)
			buffer.writef64(n,9,e)
			return n
		end
	elseif l == 0 then
		local rou = math.floor(e)
		if rou == 0 then
			buffer.writei8(n,0,0)
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,0)
			return n
		else
			buffer.writei8(n,0,-1)
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,rou)
			return n
		end
	elseif e < 0 then
		buffer.writei8(n,0,0)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,0)
		return n
	elseif l == 1 and e <= l1_THRESHOLD then
		buffer.writei8(n,0,-1)
		buffer.writef64(n,1,1)
		buffer.writef64(n,9,math.log10(math.floor(10^e)))
		return n
	else
		buffer.writei8(n,0,-1)
		buffer.writef64(n,1,l)
		buffer.writef64(n,9,e)
		return n
	end
end
--[[
	Sets n to Closest integer to n
]]
function gn.roundeq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: roundeq(), Input 1")
	end
	local s,l,e
	s = buffer.readi8(n,0)
	l = buffer.readf64(n,1)
	e = buffer.readf64(n,9)
	if s == 0 then
		return n
	elseif s == 1 then
		if l == 0 then
			local rou = math.round(e)
			if rou == 0 then
				buffer.writei8(n,0,0)
				buffer.writef64(n,1,0)
				buffer.writef64(n,9,0)
				return n
			elseif rou == 1e10 then
				buffer.writei8(n,0,1)
				buffer.writef64(n,1,1)
				buffer.writef64(n,9,10)
				return n
			else
				buffer.writei8(n,0,1)
				buffer.writef64(n,1,0)
				buffer.writef64(n,9,rou)
				return n
			end
		elseif e < 0 then
			buffer.writei8(n,0,0)
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,0)
			return n
		elseif l == 1 and e <= l1_THRESHOLD then
			buffer.writei8(n,0,1)
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,math.log10(math.round(10^e)))
			return n
		else
			buffer.writei8(n,0,1)
			buffer.writef64(n,1,l)
			buffer.writef64(n,9,e)
			return n
		end
	elseif l == 0 then
		local rou = math.round(e)
		if rou == 0 then
			buffer.writei8(n,0,0)
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,0)
			return n
		elseif rou == 1e10 then
			buffer.writei8(n,0,-1)
			buffer.writef64(n,1,1)
			buffer.writef64(n,9,10)
			return n
		else
			buffer.writei8(n,0,-1)
			buffer.writef64(n,1,0)
			buffer.writef64(n,9,rou)
			return n
		end
	elseif e < 0 then
		buffer.writei8(n,0,0)
		buffer.writef64(n,1,0)
		buffer.writef64(n,9,0)
		return n
	elseif l == 1 and e <= l1_THRESHOLD then
		buffer.writei8(n,0,-1)
		buffer.writef64(n,1,1)
		buffer.writef64(n,9,math.log10(math.round(10^e)))
		return n
	else
		buffer.writei8(n,0,-1)
		buffer.writef64(n,1,l)
		buffer.writef64(n,9,e)
		return n
	end
end
--[[
	Rounds n1 to nearest multiple of n2
]]
function gn.roundtoeq(n1,n2)
	if type(n1) ~= "buffer" then
		error("Wrong Type: roundtoeq(), Input 1")
	end
	local s1,l1,e1,s2,l2,e2
	s1 = buffer.readi8(n1,0)
	l1 = buffer.readf64(n1,1)
	e1 = buffer.readf64(n1,9)
	if type(n2) == "buffer" then
		s2 = buffer.readi8(n2,0)
		l2 = buffer.readf64(n2,1)
		e2 = if l2 > 0 then -buffer.readf64(n2,9) else (1/buffer.readf64(n2,9))
	elseif type(n2) == "number" then
		if n2 == 0 then
			s2 = 0
			l2 = 0
			e2 = 0
		elseif n2 == nil then
			s2 = 1
			l2 = -1
			e2 = 1
		else
			s2 = math.sign(n2)
			n2 = math.abs(n2)
			if n2 >= 1e10 or n2 <= 1e-10 then
				l2 = 1
				e2 = -math.log10(n2)
			else
				l2 = 0
				e2 = 1/n2
			end
		end
	else
		error("Wrong Type: roundtoeq(), Input 2")
	end
	local s,l,e
	if s1 == 0 or s2 == 0 then
		s = 0
		l = 0
		e = 0
	elseif l1 == 0 and l2 == 0 then
		local n = e1 * e2
		s = s1 * s2 * math.sign(n)
		if n >= 1e10 or n <= 1e-10 then
			l = 1
			e = math.log10(n)
		else
			l = 0
			e = n
		end
	elseif l1 == l2 and e1 == -e2 then
		s = s1*s2
		l = 0
		e = 1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		s = s1*s2
		if l1 > l2 then
			l = l1
			e = e1
		elseif l1 < l2 then
			l = l2
			e = e2
		elseif math.abs(e1) > math.abs(e2) then
			l = l1
			e = e1
		else
			l = l2
			e = e2
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 + e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 + math.log10(e2)
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) + e2
		s = s1 * s2 * math.sign(a)
		if a >= 1e10 then
			l = 2
			e = math.log10(a)
		elseif a < 10 then
			l = 0
			e = 10 ^ a
		else
			l = 1
			e = a
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		s = s1 * s2
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				l = l1
				e = e1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s + e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e1s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e1s * 10 ^ a
					else
						l = 1
						e = e1s * a
					end
				else
					l = 2
					e = e1s * a
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				l = l2
				e = e2
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s + e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					l = 3
					e = e2s * math.log10(a)
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						e = e2s * 10 ^ a
					else
						l = 1
						e = e2s * a
					end
				else
					l = 2
					e = e2s * a
				end
			end
		end
	end
	if s == 0 then
		s = 0
		l = 0
		e = 0
	elseif s == 1 then
		if l == 0 then
			e = math.round(e)
			if e == 0 then
				s = 0
			elseif e == 1e10 then
				s = 1
				e = 10
				l = 1
			else
				s = 1
			end
		elseif e < 0 then
			s = 0
			l = 0
			e = 0
		elseif l == 1 and e <= l1_THRESHOLD then
			s = 1
			l = 1
			e = math.log10(math.round(10^e))
		end
	elseif l == 0 then
		e = math.round(e)
		if e == 0 then
			s = 0
		elseif e == 1e10 then
			s = -1
			e = 10
			l = 1
		else
			s = -1
		end
	elseif e < 0 then
		s = 0
		l = 0
		e = 0
	elseif l == 1 and e <= l1_THRESHOLD then
		s = -1
		l = 1
		e = math.log10(math.round(10^e))
	end
	s1 = s
	l1 = l
	e1 = e
	if s1 == 0 or s2 == 0 then
		buffer.writei8(n1,0,0)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,0)
		return n1
	elseif l1 == 0 and l2 == 0 then
		local n = e1 / e2
		buffer.writei8(n1,0,s1 * s2 * math.sign(n))
		if n >= 1e10 or n <= 1e-10 then
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,math.log10(n))
			return n1
		else
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,n)
			return n1
		end
	elseif l1 == l2 and e1 == e2 then
		buffer.writei8(n1,0,s1*s2)
		buffer.writef64(n1,1,0)
		buffer.writef64(n1,9,1)
		return n1
	elseif l1 >= 3 or l2 >= 3 or (l1 == 2 and l2 == 0) or (l2 == 2 and l1 == 0) then
		if l1 > l2 then
			buffer.writei8(n1,0,s1)
			buffer.writef64(n1,1,l1)
			buffer.writef64(n1,9,e1)
			return n1
		elseif l1 < l2 then
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,-e2)
			return n1
		elseif math.abs(e1) > math.abs(e2) then
			buffer.writei8(n1,0,s1)
			buffer.writef64(n1,1,l1)
			buffer.writef64(n1,9,e1)
			return n1
		else
			buffer.writei8(n1,0,s2)
			buffer.writef64(n1,1,l2)
			buffer.writef64(n1,9,-e2)
			return n1
		end
	elseif l1 == 1 and l2 == 1 then
		local a = e1 - e2
		buffer.writei8(n1,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif l1 == 1 and l2 == 0 then
		local a = e1 - math.log10(e2)
		buffer.writei8(n1,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	elseif l1 == 0 and l2 == 1 then
		local a = math.log10(e1) - e2
		buffer.writei8(n1,0,s1 * s2 * math.sign(a))
		if a >= 1e10 then
			buffer.writef64(n1,1,2)
			buffer.writef64(n1,9,math.log10(a))
			return n1
		elseif a < 10 then
			buffer.writef64(n1,1,0)
			buffer.writef64(n1,9,10 ^ a)
			return n1
		else
			buffer.writef64(n1,1,1)
			buffer.writef64(n1,9,a)
			return n1
		end
	else
		local fe1 = e1
		local fe2 = e2
		if l1 == 1 then
			fe1 = math.sign(e1) * math.log10(math.abs(e1))
		elseif l2 == 1 then
			fe2 = math.sign(e2) * math.log10(math.abs(e2))
		end
		buffer.writei8(n1,0,s1 * s2)
		local e1s = math.sign(fe1)
		local e2s = math.sign(fe2)
		local e1a = math.abs(fe1)
		local e2a = math.abs(fe2)
		if e1a >= e2a then
			local oomdif = e1a - e2a
			if oomdif >= 16 then
				buffer.writef64(n1,1,l1)
				buffer.writef64(n1,9,e1)
				return n1
			else
				local a = math.abs(e2a + math.log10(math.abs(e2s - e1s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(n1,1,3)
					buffer.writef64(n1,9,e1s * math.log10(a))
					return n1
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(n1,1,0)
						buffer.writef64(n1,9,e1s * 10 ^ a)
						return n1
					end
					buffer.writef64(n1,1,1)
					buffer.writef64(n1,9,e1s * a)
					return n1
				else
					buffer.writef64(n1,1,2)
					buffer.writef64(n1,9,e1s * a)
					return n1
				end
			end
		else
			local oomdif = e2a - e1a
			if oomdif >= 16 then
				buffer.writef64(n1,1,l2)
				buffer.writef64(n1,9,e2)
				return n1
			else
				local a = math.abs(e1a + math.log10(math.abs(e1s - e2s * 10 ^ oomdif)))
				if a >= 1e10 then
					buffer.writef64(n1,1,3)
					buffer.writef64(n1,9,e2s * math.log10(a))
					return n1
				elseif a < 10 then
					a = 10 ^ a
					if a < 10 then
						buffer.writef64(n1,1,0)
						buffer.writef64(n1,9,e2s * 10 ^ a)
						return n1
					end
					buffer.writef64(n1,1,1)
					buffer.writef64(n1,9,e2s * a)
					return n1
				else
					buffer.writef64(n1,1,2)
					buffer.writef64(n1,9,e2s * a)
					return n1
				end
			end
		end
	end
end
--[[
	n = 1 / n
	Sets n to Reciprocal of n
]]
function gn.recipeq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: recipeq(), Input 1")
	end
	buffer.writef64(n,9, if buffer.readf64(n,1) > 0 then -buffer.readf64(n,9) else 1 / buffer.readf64(n,9))
	return n
end
--[[
	n = |n|
	Sets n to Absolute Value of n
]]
function gn.abseq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: abseq(), Input 1")
	end
	buffer.writei8(n,0,math.abs(buffer.readi8(n,0)))
	return n
end
--[[
	n = -n
	Sets n to Negated of n
]]
function gn.negeq(n)
	if type(n) ~= "buffer" then
		error("Wrong Type: negeq(), Input 1")
	end
	buffer.writei8(n,0,-buffer.readi8(n,0))
	return n
end
--[[
	Sign of n (1 if positive, -1 if negative, 0 if zero)
]]
function gn.sign(n)
	if type(n) == "buffer" then
		return buffer.readi8(n,0)
	elseif type(n) == "number" then
		return math.sign(n)
	else
		error("Wrong Type: sign(), Input 1")
	end
end
--[[
	if n is POSITIVE then TRUE else FALSE
]]
function gn.isPositive(n)
	if type(n) == "buffer" then
		return buffer.readi8(n,0) > 0
	elseif type(n) == "number" then
		return n > 0
	else
		error("Wrong Type: isPositive(), Input 1")
	end
end
--[[
	if n is NEGATIVE then TRUE else FALSE
]]
function gn.isNegative(n)
	if type(n) == "buffer" then
		return buffer.readi8(n,0) < 0
	elseif type(n) == "number" then
		return n < 0
	else
		error("Wrong Type: isNegative(), Input 1")
	end
end
--[[
	if n is ZERO then TRUE else FALSE
]]
function gn.isZero(n)
	if type(n) == "buffer" then
		return buffer.readi8(n,0) == 0
	elseif type(n) == "number" then
		return n == 0
	else
		error("Wrong Type: isZero(), Input 1")
	end
end
--[[
	if n is in range of numbers (<~1.79e308) then TRUE else FALSE
]]
function gn.isNumber(n)
	if type(n) == "buffer" then
		--buffer.readf64(n,9)
		return if buffer.readf64(n,1) >= 2 then true elseif buffer.readf64(n,1) == 1 then math.abs(buffer.readf64(n,9)) < inf_limit else true
	elseif type(n) == "number" then
		return true
	else
		error("Wrong Type: isNumber(), Input 1")
	end
end
--[[
	Random number between n1 and n2
]]
function gn.random(n1,n2)
	return gn.addeq(gn.muleq(gn.sub(n2,n1),math.random()),n1)
end
--[[
	Sum of Geometric Series Range from start to last
	start term is: base * mul ^ start
	last term is: base * mul ^ last
	returns sum of the terms between
]]
function gn.geosum(base, mul, start, last)
	if gn.eq(mul,1) then
		return gn.muleq(gn.sub(last,start),base)
	else
		return gn.diveq(gn.muleq(gn.sub(gn.pow(mul,last),gn.pow(mul,start)),base),gn.sub(mul,1))
	end
end
--[[
	End Index of Geometric Series Range starting at 'start'
	start term is: base * mul ^ start
	range sum is: amount
	returns end index
]]
function gn.geosumR(base, mul, start, amount)
	if gn.eq(mul,1) then
		return gn.addeq(gn.div(amount,base),start)
	else
		return gn.addeq(gn.logeq(gn.addeq(gn.diveq(gn.diveq(gn.muleq(gn.sub(mul,1),amount),base),gn.pow(mul,start)),1),mul),start)
	end
end
--it's gammaing time
local C = {0.99999999999980993, 676.5203681218851, -1259.1392167224028,771.32342877765313, -176.61502916214059, 12.507343278686905, -0.13857109526572012, 9.9843695780195716e-6, 1.5056327351493116e-7}
function F_Gamma(n)
	if n > 171.6236 then return 1.8e308 end
	if (n >= 0.5) then 
		n -= 1
		local x = C[1]
		for i=1, 7 do
			x += C[i + 1] / (n + i)
		end
		local t = n + 7.5
		return  x * t ^ (n + 0.5 - 36) * math.exp(-t) * t ^ 36 * 2.50662827463100050241576528
	end
	return math.pi / (math.sin(math.pi * n) * F_Gamma(1 - n))
end
--[[
	the gamma function | (n-1)!
	(n-1)*(n-2)*...*2*1
]]
function gn.gamma(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: gamma(), Input 2")
	end
	if s <= 0 then 
		local buf = buffer.create(17)
		buffer.writei8(buf,0,1)
		buffer.writef64(buf,1,-1)
		buffer.writef64(buf,9,1)
		return buf 
	elseif e < 0 then 
		local buf = buffer.create(17)
		buffer.writei8(buf,0,s)
		buffer.writef64(buf,1,l)
		buffer.writef64(buf,9,-e)
		return buf 
	elseif l == 0 then
		if s == -1 or e <= 24 then
			return gn.fromNumber(F_Gamma(s * e))
		end
		local t = e - 1
		local l1 = (0.9189385332046727 + ((t + 0.5) * math.log(t))) - t
		local n2 = t * t
		local np = t
		local lm = 12 * np
		local adj = 1 / lm
		local l2 = l1 + adj
		if l2 == l1 then return gn.exp(l1) end
		l1 = l2
		np *= n2
		lm = 360 * np
		adj = 1 / lm
		l2 = l1 - adj
		if l2 == l1 then return gn.exp(l1) end
		l1 = l2
		np *= n2
		local lt = 1 / (1260 * np)
		l1 += t
		np *= n2
		lt = 1 / (1680 * np)
		l1 -= lt
		return gn.exp(l1)
	elseif l == 1 then 
		return gn.expeq(gn.muleq(gn.subeq(gn.ln(n), 1),n))
	end
	return gn.exp(n)
end
--[[
	the factorial function | n!
	n*(n-1)*(n-2)*...*2*1
]]
function gn.fact(n)
	return gn.gamma(gn.add(n,1))
end
local suffixes = {
	{
		{'k','M','B','T','Qd','Qt','Sx','Sp','Oc','No'},
		{'','U','D','T','Qt','Qn','Sx','Sp','Oc','No'},
		{'','Dc','Vt','Tg','qg','Qg','sg','Sg','og','ng'},
		{'','Ce','Du','Tr','Qa','Qi','Se','Si','Ot','Ni'},
	},
	{
		{'k','m','b','t','q','Q','s','S','o','n','d'},
	},
	{
		{'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'},
	},
}
--[[
	Converts s,l,e to a number ex.
	3535 = 1,0,3535
	1,000,000,000,000 = 1,1,12
]]
function gn.suffix(i)
	if i <= 10 then return suffixes[1][1][i] end
	if i >= 1001 then return "Mi" end
	return suffixes[1][2][((i-1) % 10)+1]..suffixes[1][3][(((i-1) // 10) % 10 )+1]..suffixes[1][4][(((i-1) // 100) % 10)+1]
end
function Asuffix(i)
	i += 26
	local s = ""
	while i > 0 do
		local mod = ((i-1) % 26)+1
		i = (i - mod) / 26
		s=suffixes[3][1][mod]..s
	end	
	return s
end
function addcommas(n)
	local s = math.sign(n)
	n = math.abs(n)
	if n < 1e3 then
		return tostring(s*n)
	elseif n < 1e6 then
		local a = n//1e3
		return tostring(s*a)..","..tostring(n-((a-1)*1e3)):sub(2)
	end
end
--[[
	Converts s,l,e to a number ex.
	3535 = 1,0,3535
	1,000,000,000,000 = 1,1,12
]]
function gn.std(s,l,e)
	if s == 0 or l >= 2 or (l==1 and e>=inf_limit) then
		return "0"
	end
	local n = s * (if l == 0 then e else 10^e)
	if n >= 1 then
		local exponent = math.floor(math.log10(n))
		local mod3 = exponent % 3
		return string.format(digitcuts[math.max(gn.DefaultTotalDigits-mod3,0)],n*pow10[mod3-exponent])
	else
		return string.format(digitcuts[math.max(gn.DefaultTotalDigits,0)],s*e)
	end
end
--[[
	Converts s,l,e to a number replacing DefaultTotalDigits with i
]]
function gn.stdsetround(s,l,e,i)
	if s == 0 or l >= 2 or (l==1 and e>=inf_limit) then
		return "0"
	end
	local n = s * (if l == 0 then e else 10^e)
	if n >= 1 then
		local exponent = math.floor(math.log10(n))
		local mod3 = exponent % 3
		return string.format(digitcuts[math.max(i-mod3,0)],n*pow10[mod3-exponent])
	else
		return string.format(digitcuts[math.max(i,0)],s*e)
	end
end
--[[
	Converts s,l,e to suffix notation ex.
	35.35k = 1,0,35.35*1000
]]
function gn.suf(s,l,e)
	if s == 0 then
		return "0"
	elseif l == 0 then
		if e >= 1e-3 and e < 1e3 then
			local mod3 = if e < 10 then 0 elseif e < 100 then 1 else 2
			local roundingpoint = math.max(gn.DefaultTotalDigits,mod3)
			local a = pow10[mod3]
			return string.format(digitcuts[roundingpoint-mod3],s*(if e > a*capthres[roundingpoint] then a*capvalue[roundingpoint] else e))
		end
		local exp,man = math.modf(math.abs(math.log10(e)))
		local mod3 = exp % 3
		local roundingpoint = math.max(gn.DefaultTotalDigits,mod3)
		return (if s<0 then"-"else"")..(if e<1 then"1/"else"")..string.format(digitcuts[roundingpoint-mod3],pow10[mod3]*(if man > capthresl10[roundingpoint] then capvalue[roundingpoint] else math.pow(10,man)))..gn.suffix((exp - mod3)/3)
	elseif l == 1 and math.abs(e) < 3006 then
		local Esign = math.sign(e)
		local exp,man = math.modf(math.abs(e))
		local mod3 = exp % 3
		local roundingpoint = math.max(gn.DefaultTotalDigits,mod3)
		return (if s<0 then"-"else"")..(if Esign<0 then"1/"else"")..string.format(digitcuts[roundingpoint-mod3],pow10[mod3]*(if man > capthresl10[roundingpoint] then capvalue[roundingpoint] else math.pow(10,man)))..gn.suffix((exp - mod3)/3)
	elseif l <= gn.MaxEs or (l == gn.MaxEs + 1 and math.abs(e) < 3006) then
		local Esign = math.sign(e)
		e = math.abs(e)
		local exp,man = math.modf(if e < 3006 then e else math.log10(e))
		local mod3 = exp % 3
		local roundingpoint = math.max(gn.DefaultTotalDigits,mod3)
		return (if s<0 then"-"else"")..(if Esign<0 then"1/"else"1")..Etrail[if e<3006 then l-1 else l]..string.format(digitcuts[roundingpoint-mod3],pow10[mod3]*(if man > capthresl10[roundingpoint] then capvalue[roundingpoint] else math.pow(10,man)))..gn.suffix((exp - mod3)/3)
	elseif l < 1e6 then
		local expmant = math.log10(math.abs(e))
		return string.format(digitcuts[gn.DefaultDigits],s*(if expmant>capthres[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else expmant)).."L"..(if e > 0 then "+" else "-")..addcommas(l)
	else
		local exp,man = math.modf(math.log10(l))
		local mod3 = exp % 3
		local roundingpoint = math.max(gn.DefaultTotalDigits,mod3)
		local expmant = math.log10(math.abs(e))
		return string.format(digitcuts[gn.DefaultDigits],s*(if expmant>capthres[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else expmant)).."L"..(if e > 0 then "+" else "-")..string.format(digitcuts[roundingpoint-mod3],(if man>capthresl10[roundingpoint] then capvalue[roundingpoint] else math.pow(10,man))*pow10[mod3])..gn.suffix((exp - mod3)/3)
	end
end
--[[
	Converts s,l,e to scientific notation ex.
	3.535e4 = 1,0,3.535*10000
]]
function gn.sci(s,l,e)
	if s == 0 then
		return "0e0"
	elseif l == 0 then 
		local exp = math.floor(math.log10(e))
		local man = e/pow10[exp]
		return string.format(digitcuts[gn.DefaultDigits],s*(if man>capthres[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else man)).."e"..exp
	elseif l == 1 and math.abs(e) < 1e6 then
		local Esign = math.sign(e)
		e = math.abs(e)
		local exp,man = math.modf(e)
		return string.format(digitcuts[gn.DefaultDigits],s*(if man>capthresl10[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else math.pow(10,man))).."e"..addcommas(Esign*exp)
	elseif l <= gn.MaxEs or (l == gn.MaxEs + 1 and math.abs(e) < 1e6) then
		local Esign = math.sign(e)
		e = math.abs(e)
		local exp,man = math.modf(if e < 1e6 then e else math.log10(e))
		return s..Etrail[if e<1e6 then l-1 else l]..string.format(digitcuts[gn.DefaultDigits],Esign*(if man>capthresl10[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else math.pow(10,man))).."e"..addcommas(exp)
	elseif l < 1e6 then
		local expmant = math.log10(math.abs(e))
		return string.format(digitcuts[gn.DefaultDigits],s*(if expmant>capthres[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else expmant)).."L"..(if e > 0 then "+" else "-")..addcommas(l)
	else
		local exp,man = math.modf(math.log10(l))
		local expmant = math.log10(math.abs(e))
		return string.format(digitcuts[gn.DefaultDigits],s*(if expmant>capthres[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else expmant)).."L"..(if e > 0 then "+" else "-")..string.format(digitcuts[gn.DefaultDigits],(if man>capthresl10[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else math.pow(10,man))).."e"..exp
	end
end
--[[
	Converts s,l,e to engineer notation ex.
	35.35e3 = 1,0,35.35*1000
]]
function gn.eng(s,l,e)
	if s == 0 then
		return "0e0"
	elseif l == 0 then
		local exp,man = math.modf(math.log10(e))
		if exp < 0 then
			exp -= 1
			man += 1
		end
		local mod3 = exp % 3
		local roundingpoint = math.max(gn.DefaultTotalDigits,mod3)
		return (if s<0 then"-"else"")..string.format(digitcuts[roundingpoint-mod3],pow10[mod3]*(if man > capthresl10[roundingpoint] then capvalue[roundingpoint] else math.pow(10,man))).."e"..(exp - mod3)
	elseif l == 1 and math.abs(e) < 1000002 then
		local Esign = math.sign(e)
		e = math.abs(e)
		local exp,man = math.modf(e)
		local mod3 = exp % 3
		local roundingpoint = math.max(gn.DefaultTotalDigits,mod3)
		return string.format(digitcuts[roundingpoint-mod3],s*pow10[mod3]*(if man > capthresl10[roundingpoint] then capvalue[roundingpoint] else math.pow(10,man))).."e"..addcommas(Esign*(exp - mod3))
	elseif l <= gn.MaxEs or (l == gn.MaxEs + 1 and math.abs(e) < 1000002) then
		local Esign = math.sign(e)
		e = math.abs(e)
		local exp,man = math.modf(if e < 1000002 then e else math.log10(e))
		local mod3 = exp % 3
		local roundingpoint = math.max(gn.DefaultTotalDigits,mod3)
		return s..Etrail[if e<1000002 then l-1 else l]..string.format(digitcuts[roundingpoint-mod3],pow10[mod3]*(if man > capthresl10[roundingpoint] then capvalue[roundingpoint] else math.pow(10,man))).."e"..addcommas(Esign*(exp - mod3))
	elseif l < 1e6 then
		local expmant = math.log10(math.abs(e))
		return string.format(digitcuts[gn.DefaultDigits],s*(if expmant>capthres[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else expmant)).."L"..(if e > 0 then "+" else "-")..addcommas(l)
	else
		local exp,man = math.modf(math.log10(l))
		local mod3 = exp % 3
		local roundingpoint = math.max(gn.DefaultTotalDigits,mod3)
		local expmant = math.log10(math.abs(e))
		return string.format(digitcuts[gn.DefaultDigits],s*(if expmant>capthres[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else expmant)).."L"..(if e > 0 then "+" else "-")..string.format(digitcuts[roundingpoint-mod3],pow10[mod3]*(if man > capthresl10[roundingpoint] then capvalue[roundingpoint] else math.pow(10,man))).."e"..(exp-mod3)
	end
end
--[[
	Converts s,l,e to layered notation ex.
	3.5L+3 = 1,3,10^3.5(~+3162)
	3.5L-3 = 1,3,-10^3.5(~-3162)
	-3.5L+3 = -1,3,10^3.5(~+3162)
	-3.5L-3 = -1,3,-10^3.5(~-3162)
]]
function gn.lay(s,l,e)
	if s == 0 then
		return "0L+0"
	elseif l == 0 then
		return string.format(digitcuts[gn.DefaultDigits],s*math.abs(math.log10(e)))
			.."L"..(if e >= 1 then "+" else "-").."0"
	elseif l < 1e6 then
		local expmant = math.log10(math.abs(e))
		return string.format(digitcuts[gn.DefaultDigits],s*(if expmant>capthres[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else expmant)).."L"..(if e > 0 then "+" else "-")..addcommas(l)
	else
		local exp,man = math.modf(math.log10(l))
		local expmant = math.log10(math.abs(e))
		return string.format(digitcuts[gn.DefaultDigits],s*(if expmant>capthres[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else expmant)).."L"..(if e > 0 then "+" else "-")..string.format(digitcuts[gn.DefaultDigits],(if man>capthresl10[gn.DefaultDigits] then capvalue[gn.DefaultDigits] else math.pow(10,man))).."e"..exp
	end
end
--[[
	Converts gammanum to suffix notation ex.
	35.35k = 1,0,35.35*1000
]]
function gn.toSuffix(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: toSuffix(), Input 1")
	end
	return gn.suf(s,l,e)
end
--[[
	Converts gammanum to scientific notation ex.
	3.535e4 = 1,0,3.535*10000
]]
function gn.toScientific(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: toScientific(), Input 1")
	end
	return gn.sci(s,l,e)
end
--[[
	Converts gammanum to engineer notation ex.
	35.35e3 = 1,0,35.35*1000
]]
function gn.toEngineer(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: toEngineer(), Input 1")
	end
	return gn.eng(s,l,e)
end
--[[
	Converts gammanum to layered notation ex.
	3.5L+3 = 1,3,10^3.5(~+3162)
	3.5L-3 = 1,3,-10^3.5(~-3162)
	-3.5L+3 = -1,3,10^3.5(~+3162)
	-3.5L-3 = -1,3,-10^3.5(~-3162)
]]
function gn.toLayered(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: toLayered(), Input 1")
	end
	return gn.lay(s,l,e)
end
--[[
	Converts gammanum to string with given suffixtype
	Defaults to .DefaultSuffixType
	if 3rd input is an overide for TotalDefaultDigits for small numbers (0.001<|n|<1000)
	ex. n=3.594381 would return 4 if the 3rd input is 0
]]
function gn.tostring(n, suffixtype, intround)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: tostring(), Input 1")
	end
	if suffixtype == nil then suffixtype = gn.DefaultSuffixType end
	if suffixtype == gn.SuffixTypes.Scientific then return gn.sci(s,l,e)
	elseif suffixtype == gn.SuffixTypes.Scientific3 then return if l >= 1 or e >= 1e3 or e <= 1e-3 then gn.sci(s,l,e) else (if intround then gn.stdsetround(s,l,e,intround) else gn.std(s,l,e))
	elseif suffixtype == gn.SuffixTypes.Scientific36 then return if l >= 2 or (l == 1 and (e >= 36 or e < 0)) or (l == 0 and (e <= 1e-3)) then gn.sci(s,l,e) elseif (l == 1 and e > 0) or (l == 0 and e >= 1e3) then gn.suf(s,l,e) else (if intround then gn.stdsetround(s,l,e,intround) else gn.std(s,l,e))
	elseif suffixtype == gn.SuffixTypes.Scientific306 then return if l >= 2 or (l == 1 and (e >= 306 or e < 0)) or (l == 0 and (e <= 1e-3)) then gn.sci(s,l,e) elseif (l == 1 and e > 0) or (l == 0 and e >= 1e3) then gn.suf(s,l,e) else (if intround then gn.stdsetround(s,l,e,intround) else gn.std(s,l,e))
	elseif suffixtype == gn.SuffixTypes.Scientific3006 then return if l >= 2 or (l == 1 and (e >= 3006 or e < 0)) or (l == 0 and (e <= 1e-3)) then gn.sci(s,l,e) elseif (l == 1 and e > 0) or (l == 0 and e >= 1e3) then gn.suf(s,l,e) else (if intround then gn.stdsetround(s,l,e,intround) else gn.std(s,l,e))
	elseif suffixtype == gn.SuffixTypes.Engineer then return gn.eng(s,l,e)
	elseif suffixtype == gn.SuffixTypes.Engineer3 then return if l >= 1 or e >= 1e3 or e <= 1e-3 then gn.eng(s,l,e) else (if intround then gn.stdsetround(s,l,e,intround) else gn.std(s,l,e))
	elseif suffixtype == gn.SuffixTypes.Engineer36 then return if l >= 2 or (l == 1 and (e >= 36 or e < 0)) or (l == 0 and (e <= 1e-3)) then gn.eng(s,l,e) elseif (l == 1 and e > 0) or (l == 0 and e >= 1e3) then gn.suf(s,l,e) else (if intround then gn.stdsetround(s,l,e,intround) else gn.std(s,l,e))
	elseif suffixtype == gn.SuffixTypes.Engineer306 then return if l >= 2 or (l == 1 and (e >= 306 or e < 0)) or (l == 0 and (e <= 1e-3)) then gn.eng(s,l,e) elseif (l == 1 and e > 0) or (l == 0 and e >= 1e3) then gn.suf(s,l,e) else (if intround then gn.stdsetround(s,l,e,intround) else gn.std(s,l,e))
	elseif suffixtype == gn.SuffixTypes.Engineer3006 then return if l >= 2 or (l == 1 and (e >= 3006 or e < 0)) or (l == 0 and (e <= 1e-3)) then gn.eng(s,l,e) elseif (l == 1 and e > 0) or (l == 0 and e >= 1e3) then gn.suf(s,l,e) else (if intround then gn.stdsetround(s,l,e,intround) else gn.std(s,l,e))
	elseif suffixtype == gn.SuffixTypes.Layered then return gn.lay(s,l,e)
	end
end
--[[
	Encodes n into something that can be stored in an OrderedDataStore
]]
function gn.lbencode(n)
	local s,l,e
	if type(n) == "buffer" then
		s = buffer.readi8(n,0)
		l = buffer.readf64(n,1)
		e = buffer.readf64(n,9)
	elseif type(n) == "number" then
		if n == 0 then
			s = 0
			l = 0
			e = 0
		elseif n == nil then
			s = 1
			l = -1
			e = 1
		else
			s = math.sign(n)
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then 
				l = 1
				e = math.log10(n)
			else
				l = 0
				e = n
			end
		end
	else
		error("Wrong Type: lbencode(), Input 1")
	end
	if s == 0 then
		return 0
	elseif l == 0 then
		return s*math.round(4503599627370496 + 2199023255552 * (math.log10(e)/10))
	elseif l >= 1024 and math.sign(e) == 1 then
		return s*(6755399441055744 + 2199023255552 * math.log(l+(math.log10(e)-1)/9,2))
	elseif l < 1024 and math.sign(e) == 1 then
		return s*math.round(4503599627370496 + 2199023255552 * (l + (math.log10(e)-1)/9))
	elseif l < 1024 and math.sign(e) == -1 then
		return s*math.round(2251799813685248 + 2199023255552 * (1024 - l - (math.log10(-e)-1)/9))
	elseif l >= 1024 and math.sign(e) == -1 then
		return s*(2199023255552 * (1024-math.log(l+(math.log10(-e)-1)/9,2)))
	end
end
--[[
	Decodes from .lbencode()
]]
function gn.lbdecode(n)
	if type(n) ~= "number" then
		error("Wrong Type: lbdecode(), Input 1")
	end
	local buf = buffer.create(17)
	if n == 0 then
		return buf
	end
	buffer.writei8(buf,0,math.sign(n))
	n = math.abs(n)
	if math.abs(n-4503599627370496) <= 2199023255552 then
		buffer.writef64(buf,9,10^(math.abs(n-4503599627370496)/219902325555.2))
		return buf
	elseif n <= 2251799813685248 then
		n = 2^(1024-(n/2199023255552))
		local floor = math.floor(n)
		buffer.writef64(buf,1,floor)
		buffer.writef64(buf,9,-(10^(1+(n-floor)*9)))
		return buf
	elseif n <= 4503599627370496 then
		n = 1024-((n-2251799813685248)/2199023255552)
		local floor = math.floor(n)
		buffer.writef64(buf,1,floor)
		buffer.writef64(buf,9,-(10^(1+(n-floor)*9)))
		return buf
	elseif n <= 6755399441055744 then
		n = (n-4503599627370496)/2199023255552
		local floor = math.floor(n)
		buffer.writef64(buf,1,floor)
		buffer.writef64(buf,9,10^(1+(n-floor)*9))
		return buf
	else
		n = 2^((n-6755399441055744)/2199023255552)
		local floor = math.floor(n)
		buffer.writef64(buf,1,floor)
		buffer.writef64(buf,9,10^(1+(n-floor)*9))
		return buf
	end
end
--[[
	Encodes n into base64 without dataloss
]]
function gn.b64encode(n)
	if type(n) == "buffer" then
	elseif type(n) == "number" then
		local buf = buffer.create(17)
		if n == 0 then
			n = buf
		elseif n == nil then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,-1)
			buffer.writef64(buf,9,1)
			n = buf
		else
			buffer.writei8(buf,0,math.sign(n))
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,math.log10(n))
				n = buf
			else
				buffer.writef64(buf,9,n)
				n = buf
			end
		end
	else
		error("Wrong Type: b64encode(), Input 1")
	end
	local Encoded = buffer.fromstring(game.HttpService:JSONEncode(n))
	local Base64Length = buffer.len(Encoded) - 35
	local Base64Buffer = buffer.create(Base64Length)
	buffer.copy(Base64Buffer, 0, Encoded, 33, Base64Length)
	return buffer.tostring(Base64Buffer):sub(1,-2)
end
--[[
	Decodes n from .encode()
]]
function gn.b64decode(n)
	if type(n) ~= "string" then
		error("Wrong Type: b64decode(), Input 1") 
	end
	local buf1 = buffer.create(17)
		buffer.copy(buf1, 0,
			game.HttpService:JSONDecode("{\"m\":null,\"t\":\"buffer\",\"base64\":\""..n.."==\"}"))
	return buf1
end
--[[
	Encodes n into hexadecimal without dataloss
]]
function gn.hexencode(n)
	if type(n) == "buffer" then
	elseif type(n) == "number" then
		local buf = buffer.create(17)
		if n == 0 then
			n = buf
		elseif n == nil then
			buffer.writei8(buf,0,1)
			buffer.writef64(buf,1,-1)
			buffer.writef64(buf,9,1)
			n = buf
		else
			buffer.writei8(buf,0,math.sign(n))
			n = math.abs(n)
			if n >= 1e10 or n <= 1e-10 then
				buffer.writef64(buf,1,1)
				buffer.writef64(buf,9,math.log10(n))
				n = buf
			else
				buffer.writef64(buf,9,n)
				n = buf
			end
		end
	else
		error("Wrong Type: hexencode(), Input 1")
	end
	local str = ""
	for i=0,buffer.len(n)-1 do
		local a = buffer.readu8(n,i)
		local n1 = a // 16
		local n2 = a % 16
		str ..= string.char(if n1 < 10 then n1+48 else n1+87,if n2 < 10 then n2+48 else n2+87)
	end
	return str
end
--[[
	Decodes n from .hexencode()
]]
function gn.hexdecode(n)
	if type(n) ~= "string" then
		error("Wrong Type: hexdecode(), Input 1")
	end
	local str = ""
	for i=2,#n,2 do
		local n1 = string.byte(string.sub(n,i-1,i-1))
		local n2 = string.byte(string.sub(n,i,i))
		str ..= string.char((if n1 < 70 then n1-48 else n1-87)*16+(if n2 < 70 then n2-48 else n2-87))
	end
	return buffer.fromstring(str)
end
gn.Constants = {
	Zero = gn.new(0),
	One = gn.new(1,0,1),
	Pi = gn.new(1,0,math.pi),
	Inf = gn.new(1,1,inf_limit),
}
return gn
