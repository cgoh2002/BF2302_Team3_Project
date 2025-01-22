using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;


namespace BF2302_Team3_Project
{
    public class Chat
    {
        private readonly string _apiBaseUrl = "https://api.openai.com/v1"; // Replace with the actual ChatGPT API base URL
        private readonly string _apiKey = "your-api-key"; // Replace with your API key

        public Chat()
        {
            // Optional: Initialize any required dependencies
        }

        /// <summary>
        /// Sends a question to the ChatGPT API and retrieves the response.
        /// </summary>
        /// <param name="question">The user's question.</param>
        /// <returns>The response from ChatGPT.</returns>
        public async Task<string> GetResponseAsync(string question)
        {
            if (string.IsNullOrWhiteSpace(question))
            {
                throw new ArgumentException("Question cannot be null or empty.", nameof(question));
            }

            using (var client = new HttpClient())
            {
                // Set up the request headers
                client.DefaultRequestHeaders.Add("Authorization", $"Bearer {_apiKey}");

                // Create the request body
                var requestBody = new
                {
                    model = "text-davinci-003", // Replace with the correct model name
                    prompt = question,
                    max_tokens = 150
                };

                var jsonRequest = JsonConvert.SerializeObject(requestBody);
                var content = new StringContent(jsonRequest, Encoding.UTF8, "application/json");

                // Make the API call
                var response = await client.PostAsync($"{_apiBaseUrl}/completions", content);

                if (!response.IsSuccessStatusCode)
                {
                    throw new Exception($"Error from ChatGPT API: {response.ReasonPhrase}");
                }

                var jsonResponse = await response.Content.ReadAsStringAsync();
                var responseObject = JsonConvert.DeserializeObject<ChatGPTResponse>(jsonResponse);

                return responseObject?.Choices?[0]?.Text?.Trim() ?? "No response from ChatGPT.";
            }
        }
    }

    /// <summary>
    /// Represents the response from the ChatGPT API.
    /// </summary>
    public class ChatGPTResponse
    {
        public List<Choice> Choices { get; set; }
    }

    public class Choice
    {
        public string Text { get; set; }
    }
}