# FB13243190

Nested views wrapped in Link cause excessive CPU and memory usage
----

**What type of feedback are you reporting?**
Incorrect/Unexpected Behavior

**Please describe the issue and what steps we can take to reproduce it:**
When multiple nested views are wrapped inside Link, it causes excessive CPU and memory usage. 

The attached sample code reproduces this issue. 
- Open the project
- Run the `widgetsExtension` scheme from the project as-is (pre-configured to use the Release build config)
- Observe spike in CPU and memory usage (this causes a excessive memory usage crash in production builds)
- Stop the run cycle
- Comment out all `Link` declarations, leaving the `Link.Label` as-is, so the content continues to render 
- Run the `widgetsExtension` scheme, and observe no spike in CPU or memory usage 

While the outermost `Link` should always take precedence (this behaviour is correctly observed), SwiftUI should then smartly skip evaluating inner `Link` declarations on only evaluate their labels, at-least for Widgets and complications. 

Built using Xcode Version 15.0 (15A240d) (also observed with XC 15.1 Beta 1) on macOS 14.0 (23A344)
