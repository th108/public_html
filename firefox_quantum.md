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

**Disable Pocket**
- extensions.pocket.enabled -> false

**Fix Popup 'choose an application to open the localhost link'**
- widget.use-xdg-desktop-portal.mime-handler -> 0
