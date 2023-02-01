# ffxiv_pygmalion

This code is for a chatbot that can participate in conversations in Final Fantasy XIV by responding to tells sent by a specific player (specified by the "master_name" variable). The chatbot utilizes the Pygmalion-6B language model via [KoboldAI UI link](https://github.com/KoboldAI/KoboldAI-Client) to generate responses and maintains a log of all messages exchanged. You can run the model locally (requires 16gb+ of VRAM) or use google's gpus for free with this [collab](https://colab.research.google.com/drive/1ZvYq4GmjfsyIkcTQcrBhSFXs8vQLLMAS)
Note: The host in the code needs to be replaced with your own KoboldAI UI link for the chatbot to function correctly.

With Pygmalion-6B you to customize the personality of the chatbot, comments have been added to the code where you can define these characteristics. The starting message of the conversation heavily influences the way the bot will respond. [Pygmalion Character Creation Tips](https://rentry.org/PygTips)

The code makes use of the HttpRequest function to communicate with the KoboldAI UI link and retrieve the generated responses. It will process tells from the specified player and respond with the generated text. The code also tracks the timestamps of processed messages to avoid duplicates.



