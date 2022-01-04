local dictionary_status_ok, dictionary = pcall(require, "dictionary")
if not dictionary_status_ok then
  return
end


dictionary.setup({
    dic = {
        ["*"] = "/usr/share/dict/words"
    },
    -- The following are default values, so you don't need to write them if you don't want to change them
    exact = -1,
    async = false,
    capacity = 5,
    debug = false,
})



