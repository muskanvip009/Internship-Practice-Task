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
    
    def user_update_model(self,data):
        self.cur.execute(f"UPDATE userinfo SET name='{data['name']}', phone='{data['phone']}', email='{data['email']}', password='{data['password']}', role='{data['role']}' WHERE id = {data['id']}")

        if self.cur.rowcount>0:
            return "user updated"
        else:
            return "nothing to update"
        
    def user_delete_model(self,id):
        self.cur.execute(f"DELETE FROM userinfo WHERE id = {id}")

        if self.cur.rowcount>0:
            return "user deleted"
        else:
            return "nothing to delete"  
    
    
