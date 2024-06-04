+++
title = 'Adding a full page background image to any web page.'
date = 2024-06-04T08:16:35+01:00
draft = true
tags = ["html", "css", "code", "web", "web browser", "dev",]
+++

One of the easiest ways to create a visually appealing web page is by adding a background image that covers the entire viewport. This technique can transform your website's aesthetics, making it more engaging. 

> Before you begin, ensure you have a high-quality image  stored in your project directory. For this example, i'm going to use an image located at `imgs/whatever.jpg`.

Start off by locating your CSS file, usually named `styles.css` or something similar, and open it in your editor of choice. Once open, go ahead and insert the CSS code below at the top of your `.css` file. This code will set the background image and ensure that it covers the entire viewport, while also keeping it fixed during scrolling.

   ```css
   html { 
       background: url(imgs/whatever.jpg) no-repeat center center fixed; 
       -webkit-background-size: cover;
       -moz-background-size: cover;
       -o-background-size: cover;
       background-size: cover;
   }
   ```

> Make sure to update the `url(imgs/whatever.jpg)` part of the code to match the path of your own image. If your image is located in a different directory or has a different name, adjust the path accordingly.

#### **Understanding the CSS Code..**

- `html`: This selector targets the entire HTML document, ensuring the background image covers the entire page.
- `background`: The `url()` function specifies the path to the image. The `no-repeat` value prevents the image from repeating, `center center` centers the image, and `fixed` ensures the image stays in place during scrolling.
- `background-size: cover`: This property ensures the background image covers the entire viewport, maintaining its aspect ratio. The `-webkit-`, `-moz-`, and `-o-` prefixes ensure compatibility with various browsers.