+++
title = 'A common mistake made when coding a hamburger menu.'
date = 2024-06-04T08:16:35+01:00
draft = true
tags = ["html", "css", "code", "web", "web browser", "dev",]
+++

When it comes to coding a hamburger menu, many developers tend to position the menu absolutely. However, a more efficient approach involves positioning the content rather than the menu itself once the sidebar is opened. By shifting the focus to positioning everything else within the menu, you can achieve a cleaner and more manageable design.  

Most developers initially position the hamburger menu using absolute positioning. While this method works, it can lead to complications and less maintainable code. Absolute positioning often requires additional adjustments and can interfere with other elements on the page, especially when dealing with responsive designs.  

A more effective strategy is to position the content within the menu instead of the menu itself. By doing so, you maintain a more organized structure and simplify the process of managing and updating the menu. This method also ensures better alignment and integration with the rest of your page elements.

#### HTML

~~~html
<html>
<head></head>
<body>
  <div class="sidebar">Hamburger menu links go here</div>
  <div class="main-content"><button class="hamburger-menu-icon" onClick="toggleSidebar()">🍔</button></div>
</body>
</html>
~~~


#### CSS

```css
/* Arbitrary CSS variable values for explanatory purposes */
:root {
  --sidebar-width: 100px;
  --sidebar-bg-colour: blue;
}

.sidebar {
  display: none;
  position: relative;
  width: var(--sidebar-width);
}

@media (max-width: 767px) {
  html.sidebar-is-open .sidebar {
    display: block; 
     /* 
      The sidebar is just rendered in default position,
      as it appears in the document flow
     */
  }

  html.sidebar-is-open .main-content {
    position: fixed; 
    /* 
     It is the main content that is positioned. 
     This is the crux of the implementation. The rest is all sugar.

     Cons: the body will scroll to the top, losing your user's scroll position
    */

    /* prevents resizing from its original full-screen width */
    bottom: 0;
    left: 0;
    right: 0;
    top: 0;
    width: 100%; 

    overflow: hidden;
  }

  /* Optional enhancement: 
     make the overscroll on iPhone the same colour as the sidebar */
  html.sidebar-is-open body {
    background-color: var(--sidebar-bg-colour);
  }
  .sidebar {
    background-color: var(--sidebar-bg-colour);
  }
}

const documentElement = document.querySelector("html");
const contentElement = document.querySelector(".main-content");
const sidebarElement = document.querySelector(".sidebar");
const sidebarIsOpen = () => documentElement.classList.contains("sidebar-is-open");

const openSidebar = () => {
  /* How you trigger the change is up to you */
  documentElement.classList.add("sidebar-is-open");
};

const closeSidebar = () => {
  documentElement.classList.remove("sidebar-is-open");

  /* Sidebar is closed, so keeping event listener is just a waste of resources
     and source of bugs if openSidebar() is run again */
  contentElement.removeEventListener("click");
};

const toggleSidebar = () => {
  sidebarIsOpen() ? closeSidebar() : openSidebar();
};
```