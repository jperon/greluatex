function Compile(entree)
    f = io.popen(
	'echo "'
	.. 'name:tmp;\n%%%%\n'
	.. entree
	.. '" | gregorio -sS', 'r')
    tex.print(f:read("*a"):explode('\n'))
    f:close()
end
