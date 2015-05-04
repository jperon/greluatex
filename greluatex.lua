local err, warn, info, log = luatexbase.provides_module({
    name               = "greluatex",
    version            = '0',
    greinternalversion = internalversion,
    date               = "2015/04/29",
    description        = "Module greluatex.",
    author             = "The Gregorio Project (see CONTRIBUTORS.md)",
    copyright          = "2008-2015 - The Gregorio Project",
    license            = "MIT",
})

function Ecrire(entree, fichier)
    fichier = splitext(fichier, 'gabc') .. '.gabc'
    print(fichier)
    o = io.open(fichier, 'w')
    o:write(
[[name:tmp;
%%
]])
    o:write(entree)
    o:close()
end


function splitext(str, ext)
    if str:match(".-%..-") then
    	local name = string.gsub(str, "(.*)(%." .. ext .. ")", "%1")
    	return name
    else
    	return str
    end
end

function mkdirs(str)
    path = '.'
    for dir in string.gmatch(str, '([^%/]+)') do
	path = path .. '/' .. dir
        lfs.mkdir(path)
    end
end


mkdirs('tmp_gre')
