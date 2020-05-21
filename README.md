# MillionaireMart

Deployed link (heroku):  https://millionairemart.herokuapp.com/ <br>
Github link: https://github.com/yeddyfit/marketplace-project
<br>

### What is the problem MillionaireMart is trying to solve?
Wealth disparity is very real, and for those that are at the higher end of that wealth distribution, an item that may seem needlessly expensive for the average person, may seem extremely afforable. This coupled with a culture that encourages impulse purchasing, means that there is a real market for selling interesting but expensive items that otherwise would be hard to purchase or source elsewhere on the internet. This is where MillionaireMart steps in. It is place where those with lots of money can easily spend lots of money. 


### Why is it a problem that needs solving?
Some people have very high disposable income, and not a whole lot to spend it on. Not everyone wants to pass all their wealth onto their kids, some people want to spend it. There is an increasing trend amongst older generations, where they are more inclined to want to spend some of their life savings savings rather than just passing it on. This is especially relevant in these current COVID-19 times that we're in, where governements want us to spend to avoid economic collapse. That is why we need places for people to spend money easily. 


<br>

### User Stories
- As a user I can create an account, which saves my address and email. I want this information to be kept safe from others. 
- As a user I want to be able to login/logout, as well as edit my accounts details.
- As a user without an account, I want to be able to view collections and listings.
- As a user I want to be able to view all listings within collections, or view all without category filtering.
- As a user with an account I want to be able to create collections, and delete or edit those collections which I've created.
- As a user with an account I want to be able to create listings that belong to a collection, that have a price, title and description.
- As a user with an account I want to be able to edit/delete listings that I've created. 
- As a user can view listings with collections/categories, or they can see all listings at once.
- As a user with an account I want to be able to purchase listed items in a safe way. 
- As a user with an account I want to be able to view all successful orders that I've purchased.

<br>




### Wireframes and ERD
![Home page mockup](../docs/marketplace_wireframes/New%20Wireframe%201.png)
![Collections page mockup](../docs/marketplace_wireframes/New%20Wireframe%202.png)
![Collection page mockup](../docs/marketplace_wireframes/New%20Wireframe%203.png)
![Listings page mockup](../docs/marketplace_wireframes/New%20Wireframe%204.png)
![Listing page mockup](../docs/marketplace_wireframes/New%20Wireframe%205.png)
![About page mockup](../docs/marketplace_wireframes/New%20Wireframe%206.png)

<br>

### App Description
##### Purpose
MillionaireMart is a two-way marketplace, for those with very high disposable incomes. It aims to provide interesting but rare products and service listings that to most would seem needlessly expensive. The purpose of this app is twofold: to allow users to create an account by which they can create listings that belong to a collection, or buy other user's listings.  

The purpose of this app is to provide a two way marketplaces, that brings together the discounts/sales of established businesses, and customers looking for discounts. It aims to help local businesses compete on a more global front, and dampen the impact of stock inefficiences by offering a plcae to sell discounted products to a consumer base that expect as such.

##### Functionality/features
MillionaireMart has the following features:
- Users can create an account, using the gem devise, which ensures the safe handling of provided user information. This account holds profile information that helps with smooth handling of purchases.
- Profile information can be edited post-creation, as well as deleted. 
- Those users with accounts can purchase others listings, or create their own listings to sell. These listings can have: a tile, description, image, and price. 
- Users can create collections, that have: a title, description and image. Listings can then be added to these collections.
- These listings and collections have set user scope, so that only those who created the listing/collection can edit or delete them. 
- Users can view collections and listings despite not having an account.
- The website handles secure purchasing of items through stripe if an account has been created.
- Users can track completed orders they've made.
<br>


##### Sitemap
![Sitemap](../docs/millionaireMart%20Sitemap.jpeg)
<br>

##### Screenshots
Home
![Screenshot1](../docs/screenshots/screenshot1.png)
Collections Page
![Screenshot2](../docs/screenshots/screenshot2.png)
Listing page
![Screenshot3](../docs/screenshots/screenshot3.png)
Collection Page
![Screenshot5](../docs/screenshots/screenshot5.png)
About/Contact Page
![Screenshot4](../docs/screenshots/screenshot4.png)
<br>

##### Target Audience
The target audience is for those with very high disposable incomes/wealth, that are prone to impulse purchasing interesting and unique products/services.
<br>

##### Tech Stack
The actual app utilises the following stack:
- Ruby 2.7.0, with gems: Devise, Ultrahook, Stripe, and aws-sdk-s3
- Ruby on Rails
- HTML
- CSS/SCSS, and bootstrap
- PostgreSQL
- Javascript
- Amazon S3
- Heroku
- Stripe

These tools were also used to help with creating the app:
- DBeaver
- Balsamiq
- VS Code
- Github
- Trello
- LucidChart
<br>

### Components
MVC; rails; two-sided marketplace.
Postgresql data sanitisation.
Devise, and dependent site functionality; proper handling of sensitive information.

Devise 

#### Model/DB Relationships
##### DB Schema Design
![ERD](../docs/marketplace_ERD.png)
<br>

MillionaireMart utilises PostgreSQL for its database management, and has four tables that it employs within this database. These tables are: users; collections; listings; and orders. <br>

The active record associations/relationships between said tables are set up in the following way:
- A *user* `has_many` listings, collections, and orders, which arte all`dependent: :delete_all` meaning they get deleted when users are deleted.
- A *listing* `belongs_to` a user and collection. It also `has_many` orders, which are `dependent: :delete_all` meaning orders get deleted when listings are deleted.
- A *collection* `belongs_to` a user; and has_many listings, which are `dependent: :delete_all` meaning listings in the categories get deleted when collections are deleted.
- An *order* `belongs_to` a user and a listing.




#### Task Management Process
Once I'd figured out the idea I was going with, I set out some basic user stories to determine the basic functionality I wanted the app to have. From here I set up a trello board employing a very basic kanban setup, seperating tasks into to-do, in-progress, completed and potential-task categories. This was checked next to the task requirements to ensure all requirements were met. This setup in progress can be seen in the image below. 

![Trello Screenshot](../docs/marketplace_trello_board.png)

From there I set out the model I was going to go with, using the website `lucidCharts.com`.
Then very basic wireframes were designed for both web and mobile views, using the application `balsamiq`. The outcomes of both these processes have been provided in sections that can be seen above. 



### Third Party Services
MillionaireMart relies on the following third party services:

- *Amazon S3* for cloud-based listing/collection photo storage.
- The gem *Devise* for user authentication. This gem ensures sesnitive data is protection, whicle also providing inbuilt functions to help make the process of user management easier across the application.
- *Stripe* and its associated gem for payment handling, which ensures that paymenst are conducted in a safe and secure way.
- *Bootstrap* is a CSS Framework that helps to make styling a smoother and easier process. 
- *Heroku* for app deployment
- *Ultrahook* and its associated gem for managing stripe payment success calls
- *Faker* gem for generating fake data for use in the seed file.
- 








