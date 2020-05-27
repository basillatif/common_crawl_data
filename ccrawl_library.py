from comcrawl import IndexClient
import pandas as pd

client = IndexClient()
#client.search("reddit.com/r/MachineLearning/*")
client.search("producthunt.com/posts/*")


client.results = (pd.DataFrame(client.results)
                  .sort_values(by="timestamp")
                  .drop_duplicates("urlkey", keep="last")
                  .to_dict("records"))

client.download()

pd.DataFrame(client.results).to_csv("prodhunt.csv")
