Chartkick.options = {
  height: "400px",
  colors: ["pink", "#999", "red", "yellow", "blue", "purple"]
}

Chartkick.options[:html] = '<div id="%{id}" style="height: %{height};">Loading...</div>'
Chartkick.options[:content_for] = :charts_js