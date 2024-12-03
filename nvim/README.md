**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!


# Notes / Cheatsheet
Replace text in a file:

```
# % = current file
# s = substitution

# Find and replace first occurrence in line
:%s/<find>/<replace>

# Find and replace all occurrences in lines
:%s/<find>/<replace>/g 

# If you have previously searched for text, you can leave find blank
# and it will use your last search query
:%s//<replace>

# Add a check / confirmatin before replacing
:%s/<find></replace>/gc
```

Search and Delete:
```
# d = delete

# g = global
# Find and delete all lines that match <find>
%g/<find>/d

# v = inverse
# Find and delete all lines that DO NOT match <find>
%v/<find>/d
```
