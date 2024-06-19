import sqlite3


# connecting the db in memory 
# conn=sqlite3.connect(':memory:')


# formation of a database 
conn=sqlite3.connect('customer.db')


# create a cursor
cur=conn.cursor()

# creating a table in database 
#   """ is used to make space in between otherweise single is valid but we need to write in a single line without spaces 
# cur.execute("""CREATE TABLE customers (
#                 first_name text,
#                 last_name text,
#                 email text 
#             )""")
# datatype -> null,integer,real,text,blob

# INSERT ONE ROW IN DATA 
# cur.execute("INSERT INTO customers VALUES('Johny','dep','johnny@gmail.com')")


# Insert many customers
# many_cus=[
#     ('wes','brown','wes@gmail.com'),
#     ('tim','horton','tim@gmail.com'),
#     ('roe','sho','roe@gmail.com'),   
# ]
# cur.executemany("INSERT INTO customers VALUES(?,?,?)",many_cus)


# query the db

# cur.execute("SELECT rowid,* FROM customers")
# rowid is automatically present in each table as a primary key 

# print(cur.fetchall())   #for all rows 
# print(cur.fetchone()[0])


# to print the item one by one 
# items=cur.fetchall()
# for i in items:
#     print(i)

# where clause 
# cur.execute("SELECT rowid,* FROM customers where last_name='def'")

# update records 
# cur.execute(""" 
#             UPDATE customers SET first_name='mary'
#             WHERE rowid=1
#             """)
# conn.commit()

# cur.execute("SELECT rowid,* FROM customers")
# print(cur.fetchall())

# Delete the record 
# cur.execute("DELETE from customers where rowid=5")

# # commit the action
# conn.commit()


# use of order by statement 
cur.execute("SELECT rowid,* FROM customers ORDER BY rowid DESC" )
print(cur.fetchall())

# AND/OR  

cur.execute("SELECT rowid,* FROM customers where rowid=2 and last_name like 'br%' ")
print(cur.fetchall())


# cur.execute("DROP TABLE customers")

conn.commit()
conn.close()
