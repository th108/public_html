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
