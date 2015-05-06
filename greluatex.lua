function direct_gabc(gabc, header)
  local gabccode = 'name:direct-gabc;\n'..(header or '')..'\n%%%%\n'..gabc
  local f = io.popen('echo "'..gabccode..'" | gregorio -sS', 'r')
  -- In shell-restricted mode, with gregorio (and even echo) allowed,
  -- the previous command doesn't work ; in that case, use a temporary file.
  if f == nil then
    tmpname = os.tmpname()
    local p = io.popen('gregorio -s -o '..tmpname, 'w')
    if p == nil then
      err("\nSomething went wrong when executing\n    gregorio -s -o "..tmpname..".\n"
      .."shell-escape mode may not be activated. Try\n\n%s --shell-escape %s.tex\n\nSee the documentation of gregorio or your TeX\ndistribution to automatize it.", tex.formatname, tex.jobname)
    end
    p:write(gabccode)
    p:close()
    f = io.open(tmpname)
  end
  tex.print(f:read("*a"):explode('\n'))
  f:close()
  if tmpname then os.remove(tmpname) end
end

function err(...)
    print(...)
end
