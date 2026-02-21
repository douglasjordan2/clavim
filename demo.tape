Output demo.gif

Set Shell zsh
Set FontSize 14
Set Width 1200
Set Height 700
Set Theme "Catppuccin Mocha"
Set Padding 20
Set Framerate 24

# Pre-create the demo file with proper formatting
Type "cat > /tmp/demo.js << 'EOF'"
Enter
Type "function fetchUsers(url, callback) {"
Enter
Type "  const xhr = new XMLHttpRequest();"
Enter
Type "  xhr.open('GET', url);"
Enter
Type "  xhr.onload = function() {"
Enter
Type "    if (xhr.status === 200) {"
Enter
Type "      callback(null, JSON.parse(xhr.responseText));"
Enter
Type "    } else {"
Enter
Type "      callback(new Error(xhr.statusText));"
Enter
Type "    }"
Enter
Type "  };"
Enter
Type "  xhr.send();"
Enter
Type "}"
Enter
Type "EOF"
Enter
Sleep 500ms

# 1. Launch ClaVim — dashboard appears
Type "NVIM_APPNAME=clavim nvim --cmd 'set shortmess+=F'"
Enter
Sleep 3s
Screenshot demo-dashboard.png
Sleep 1.5s

# 2. Open the pre-written JS file
Type ":e /tmp/demo.js"
Enter
Sleep 1.5s

# 3. Visual select the whole function
Type "ggVG"
Sleep 1.5s

# 4. Inline edit (Cursor Cmd+K equivalent)
Type " ae"
Sleep 2s
Type@50ms "rewrite using fetch and async/await"
Sleep 2s
Escape
Sleep 500ms

# 5. Show which-key — press leader and wait
Escape
Sleep 500ms
Type " "
Sleep 2.5s
Screenshot demo-whichkey.png

# 6. Drill into the AI submenu
Type "a"
Sleep 2.5s
Screenshot demo-ai-keys.png
Sleep 1s
Escape
Sleep 500ms

# 7. Open Claude chat panel
Type " ac"
Sleep 2s
Type@50ms "what other patterns should I modernize?"
Sleep 2s

Escape
Sleep 1s
Type ":qa!"
Enter
