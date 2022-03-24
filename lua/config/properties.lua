
-- 文本编码格式
vim.g.encoding = "UTF-8"
-- 文件编码格式
vim.o.fileencoding = 'utf-8'

-- 显示行号
vim.o.number = true
-- 中间行为0
vim.o.relativenumber = true

-- 高亮聚焦行
vim.o.cursorline = true

-- 自动读取Vim外的修改
vim.o.autoread = true

-- 编辑框左侧图标
vim.o.signcolumn = "yes"

-- 恢复文件的位置
-- vim.o.viewoptions = "cursor,folds,slash,unix"

-- 参考线
-- vim.wo.colorcolumn = "80"

-- 开启tab转空格
vim.o.expandtab = true
-- tab为几个空格
vim.o.tabstop = 2
-- 格式化tab为空格的个数
vim.o.shiftwidth = 2
-- 几个空格为tab
vim.o.softtabstop = 2
-- >> << 长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- 允许鼠标操作
vim.o.mouse = "a"

-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true

-- 减少更新时间，默认4000ms
vim.o.updatetime=300

-- 命令交互等待时间
vim.o.timeoutlen=300

-- ESC响应卡顿问题
vim.o.ttimeoutlen=0

-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "tab:> ,trail:▫"

vim.cmd("colorscheme " .. "onedarker")

