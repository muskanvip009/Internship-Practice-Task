import mysql.connector
import json
from datetime import datetime,timedelta
from flask import make_response
import jwt



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
    
    def user_patch_model(self,data,id):
        qry="UPDATE userinfo SET "
        # print(data)        
        for key in data:
            qry += f"{key}='{data[key]}',"
        qry=qry[:-1] + f" where id={id}"
        self.cur.execute(qry)
        if self.cur.rowcount>0:
            return make_response({"message":"user updated"},201)
        else:
            return make_response({"message":"nothing to update"},202)
    
    def user_pagination_model(self,limit,page):
        limit=int(limit)
        page=int(page)
        start=(page*limit)-limit
        qry=f"Select * from userinfo limit {start},{limit}"
        self.cur.execute(qry)
        result=self.cur.fetchall()
        # print(result)
        if(len(result)>0):
            res=make_response({"payload":result,"page":page,"start":start},200)
            res.headers['Access-Control-Allow-Origin']="*"
            return res
        else:
            return make_response({"message": "No data found"},204)   
        
    def user_upload_avatar_controller(self,uid,filepath):
        self.cur.execute(f"update userinfo set avatar='{filepath}' where id={uid}")
        if self.cur.rowcount>0:
            return make_response({"message":"file upload"},201)
        else:
            return make_response({"message":"nothing to update"},202)    
    def user_login_model(self,data):
        self.cur.execute(f"select id,name,email,phone,password,avatar,role_id from userinfo where email='{data['email']}' and password='{data['password']}' ")
        result=self.cur.fetchall()
        userdata=result[0]
        exp_time=datetime.now() + timedelta(minutes=15)
        exp_epoch_time=int(exp_time.timestamp())
        payload={
            "payload":userdata,
            "exp":exp_epoch_time
        }
        jwttoken=jwt.encode(payload,"muskan",algorithm="HS256")
        return make_response({"token":jwttoken},200)            
    