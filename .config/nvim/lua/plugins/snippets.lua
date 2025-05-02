return {
	"L3MON4D3/LuaSnip",
	config = function()
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node

		ls.add_snippets("php", {
			s("pde", {
				t("echo PHP_EOL;"),
				t({ "\t", "" }),
				t("print_r("),
				i(1),
				t(");"),
				t({ "\t", "" }),
				t("echo PHP_EOL;"),
				t({ "\t", "" }),
				t("exit;"),
			}),
			s("pdd", {
				t("dump("),
				i(1),
				t(");"),
				t({ "\t", "" }),
				t("exit;"),
			}),
		})
	end,
}
