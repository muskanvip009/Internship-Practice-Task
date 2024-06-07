from app import app 
from model.user_model import user_model
from flask import request
from datetime import datetime
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

@app.route("/user/patch/<id>",methods=["PATCH"])
def user_patch(id):
    return obj.user_patch_model(request.form,id)

@app.route("/user/getall/limit/<limit>/page/<page>",methods=["GET"])
def user_pagination_model(limit,page):
    return obj.user_pagination_model(limit,page)

@app.route("/user/<uid>/upload/avatar",methods=["PUT"])
def user_upload_avatar_controller(uid):
    file=request.files['avatar']
    ext=(file.filename.split("."))[-1]
    uniquefilename=str(datetime.now().timestamp()).replace(".","")
    finalpath=f"uploads/{uniquefilename}.{ext}"
    file.save(f"uploads/{uniquefilename}.{ext}") 
    return obj.user_upload_avatar_controller(uid,finalpath)


    
