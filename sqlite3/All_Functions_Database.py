import sqlite3
conn=sqlite3.connect('allFunctionDB.db')
cur=conn.cursor()

cur.execute("""CREATE TABLE allFunctionDB (
                first_name text,
                last_name text,
                email text 
            )""")


def show_all():
    conn=sqlite3.connect('allFunctionDB.db')
    cur=conn.cursor()
    cur.execute("SELECT rowid,* FROM allFunctionDB")
    items=cur.fetchall()
    for i in items:
        print(i)
    conn.commit()
    conn.close()


def add_record(first,last,email):
    conn=sqlite3.connect('allFunctionDB.db')
    cur=conn.cursor()
    cur.execute("INSERT INTO allFunctionDB Values(?,?,?)",(first,last,email))    
    items=cur.fetchall()
    for i in items:
        print(i)
    conn.commit()
    conn.close()
    

def delete_record(id):
    conn=sqlite3.connect('allFunctionDB.db')
    cur=conn.cursor()
    # id will be consdiered as string so we need to put the input as string so use f string 
    cur.execute(f"DELETE from allFunctionDB where rowid={id}")    
    conn.commit()
    conn.close()  
    
def add_many_record(list):
    conn=sqlite3.connect('allFunctionDB.db')
    cur=conn.cursor()
    cur.executemany("INSERT INTO allFunctionDB Values (?,?,?)",(list))    
    items=cur.fetchall()
    for i in items:
        print(i)
    conn.commit()
    conn.close()
    














