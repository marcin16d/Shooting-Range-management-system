# I Defining the design task

The main goal of the project is to create a shooting range database storing, among others: customers,
instructors, shooting ranges, firearms, available packages, information about competitions, etc. 
Customers can use the shooting range after selecting the package that suits them. 
The offer can be used not only by individual customers but also by competitors, children and teenagers

# II User requirements analysis

1) **Customer** – The person purchasing the package, which includes the price, number of shots and weapon.
Before choosing a package, the customer must provide his or her personal data.
He does not directly select the weapon he wants to shoot with because the choice of weapon depends on the selected package.
The instructor is assigned to the client automatically. It is possible that the client will not be able to use the shooting range, e.g. due to competitions taking place.

   * Can choose one of many available packages
   * If he is at the shooting range for the first time, he creates his own account
   * You have the right to update your account details
   * May benefit from advanced levels of training
   * If the customer is a minor, the selection of packages is limited

3) **Seller** - Seller presents available packages to the customer and sells them for a specific price.
Checks customer data and enters it into the database. Based on them, it presents available packages to him.
It can remove and, if necessary, correct errors existing in the database.

   * Provides information about the available offer
   * Sells available packages to customers
   * Enters customer data into the database
   * Informs the client about the assigned instructor
   * Manages the shooting range database

3) **Instructor** – Explains to the client the rules of using the shooting range. How to load and aim a gun.
Responsible for initial client training. She teaches him how to use weapons safely. More advanced training is possible.

   * It is automatically assigned to the customer
   * Familiarizes the client with the rules applicable at the shooting range
   * Assists client through basic firearms training
   * At the client's request, he provides advanced training in using weapons for an additional fee.

4) **Competitor** – Part of a 4-person team. He can participate in training under the supervision of his trainer. 
For players, the price for participating in training is reduced. 
He takes part in shooting competitions in groups of 4. His data is collected in a database.

   * Participates in his team's training sessions
   * The weapon he uses depends on the rules of the competition
   * The team coach is responsible for the training and preparation of players.


# III. Function identification

**1) Customer management**
      The system allows you to create unique accounts for customers.
      The customer can manage his or her personal profile.

Functionality summary:
   * Registration 
   * Customer registration
   * Login
   * Customer login
   * Personal profile management
   * Password change
   * Viewing the history of purchased packages
   * Preview of shot history and statistics

**2) Presentation of the shooting range offer**
      The customer can browse available weapons, shooting packages and other services and check detailed information.
 
Functionality summary:
   * Presentation of the shooting range offer
   * Presentation of available weapons and their price lists
   * Presentation of shooting packages
   * Presentation of shooting range rental services
  
**3) Support for sports competitions**

   A team of 4 Competitors may register - and take part - in competitions organized by the Manager.
   The manager may supervise the course of the competition. 

   Functionality summary:
     1. Organization of the competition
     1. Competition registration
     1. Change of the competition date
     1. Team Registration 

