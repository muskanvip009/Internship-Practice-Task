from datetime import datetime, timedelta
from logging import exception
import mysql.connector
import jwt
from flask import request
from flask import make_response, request, json
import re
# from functools import wraps


class auth_model():
    def __init__(self):    
    # connection establishment
        try:
            self.con=mysql.connector.connect(host="localhost",username="root",password="123456",database="flask_db")
            self.con.autocommit=True
            self.cur=self.con.cursor(dictionary=True)
            print("success db")
        except:
            print("some error")
            
    def token_auth(self, endpoint):
        def inner1(func):
            def inner2(*args):
                authorization=request.headers.get("authorization")
                if re.match("^Bearer *([^ ]+) *$", authorization, flags=0):
                        token = authorization.split(" ")[1]
                        try:
                            jwtdecoded=jwt.decode(token,"muskan",algorithms="HS256")
                        except jwt.ExpiredSignatureError:
                                return make_response({"ERROR":"TOKEN_EXPIRED"},404)
                        role_id=jwtdecoded['payload']['role_id']
                        self.cur.execute(f"select roles from accessibilty_view where endpoint='{endpoint}' ")
                        result=self.cur.fetchall()
                        if(len(result)>0):
                            print(result)
                            return func(*args)
                        else:
                            return make_response({"ERROR":"UNKNOWN_ENDPOINT"},404)
                else:
                    return make_response({"ERROR":"INVALID_TOKEN"}, 401)
                
            return inner2
        return inner1
    
    