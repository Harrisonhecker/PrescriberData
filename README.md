**Description:**
This web application was developed by Catherine Quamme and Harrison Hecker during Ohio State University's 2021 Hackathon. It is a solution to the coding challenge proposed by Veeva Systems, which was to build a web application designed to use values provided from a data set and accomplish at least four objectives:
 - Graphically display pharmaceutical prescriber data
 - Report on who the top doctors are based on total prescriptions by product
 - Report on the trend of total prescriptions based on product
 - Predict future top targets based on new prescriptions

The web application was developed using Ruby on Rails for the backend, HTML and CSS for the frontend, and Visual Studios as the developer environment.

**Ruby and Rails Versions:**
Ruby: 2.7.4
Rails: 6.1.4.2

**Additional Gems Utilized:**
The team utilized these gems in addition to those provided by default. They need to be added in order to successfully run the web application.
 - Charktkick (https://chartkick.com/)
 - Roo (https://github.com/roo-rb/roo)
 - ActiveRecord-import (https://github.com/zdennis/activerecord-import)

**How to Run:**
Clone the GitHub repository to a desired location using either https://github.com/Harrisonhecker/PrescriberData.git or git@github.com:Harrisonhecker/PrescriberData.git. Open a command prompt or terminal and type the command <$ rails server>. This will initialize the server to the application. The server is done loading when the last line in the terminal is "Press Ctrl + C to stop." Then navigate to "http://localhost:3000" on an internet browser. At this point, the application is now up and running and can be navigated accordingly.

**Navigation:**
The user can navigate the site by scrolling up and down and viewing the displayed information. They can also hover over specific parts of the graphs available to view additional information. 

There are a total of three different pages: Product Analytics, Doctor Analytics, and State Analytics. Each page provides analysis information relating to its subject. The application defaults to the Product Analytics page. The user can navigate between these pages by using the buttons displayed in the upper left-hand corner of the application.

**Authors:**
Catherine Quamme
Harrison Hecker


NOTE: As the application was designed in response to a challenge by Veeva Systems, the use of the Veeva Systems company logo was *not* prohibited.
