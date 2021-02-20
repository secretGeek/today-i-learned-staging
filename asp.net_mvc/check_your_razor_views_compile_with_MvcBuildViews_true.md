# Check Your Razor Views Compile with MvcBuildViews=true

Instead of finding out in production that a particular view no longer compiles due to a refactoring... have the visual studio build system verify that the views compile during build.

Edit the `.csproj` file and set this:


	<MvcBuildViews>true</MvcBuildViews>

(it defaults to false)


And, according to my sources: 


> Note that this won't compile your views into a .dll file, this action will only check them for any compile time errors
>
>  [Tugberk](https://www.tugberkugurlu.com/archive/how-to-detect-errors-of-our-asp-net-mvc-views-on-compile-time-blow-up-in-my-face-theory)


## Source

- [How to Detect Errors of Our ASP.NET MVC Views on Compile Time - Blow up In My Face Theory](https://www.tugberkugurlu.com/archive/how-to-detect-errors-of-our-asp-net-mvc-views-on-compile-time-blow-up-in-my-face-theory)