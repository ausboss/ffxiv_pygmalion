local master_name = "Your Name" --Put your name here
local bot_name = Player.name

processed_messages = {}

local function success(str, header, statuscode)
    local data = json.decode(str)
    if data then
        d("HTTP Request: data valid. Response:")
        local response = data.results[1].text
        local index = string.find(response, "\n")
        local extracted_text = string.sub(response, 1, index - 1)
        SendTextCommand("/r " .. extracted_text)
    end
end
local function failed(str, header, statuscode)
    d("HTTP Request: chat_message invalid. Error:")
    d(str)
end

function chatbot(message)
    local conversation_history =
        me_bot ..
        "'s Persona: a fan of the mmorpg ffxiv, not a bot.\n" .. --add a bio for your character here, more info: https://rentry.org/PygTips
            "<START>\n" .. me_bot .. ": Hey! Whats up? \n" -- Add a starting message. It heavily influences the way the bot will respond
    conversation_history = conversation_history .. "You: " .. message .. "\n"
    --d(conversation_history)
    local prompt = {
        prompt = conversation_history .. bot_name .. ":",
        use_story = false,
        use_memory = false,
        use_authors_note = false,
        use_world_info = false,
        max_context_length = 1818,
        max_length = 50,
        rep_pen = 1.03,
        rep_pen_range = 1024,
        rep_pen_slope = 0.9,
        temperature = 0.98,
        tfs = 0.9,
        top_a = 0,
        top_k = 0,
        top_p = 0.9,
        typical = 1,
        sampler_order = {6, 0, 1, 2, 3, 4, 5}
    }

    local json_chat_message = json.encode(prompt)
    local params = {
        host = "a-example-link-o.trycloudflare.com", --- replace this with your cloudflare link from the collab. do not include https://  COLLAB: https://colab.research.google.com/drive/1ZvYq4GmjfsyIkcTQcrBhSFXs8vQLLMAS 
        path = "/api/v1/generate",
        port = 443,
        https = true,
        method = "POST",
        headers = {["Content-Type"] = "application/json"},
        body = json_chat_message,
        onsuccess = success,
        onerror = failed
    }

    HttpRequest(params)
end
function process_message(line, timestamp)
    local message = string.match(line, master_name .. ":%s*(.+)")
    if message and not processed_messages[timestamp] then
        processed_messages[timestamp] = true
        chatbot(message)
    end
end

local chat_log = GetChatLines()
if chat_log then
    for _, log in pairs(chat_log) do
        if log.code == 13 and string.find(log.line, master_name) then
            process_message(log.line, log.timestamp)
        end
    end
end
