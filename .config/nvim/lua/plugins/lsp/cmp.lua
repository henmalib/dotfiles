-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/lua/lsp-zero/cmp-mapping.lua
function tab_complete()
    local cmp = require('cmp')
    return cmp.mapping(function(fallback)
        local col = vim.fn.col('.') - 1

        if cmp.visible() then
            cmp.select_next_item(select_opts)
        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
        else
            cmp.complete()
        end
    end, {'i', 's'})
end

function select_prev_or_fallback(select_opts)
    local cmp = require('cmp')
    return cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item(select_opts)
        else
            fallback()
        end
    end, {'i', 's'})
end


return {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets'
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup {
            completion = {
                completeopt = "menu,menuone,preview,noselect"
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },

            sources = cmp.config.sources({
                {name = "nvim_lsp"},
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            }),

            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = tab_complete(),
                ['<S-Tab>'] = select_prev_or_fallback(),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-ie>'] = cmp.mapping.abort(),

                ["<CR>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        local entry = cmp.get_selected_entry()
                        if not entry then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            cmp.confirm()
                        end
                    else
                        fallback()
                    end
                end, { "i", "s", "c", }),
            })
        }
    end
}
