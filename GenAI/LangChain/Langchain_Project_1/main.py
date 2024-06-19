import langchain_helper as lch
import streamlit as st

st.title("Pets name generator")


user_animal_type=st.sidebar.selectbox("What is your pet ?",("Cat","Dog","Cow","Hamster"))

if user_animal_type=="Cat":
    pet_color=st.sidebar.text_area(label="What color is your cat?",max_chars=15)
if user_animal_type=="Dog":
    pet_color=st.sidebar.text_area(label="What color is your dog?",max_chars=15)
if user_animal_type=="Cow":
    pet_color=st.sidebar.text_area(label="What color is your cat?",max_chars=15)
if user_animal_type=="Hamster":
    pet_color=st.sidebar.text_area(label="What color is your cat?",max_chars=15)

if pet_color:
    response=lch.generate_name(user_animal_type,pet_color)
    st.text(response['pet_name'])

# streamlit run main.py -> to make interface template 