# Quests with WebView2

Things to attempt first are:

1. download and install webview2 and sdk bundle.

2. consider optional components. Gear obsesseed? goto 2.

3. get to a point where you have this code running:

```csharp
// called from Window Constructor after InitializeComponent()
// note: the `async void` signature is required for environment init
async void InitializeAsync()
{
   // must create a data folder if running out of a secured folder that can't write like Program Files
   var env = await  CoreWebView2Environment.CreateAsync(userDataFolder: 	Path.Combine(Path.GetTempPath(),"MarkdownMonster_Browser"));

    // NOTE: this waits until the first page is navigated - then continues
    //       executing the next line of code!
    await webView.EnsureCoreWebView2Async(env);

   if (Model.Options.AutoOpenDevTools)
       webView.CoreWebView2.OpenDevToolsWindow();

   // Almost always need this event for something
   webView.NavigationCompleted += WebView_NavigationCompleted;

   // set the initial URL
   webView.Source = new Uri("https://test.editor/editor.htm");
}
```

...which depends on an implementation of `WebView_NavigationCompleted` -- for example:

```csharp
private void WebView_NavigationCompleted(object sender, Microsoft.Web.WebView2.Core.CoreWebView2NavigationCompletedEventArgs e)
{
    if (e.IsSuccess)
        Model.Url = webView.Source.ToString();

    if (firstload)
    {
        firstload = false;
        webView.Visibility = Visibility.Visible;
    }
}
```