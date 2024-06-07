from app import app 
from model.user_model import user_model
from flask import request


obj=user_model()
@app.route("/user/getall")
def user_get_controller(): 
    return obj.user_getall_model()

@app.route("/user/addone",methods=["POST"])
def user_get_addone():
    return obj.user_addone_model(request.form)

@app.route("/user/update",methods=["PUT"])
def user_update_addone():
    return obj.user_update_model(request.form)

@app.route("/user/delete/<id>",methods=["DELETE"])
def user_delete_addone(id):
    return obj.user_delete_model(id)
