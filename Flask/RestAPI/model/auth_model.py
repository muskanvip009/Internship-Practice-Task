from datetime import datetime, timedelta
from logging import exception
import mysql.connector
import jwt
from flask import request
from flask import make_response, request, json
import re
from functools import wraps
from config.config import dbconfig


class auth_model():
    def __init__(self):    
    # connection establishment
        try:
            self.con=mysql.connector.connect(host=dbconfig["hostname"],username=dbconfig["username"],password=dbconfig["password"],database=dbconfig["database"])
            self.con.autocommit=True
            self.cur=self.con.cursor(dictionary=True)
            print("success db")
        except:
            print("some error")
            
    def token_auth(self, endpoint=""):
        def inner1(func):
            @wraps(func)
            def inner2(*args):
                endpoint=request.url_rule
                print(endpoint)
                authorization=request.headers.get("authorization")
                if re.match("^Bearer *([^ ]+) *$", authorization, flags=0):
                        token = authorization.split(" ")[1]
                        try:
                            jwtdecoded=jwt.decode(token,"muskan",algorithms="HS256")
                        except jwt.ExpiredSignatureError:
                                return make_response({"ERROR":"TOKEN_EXPIRED"},401)
                        role_id=jwtdecoded['payload']['role_id']
                        self.cur.execute(f"select roles from accessibilty_view where endpoint='{endpoint}' ")
                        result=self.cur.fetchall()
                        if(len(result)>0):
                            
                            allowed_role=json.loads(result[0]['roles'])
                            if role_id in allowed_role:
                                return func(*args)
                            else:
                                return make_response({"ERROR":"INVALID ROLE"},404)  
                        else:
                            return make_response({"ERROR":"UNKNOWN_ENDPOINT"},404)
                else:
                    return make_response({"ERROR":"INVALID_TOKEN"}, 401)
                
            return inner2
        return inner1   