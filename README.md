# Data-Analytics-on-Passwords-Pattern-of-Users
The password is one of the popular and easy to use authentication mechanism used in the various system for secure and authorized access to information. The users are free to choose a password within a defined set of characters such as uppercase, lowercase, digits, and special symbols (!@#$%^&amp;*() etc.). In this we are analysing password usage from password dataset which is having millions of real users passwords collected from various system breaches.

The password is one of the popular and easy to use authentication mechanism used in the various system for 
secure and authorized access to information. The users are free to choose a password within a defined set 
of characters such as uppercase, lowercase, digits, and special symbols (!@#$%^&*() etc.). In this we are 
analysing password usage from password dataset which is having millions of real users passwords collected 
from various system breaches.

#######	Analysis Task  ###############
a)	Defining and analysing Password Strength
b)	Analysing password frequency
c)	Percentage of passwords having the only lower case letter, the only upper case letter, only digits, and only the special characters. 
d)	Percentage of passwords having only numbers and special characters. 
e)	Percentage of passwords having the length less than eight characters. 
f)	Percentage of passwords having the only combination of uppercase and lowercase letters. 
g)	Find the percentage of passwords for other characters set combination such as uppercase and digits, uppercase and special characters, lowercase and digits etc.. 
h)	Find out the frequency of password i.e. is some passwords are common among users? Show output with suitable and meaningful graphs, charts and other mediums.

#######	Algorithm for Solution ###########

We have defined the password strength (like very strong, strong, medium, week, too week) by different sets of character and length of password as following
Very Strong:
a)	Minimum length 8 characters.
b)	Must contain Upper case character.
c)	Must contain Lower case character.
d)	Must contain Numbers.
e)	Must contain Special Symbols.
Strong:
a)	Minimum length 6 characters.
b)	Must contain Upper or Lower case character.
c)	Must contain Numbers.
d)	Must contain Special Symbols.
Medium:
a)	Minimum length 6 characters.
b)	Must contain either alphabets and special symbols or alphabets and digits or digits and special symbols
Medium:
a)	Minimum length 6 characters.
b)	Must contain either alphabets and special symbols or alphabets and digits or digits and special symbols.
Week:
a)	Minimum length 6 characters.
b)	Must contain alphabets.
Too Week:
a)	If no upper level strength is true then this is applied.


####### Solution  ######

The program file "Data_Analytics_on_Passwords_Pattern_of_Users.R" solved all task given above and 
provide analysis for the same.
