function direct_gabc(gabc, header)
  tmpname = os.tmpname()
  local p = io.popen('gregorio -s -o '..tmpname, 'w')
  if p == nil then
    err("\nSomething went wrong when executing\n    gregorio -s -o "..tmpname..".\n"
    .."shell-escape mode may not be activated. Try\n\n%s --shell-escape %s.tex\n\nSee the documentation of gregorio or your TeX\ndistribution to automatize it.", tex.formatname, tex.jobname)
  end
  p:write('name:direct-gabc;\n'..(header or '')..'\n%%%%\n'..gabc)
  p:close()
  f = io.open(tmpname)
  tex.print(f:read("*a"):explode('\n'))
  f:close()
  os.remove(tmpname)
end

function err(...)
    print(...)
end
