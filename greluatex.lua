function direct_gabc(gabc, header)
  tmpname = os.tmpname()
  local f = io.open(tmpname, 'w')
  f:write('name:direct-gabc;\n'..(header or '')..'\n%%\n'..gabc:gsub('\\par ', '\n'))
  f:close()
  local p = io.popen('gregorio -S '..tmpname, 'r')
  if p == nil then
    err("\nSomething went wrong when executing\n    gregorio -S "..tmpname..".\n"
    .."shell-escape mode may not be activated. Try\n\n%s --shell-escape %s.tex\n\nSee the documentation of gregorio or your TeX\ndistribution to automatize it.", tex.formatname, tex.jobname)
  end
  tex.print(p:read("*a"):explode('\n'))
  p:close()
  os.remove(tmpname)
end

function err(...)
    print(...)
end
