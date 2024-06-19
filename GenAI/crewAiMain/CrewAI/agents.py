from crewai import Agent
from dotenv import load_dotenv
from tools import tool 


load_dotenv()

from langchain_google_genai import ChatGoogleGenerativeAI

import os 
llm =ChatGoogleGenerativeAI(model="gemini-pro",
                            verbose=True,
                            google_api_key=os.getenv("GOOGLE_API_KEY"))
# creating senior researcher agent with memry and verbose mode 

news_researcher=Agent(
    role="Senior Researcher",
    goal="Uncover ground breaking technologies in {topic}",
    verbose=True,
    memory=True,
    backstory=(
        "Driven by curiosity, you're at the forefront of innovation, ager to explore and share knowledge that could change the world "
    ),
    tools=[tool],
    llm=llm,
    allow_delegation=True
)

#  agent that write the new blogger 
news_writer = Agent(
  role='Writer',
  goal='Narrate compelling tech stories about {topic}',
  verbose=True,
  memory=True,
  backstory=(
    "With a flair for simplifying complex topics, you craft"
    "engaging narratives that captivate and educate, bringing new"
    "discoveries to light in an accessible manner."
  ),
  tools=[tool],
  llm=llm,
  allow_delegation=False
)
