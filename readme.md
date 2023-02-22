extend: 在base中定义blocks, (可以是空的, 也可以提供部分实现).
在child中实现这些block. 在渲染child时, 会从base开始, 如果某个block在child中有实现,
则替换base中的对应block.