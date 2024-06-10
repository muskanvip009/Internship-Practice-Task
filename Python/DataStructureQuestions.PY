"""
Question 1 
Purpose - Usage of Dicitonary 
Problem Statement 
Design a food rating system that allows the modification of ratings for food items and the retrieval of the highest-rated food item for a specific cuisine. Implement the FoodRatings class with the following functionalities:

Initialization:

FoodRatings(String[] foods, String[] cuisines, int[] ratings): Initializes the system with food items described by foods, cuisines, and ratings, all of which have a length of n. Each food item is characterized by:
foods[i]: The name of the ith food.
cuisines[i]: The type of cuisine of the ith food.
ratings[i]: The initial rating of the ith food.
Change Rating:

void changeRating(String food, int newRating): Changes the rating of the food item with the name food to newRating.
Highest Rated Food:

String highestRated(String cuisine): Returns the name of the food item with the highest rating for the given type of cuisine. If there is a tie, it returns the item with the lexicographically smaller name."""


from sortedcontainers import SortedSet

class FoodRatings:
    def __init__(self, foods, cuisines, ratings):
        """
        Initialize the FoodRatings system with given lists of foods, cuisines, and ratings.
        :param foods: List of food names.
        :param cuisines: List of cuisines corresponding to each food.
        :param ratings: List of initial ratings for each food.
        """
        # Maps cuisine to a sorted set of (rating, food) tuples
        self.cuisine_to_foods = {}
        # Maps food to its current rating
        self.food_to_rating = {}
        # Maps food to its cuisine
        self.food_to_cuisine = {}
        
        # Initialize the mappings
        for food, cuisine, rating in zip(foods, cuisines, ratings):
            if cuisine not in self.cuisine_to_foods:
                self.cuisine_to_foods[cuisine] = SortedSet(key=lambda x: (-x[0], x[1]))
            self.cuisine_to_foods[cuisine].add((rating, food))
            self.food_to_rating[food] = rating
            self.food_to_cuisine[food] = cuisine
    
    def changeRating(self, food, newRating):
        """
        Change the rating of a given food.
        
        :param food: The name of the food to change the rating for.
        :param newRating: The new rating value.
        """
        cuisine = self.food_to_cuisine[food]
        oldRating = self.food_to_rating[food]
        # Remove the old (rating, food) tuple
        self.cuisine_to_foods[cuisine].discard((oldRating, food))
        # Add the new (rating, food) tuple
        self.cuisine_to_foods[cuisine].add((newRating, food))
        # Update the food's rating
        self.food_to_rating[food] = newRating
    
    def highestRated(self, cuisine):
        """
        Get the highest-rated food for a given cuisine.
        
        :param cuisine: The type of cuisine.
        :return: The name of the highest-rated food for the given cuisine.
        """
        return self.cuisine_to_foods[cuisine][0][1]

# Example usage
if __name__ == "__main__":
    # Initialize the FoodRatings object
    foodRatings = FoodRatings(
        ["kimchi", "miso", "sushi", "moussaka", "ramen", "bulgogi"],
        ["korean", "japanese", "japanese", "greek", "japanese", "korean"],
        [9, 12, 8, 15, 14, 7]
    )
    
    # Display the highest rated food for each cuisine
    print(foodRatings.highestRated("korean"))  # Output: "kimchi"
    print(foodRatings.highestRated("japanese"))  # Output: "ramen"
    
    # Change the rating of "sushi" and check the highest rated food again
    foodRatings.changeRating("sushi", 16)
    print(foodRatings.highestRated("japanese"))  # Output: "sushi"
    
    # Change the rating of "ramen" and check the highest rated food again
    foodRatings.changeRating("ramen", 16)
    print(foodRatings.highestRated("japanese"))  # Output: "ramen"





