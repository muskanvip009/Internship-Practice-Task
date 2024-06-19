import All_Functions_Database

All_Functions_Database.show_all()
All_Functions_Database.add_record("ram","sharma","ram@gamil.com")
All_Functions_Database.delete_record(1)


stuff=[
    ('wes','brown','wes@gmail.com'),
    ('tim','horton','tim@gmail.com'),
    ('roe','sho','roe@gmail.com')
]

All_Functions_Database.add_many_record(stuff)

All_Functions_Database.show_all()
