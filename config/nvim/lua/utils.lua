function get_current_file(t)
  return debug.getinfo(t, "S").source:sub(2)
end
function join_tables(tbl1, tbl2)
  for _, v in pairs(tbl2) do
    tbl1[#tbl1 + 1] = v
  end
  return tbl1
end
function walk_dir(path, fn)
  for file, file_type in vim.fs.dir(path) do
    local full_path_file = path .. "/" .. file
    if get_current_file(4) ~= full_path_file then
      fn(full_path_file, file, file_type)
    end
  end
end
function modules(modules_path, fn)
  local vim_config_path = vim.fn.stdpath("config")
  walk_dir(vim_config_path .. "/lua/" .. modules_path, function(_, module_name)
    local module = module_name:sub(1, -5)
    setGlobals({ lastf = get_current_file(4) })
    local module_returns = require(modules_path .. "." .. module)
    fn(module_returns)
  end)
end
function split(s)
  local res = {}
  local i = 1
  while i <= s:len() do
    res[i] = s:sub(i, i)
    i = i + 1
  end
  return res
end
keymap = vim.keymap
function setOptions(opts)
  for key, value in pairs(opts) do
    vim.o[key] = value
  end
end
function setGlobals(globals)
  for key, value in pairs(globals) do
    vim.g[key] = value
  end
end
