from flask import Flask 
app= Flask(__name__)


@app.route("/")
def welcome():
    return "hi everyone"

@app.route("/home")
def home():
    return "home page"




from controller import *

# from controller import user_controller,product_controller
# import controller.user_controller as user_controller
# import controller.product_controller as product_controller