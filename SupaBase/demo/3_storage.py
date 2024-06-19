import os
from dotenv import load_dotenv
from supabase import create_client
from gotrue.errors import AuthApiError

# Load environment variables from .env file
load_dotenv()

# Fetch environment variables or use the directly set values
url = os.environ.get("SUPABASE_URL")
key = os.environ.get("SUPABASE_KEY")

# Create a Supabase client
client = create_client(url, key)

# Fetch the public URL for a file in the 'new-bucket' bucket
bucket_name = "new-bucket"
file_path = "1.jpg"  # specify the path to your file in the bucket

try:
    # Get the public URL of the file
    public_url = client.storage.from_(bucket_name).get_public_url(file_path)
    print("Public URL:", public_url)
except AuthApiError as e:
    print("An error occurred:", e)
