import os
from dotenv import load_dotenv
load_dotenv() 

from supabase import create_client

# Directly set your Supabase URL and Key


# Fetch environment variables or use the directly set values
url = os.environ.get("SUPABASE_URL")
key = os.environ.get("SUPABASE_KEY")

# Create a Supabase client
client = create_client(url, key)


# insert the data 
# data = client.table("userData").insert({"name":"User2"}).execute()

# Example usage: Fetching data from a table
# response = client.table("userData").select("*").execute()

# # filtering the data
# response = client.table("userData").select("*").eq("name","2").execute()


# update the data 
# data = client.table("userData").update({"name":"user1"}).eq("id", 1).execute()

# delete the data 
data = client.table("userData").delete().eq("id", 1).execute()

# Example usage: Fetching data from a table
response = client.table("userData").select("*").execute()


print(response)

