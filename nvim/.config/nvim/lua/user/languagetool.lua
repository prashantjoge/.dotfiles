vim.g.languagetool_server_jar = "/home/aaron/languagetool/languagetool-server.jar"
--vim.g.languagetool_server_command = {
--	"java -cp $HOME/languagetool/languagetool-server.jar org.languagetool.server.HTTPServer --port 8081 --allow-origin",
--}
local status_ok, langauagetool = pcall(require, "LanguageTool")
if not status_ok then
	return
end

languagetool.setup({
	cmd = "languagetoolsetup",
})
