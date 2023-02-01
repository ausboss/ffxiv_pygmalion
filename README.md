# ffxiv_pygmalion

This code is for a chatbot that can participate in conversations in Final Fantasy XIV by responding to tells sent by a specific player (specified by the "master_name" variable). The chatbot utilizes a [KoboldAI UI link](https://colab.research.google.com/drive/1ZvYq4GmjfsyIkcTQcrBhSFXs8vQLLMAS) to generate responses and maintain a log of all messages exchanged. 

This bot uses Pygmalion-6B and allows you to customize the personality of the chatbot, comments have been added to the code that allow you to define its characteristics. The starting message of the conversation can also be defined in the code, which heavily influences the way the bot will respond.

Pygmalion Character Creation Tips: https://rentry.org/PygTips

The code makes use of the HttpRequest function to communicate with the KoboldAI UI link and retrieve the generated responses. It will process tells from the specified player and respond with the generated text. The code also tracks the timestamps of processed messages to avoid duplicates.

Note: The host in the code needs to be replaced with your own KoboldAI UI link for the chatbot to function correctly.

