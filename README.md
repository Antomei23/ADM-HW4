# Recommendation systems and clustering everywhere
Group #17 HW4\
The aim of this work is to implement a recommendation system.
## Scripts description
* `mainGroup17.ipynb`: The notebook contains the whole project points:
  * **1. Recommendation sytem**
  * 1.1 At the beginning we want to reorganize the dataset, changing some variable in a way that we can work with, and also we want to group all visits to the same movie and add a feature 'clicks' that counts these visits.
  * 1.2 We want to create the basement for the LSH algorithm, to do it we need to create some buckets where we can find the users that are most similar, and to do this we will use a signature matrix and some Hash function that will divide the users in this buckets.
  * 1.3 LSH algorithm that will suggest the film to an user using the 2 most similar to him.
  * **2. Grouping Users together!**

  * **4. Command Line Question**: the content of the script file for an easy and more practical view of the code, and a little comment.
  * **5. Algorithmic Question**: contains the first, yet inefficient, algorithm to find in which order Federico should take the exams in order to achieve the maximum score; the optimized version of the algorithm that computes the maximum score possible and the ChatGPT optimized version. 

* `Commandline.sh`: the executable script file for the question 4
* `commandline.png`: the screen of the results of the question 4
