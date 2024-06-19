import os
from dotenv import load_dotenv
load_dotenv() 

from supabase import create_client
from gotrue.errors import AuthApiError
# Directly set your Supabase URL and Key


# Fetch environment variables or use the directly set values
url = os.environ.get("SUPABASE_URL")
key = os.environ.get("SUPABASE_KEY")

# Create a Supabase client
client = create_client(url, key)

# sign up
credentials = {
    "email": "mskvip003@gmail.com",
    "password": "mskvip1234"
  }

data = client.table("userData").select("*").execute()
print("data before sign in",data)
# there will be no data when used before sign in when the user is authenticated only then we are able to access the select output

# user = client.auth.sign_up(credentials)
# print(user)
# sign in 

try:    
    session= client.auth.sign_in_with_password(credentials)
except AuthApiError:
    print("Incorrect Credentials")

data = client.table("userData").select("*").execute()
print("data after sign in",data)


client.auth.sign_out()

