# NeoVim Scripts

## Surround.lua

Simple script used to surround word or selection

### TODO
- [x] Visual mode version does not work
  - [x] Expected: surround the selected area: "Hello World"with selection over "World" should return "'c'World'c'", where 'c' is the chosen character (i.e. should be the same as the normal mode).
  - [x] Returns: inserts the chose character at some random location
- [ ] Bugs
  - [x] Surrounds starting from cursor location
  - [x] If cursor on the start, then it fails and puts two characters at cursor location.
  - [x] Errors when the cursor is at the beginning of the line

