# FB13207951

Widgets process consumes most of the available memory
----

**What type of feedback are you reporting?**
Incorrect/Unexpected Behavior

**Please describe the issue and what steps we can take to reproduce it:**
Running a simple widget (from an iOS app) which only displays the entry’s date interval consumes up to 26.4MB of memory using the release configuration. 

Widgets have always had a 30MB memory cap which limits what developers can do with just 4MB remaining for their own work. 

The attached sample project demonstrates this issue: 
1. Unzip the sample project 
2. Open the project 
3. Run the widget scheme (set to use the Release configuration) 
4. Observe the memory usage 

The Widgets process should not consume 26 MB by itself, leaving developers with very limited memory resources to work with, before the process is killed by the OS. 

Alternatively, the memory cap for for widgets should be raised, especially considering modern iOS devices have a lot more RAM to work with compared to when widgets were first released with iOS 14. 
