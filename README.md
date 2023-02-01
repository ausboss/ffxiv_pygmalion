# Final Fantasy XIV chatbot
### *ffxiv mmominion subscription required
This code is for a chatbot that can participate in conversations in Final Fantasy XIV by responding to tells sent by a specific player (specified by the "master_name" variable). The code makes use of the HttpRequest function to communicate with a [KoboldAI UI link](https://github.com/KoboldAI/KoboldAI-Client) and uses the [Pygmalion-6B](https://huggingface.co/PygmalionAI) language model to generate responses and also tracks the timestamps of processed messages to avoid duplicates.


### You can run the model locally (requires 16gb+ of VRAM) or use google's gpus for **free** with **this [COLLAB](https://colab.research.google.com/drive/1ZvYq4GmjfsyIkcTQcrBhSFXs8vQLLMAS)** 

*Note: The host in the code needs to be replaced with your own KoboldAI UI link for the chatbot to function correctly.
```lua
local params = {
        host = "https://a-example-link-o.trycloudflare.com", --- replace this with your cloudflare link https://colab.research.google.com/drive/1ZvYq4GmjfsyIkcTQcrBhSFXs8vQLLMAS
        path = "/api/v1/generate",
        port = 443,
```

## Customization
With Pygmalion-6B you can customize the personality of the chatbot, comments have been added to the code where you can define these characteristics. The starting message of the conversation heavily influences the way the bot will respond. A temporary log of all the messages exchanged is stored in a table called processed_messages this is used to genereate better responses. More tips here: [Pygmalion Character Creation Tips](https://rentry.org/PygTips)


