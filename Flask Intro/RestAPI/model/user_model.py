import mysql.connector
import json
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
            return json.dumps(result)
        else:
            return "no data found"
        
    def user_addone_model(self,data):
        self.cur.execute(f"INSERT INTO userinfo(name,phone,email,password,role) values('{data['name']}','{data['phone']}','{data['email']}','{data['password']}','{data['role']}' )")
        
        print(data)
        # as it is dictionary data["email"]
        return "user created succesfully"
    
    
    
