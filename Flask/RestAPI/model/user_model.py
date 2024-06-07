import mysql.connector
import json

from flask import make_response
class user_model():
    def __init__(self):    
    # connection establishment
        try:
            self.con=mysql.connector.connect(host="localhost",username="root",password="123456",database="flask_db")
            self.con.autocommit=True
            self.cur=self.con.cursor(dictionary=True)
            print("success db")
        except:
            return "this is user_signup_model"
             
    def user_getall_model(self):
        self.cur.execute("SELECT * FROM userinfo")
        result=self.cur.fetchall()
        # print(result)
        if(len(result)>0):
            res=make_response({"payload":result},200)
            res.headers['Access-Control-Allow-Origin']="*"
            return res
        else:
            return make_response({"message": "No data found"},204)
        
    def user_addone_model(self,data):
        self.cur.execute(f"INSERT INTO userinfo(name,phone,email,password,role) values('{data['name']}','{data['phone']}','{data['email']}','{data['password']}','{data['role']}' )")
        
        print(data)
        # as it is dictionary data["email"]
        return make_response({"message":"user created succesfully"},201)
    
    def user_update_model(self,data):
        self.cur.execute(f"UPDATE userinfo SET name='{data['name']}', phone='{data['phone']}', email='{data['email']}', password='{data['password']}', role='{data['role']}' WHERE id = {data['id']}")

        if self.cur.rowcount>0:
            return make_response({"message":"user updated"},201)
        else:
            return make_response({"message":"nothing to update"},202)
        
    def user_delete_model(self,id):
        self.cur.execute(f"DELETE FROM userinfo WHERE id = {id}")

        if self.cur.rowcount>0:
            return make_response({"message":"user deleted"},200)
        else:
            return make_response({"message":"nothing to delete"},202)
    
    
