**userChrome.css**

```css
#tabbrowser-tabs {
  visibility: collapse;
}
```

**userContent.css**
```css
@-moz-document url("about:home"), url("about:newtab") {
    html,body { background: #333 !important; }
}
```

**Disable HTML5 autoplay**
- `about:config`  
- search: media*play
- media.autoplay.enabled -> false
