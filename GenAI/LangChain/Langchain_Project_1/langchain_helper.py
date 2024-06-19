from langchain.llms import OpenAI
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain
from langchain.agents import load_tools
from langchain.agents import initialize_agent


from dotenv import load_dotenv
import os

load_dotenv()

def generate_name(animal_type):
    llm = OpenAI(temperature=0.7)
    
    prompt_template_name = PromptTemplate(
        input_variables=['animal_type','pet_color'],
        template="I have a {animal_type} pet and color of the pet is {pet_color} .I want a cool name for it. Suggest me 2 cool names for my pet."
    )
    # name=llm("Suggest a pet name starting with m")
    name_chain = LLMChain(llm=llm, prompt=prompt_template_name,output_key="pet_name")
    
    response = name_chain.run({'animal_type': animal_type,'pet_color':pet_color}) 
    
    return response

def langchain_agent():
    llm=OpenAI(temperature=0.5)
    tools=load_tools(["wikipedia","llm-maths"],llm=llm)
    agent=initialize_agent(
        tools,llm,agent=AgentType.ZERO_SHOT_REACT_DESCRIPTION,verbose=True
    )
    result=agent.run(
        "What is the average age of a dog? Multiply the age by 3 "
    )
    print(result)
    
    
if __name__ == "__main__":
    # animal_type = "dog"  
    # pet_color="brown"
    # print(generate_name(animal_type,pet_color))
    langchain_agent()

# meaning of temperature 
# Lower temperatures favor exploiting the patterns LLMs have already learned and mastered, making the outputs more predictable and reliable
# higher temperatures encourage exploration, meaning that the LLMs get adventurous.