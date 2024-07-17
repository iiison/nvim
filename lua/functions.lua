function ensureDirExists(path)
  local expandedPath = vim.fn.expand(path)

  if not vim.fn.isdirectory(expandedPath)
    then vim.fn.mkdir(expandedPath)
  end
end
