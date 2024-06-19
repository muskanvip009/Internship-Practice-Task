# Supabase Learning README

## Overview

This repository is a demonstration of how to use Supabase, an open-source Firebase alternative. The examples provided showcase basic CRUD operations, authentication, and file storage functionalities using the Supabase Python client.

## Prerequisites

- Python 
- Supabase account
- `dotenv` package to manage environment variables

## Setup

1. **Install dependencies:**

   ```bash
   pip install supabase
   pip install python-dotenv
   ```

2. **Create a `.env` file in the root directory and add your Supabase credentials:**

   ```plaintext
   SUPABASE_URL=your_supabase_url
   SUPABASE_KEY=your_supabase_key
   ```

3. **Load environment variables and create a Supabase client:**

   ```python
   import os
   from dotenv import load_dotenv
   from supabase import create_client

   load_dotenv()

   url = os.environ.get("SUPABASE_URL")
   key = os.environ.get("SUPABASE_KEY")

   client = create_client(url, key)
   ```

![Sample Creation](https://pcsepacpwttyfcafroqd.supabase.co/storage/v1/object/public/new-bucket/demo1.png?)
![Authentication Rules ](https://pcsepacpwttyfcafroqd.supabase.co/storage/v1/object/public/new-bucket/demo2.png?)



## Usage

### Basic CRUD Operations

1. **Insert Data:**

   ```python
   data = client.table("userData").insert({"name": "User2"}).execute()
   ```

2. **Fetch Data:**

   ```python
   response = client.table("userData").select("*").execute()
   print(response)
   ```

3. **Filter Data:**

   ```python
   response = client.table("userData").select("*").eq("name", "User2").execute()
   print(response)
   ```

4. **Update Data:**

   ```python
   data = client.table("userData").update({"name": "User1"}).eq("id", 1).execute()
   ```

5. **Delete Data:**

   ```python
   data = client.table("userData").delete().eq("id", 1).execute()
   ```

### Authentication

1. **Sign Up:**

   ```python
   from gotrue.errors import AuthApiError

   credentials = {
       "email": "your-email@example.com",
       "password": "your-password"
   }

   # user = client.auth.sign_up(credentials)
   # print(user)
   ```

2. **Sign In:**

   ```python
   try:
       session = client.auth.sign_in_with_password(credentials)
   except AuthApiError:
       print("Wrong password")

   data = client.table("userData").select("*").execute()
   print("Data after sign in:", data)
   ```

3. **Sign Out:**

   ```python
   client.auth.sign_out()
   ```

### File Storage

1. **Fetch Public URL of a File:**

   ```python
   from gotrue.errors import AuthApiError

   bucket_name = "new-bucket"
   file_path = "1.jpg"  # specify the path to your file in the bucket

   try:
       public_url = client.storage.from_(bucket_name).get_public_url(file_path)
       print("Public URL:", public_url)
   except AuthApiError as e:
       print("An error occurred:", e)
   ```


For Better Clearity I refer to the supabase official docs 
https://supabase.com/docs
https://supabase.com/docs/reference/python/installing